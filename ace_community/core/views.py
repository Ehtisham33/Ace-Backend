from os import stat
import secrets
import uuid
from django.core.exceptions import ValidationError
from django.shortcuts import render
from rest_framework import generics, permissions, status
from rest_framework.exceptions import PermissionDenied
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import action
from django.db import transaction

import json

from laravel_models.models import Users , Clubs, Players
from core.models import (
    ClubCourt,
    CourtSlotDuration,
    CourtSlotPrice,
    PriceSlot,
    PriceList,
    SlotGroup   
)

from core.serializers import (
    ClubAddCourtSerializer,
    PriceSlotSerializer,
    PriceListCreateSerializer
)

# Create your views here.

class AddCourtView(APIView):
    serializer = ClubAddCourtSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user = self.request.user
        court_uuid = request.query_params.get("uuid")

        if court_uuid:
            court_data = ClubCourt.objects.filter(uuid = court_uuid, created_by = user).first()
            if court_data:
                serializer = ClubAddCourtSerializer(court_data)
                return Response({"message": "Specific club court", "data": serializer.data}, status=status.HTTP_200_OK)
            return Response({"error": "Club court does not exist"}, status=status.HTTP_404_NOT_FOUND)

        try:
            club_court = ClubCourt.objects.filter(created_by_id=user.id)
        except ClubCourt.DoesNotExist:
            return Response({"error":"club court does not exist"}, status = 404)
        
        serializer = ClubAddCourtSerializer(club_court, many = True)

        return Response({"courts" :serializer.data})


    def post(self, request):
        serializer = ClubAddCourtSerializer(data = request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response({"message": "Court added successfully", "data": serializer.data}, status=201)
        else:
            return Response({"message":"court not added", "error": serializer.errors} , status =400 )
    
    def put(self , request):
        court_uuid = request.query_params.get("uuid")

        if not court_uuid:
            return Response({"error" : "uuid is missing"}, status = 400)

        try:
            court = ClubCourt.objects.get(uuid = court_uuid, created_by = request.user)
        except ClubCourt.DoesNotExist:
            return Response({"error":"club court does not exist"}, status = 404)
        
        serializer = ClubAddCourtSerializer(instance = court, data = request.data, partial = True)

        if serializer.is_valid():
            serializer.save()
            return Response({"message":"court updated successfully","data":serializer.data}, status= 200)
        else:
            return Response({"error": serializer.errors}, status = 400)

    def delete(self,request):
        court_uuid = request.query_params.get("uuid")

        if not court_uuid:
            return Response({"error":"court uuid is missing"}, status = 400)
        
        try:
            court = ClubCourt.objects.get(uuid = court_uuid , created_by = request.user)
        except ClubCourt.DoesNotExist:
            return Response({"error":"club court does not exist"}, status = 404)
        try:
            court.delete()
            return Response({"message":"successfully court deleted"}, status= 200)
        except Exception as e:
            return Response({"error":{e}}, status= 400)

        
class ToggleStatusCourtView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        user = self.request.user
        court_uuid = request.query_params.get("uuid")

        if not court_uuid:
            return Response({"error":"court uuid is missing"}, status= 404)
        
        court = ClubCourt.objects.filter(uuid = court_uuid , created_by = user).first()
        
        if not court:
            return Response({"error": "Club court does not exist"}, status=status.HTTP_404_NOT_FOUND)
        
        if court.is_active == True:
            court.is_active = False
            court.save()
            return Response({"message":"court status is deactive"}, status = 200)
        if court.is_active == False:
            court.is_active = True
            court.save()
            return Response({"message":"court status is active"}, status = 200)            


class AddSlotView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user = request.user
        slot_group_uuid = request.query_params.get("uuid")

        if not slot_group_uuid:
            return Response({"error": "slot_group_uuid is required"}, status=400)

        slot_group = SlotGroup.objects.filter(uuid=slot_group_uuid, created_by=user).first()
        if not slot_group:
            return Response({"error": "SlotGroup not found"}, status=404)

        slots = PriceSlot.objects.filter(slot_group=slot_group).order_by("days", "start_time")
        slot_serializer = PriceSlotSerializer(slots, many=True)

        return Response({
            "message": "Slot group fetched successfully",
            "data": {
                "slot_group_uuid": str(slot_group.uuid),
                "slots": slot_serializer.data
            }
        }, status=200)

    def post(self, request):
        user = request.user

        try:
            slot_groups_data = json.loads(request.data.get("slot_groups", "[]"))
        except json.JSONDecodeError:
            return Response({"error": "slot_groups is not valid JSON"}, status=400)

        if not isinstance(slot_groups_data, list) or not slot_groups_data:
            return Response({"error": "slot_groups must be a non-empty list"}, status=400)

        created_or_updated_groups = []

        try:
            with transaction.atomic():
                for group_data in slot_groups_data:
                    slot_uuid = group_data.get("slot_uuid")
                    slots = group_data.get("slots", [])

                    if not isinstance(slots, list) or not slots:
                        return Response({"error": "slots must be a non-empty list"}, status=400)

                    # UPDATE
                    if slot_uuid:
                        slot_group = SlotGroup.objects.filter(uuid=slot_uuid, created_by=user).first()
                        if not slot_group:
                            return Response({"error": f"SlotGroup with uuid {slot_uuid} not found"}, status=404)
                        PriceSlot.objects.filter(slot_group=slot_group).delete()
                        slot_group.save()

                    # CREATE
                    else:
                        slot_group = SlotGroup.objects.create(created_by=user)

                    for slot_data in slots:
                        serializer = PriceSlotSerializer(data=slot_data, context={'request': request})
                        serializer.is_valid(raise_exception=True)
                        serializer.save(slot_group=slot_group, created_by=user)

                    # Response block
                    saved_slots = PriceSlot.objects.filter(slot_group=slot_group).order_by("days", "start_time")
                    slot_serializer = PriceSlotSerializer(saved_slots, many=True)

                    created_or_updated_groups.append({
                        "slot_group_uuid": str(slot_group.uuid),
                        "slots": [
                            {
                                "days": slot["days"],
                                "interval_number": slot["interval_number"],
                                "start_time": slot["start_time"][:5],
                                "end_time": slot["end_time"][:5],
                                "is_checked": slot["is_checked"]
                            }
                            for slot in slot_serializer.data
                        ]
                    })

            return Response({
                "message": "Slot groups processed successfully",
                "result": created_or_updated_groups
            }, status=200)

        except Exception as e:
            return Response({"error": f"Slot processing failed: {str(e)}"}, status=400)

    def delete(self, request):
        user = request.user
        slot_group_uuid = request.query_params.get("slot_group_uuid")

        if not slot_group_uuid:
            return Response({"error": "slot_group_uuid is required"}, status=400)

        slot_group = SlotGroup.objects.filter(uuid=slot_group_uuid, created_by=user).first()
        if not slot_group:
            return Response({"error": "SlotGroup not found"}, status=404)

        try:
            slot_group.delete()
            return Response({"message": "SlotGroup deleted successfully"}, status=200)
        except Exception as e:
            return Response({"error": f"Failed to delete: {e}"}, status=400)


class PriceListView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user = request.user
        uuid = request.query_params.get("uuid")

        if uuid:
            price_list = PriceList.objects.filter(uuid=uuid, created_by=user).first()
            if not price_list:
                return Response({"error": "PriceList not found"}, status=404)
            
            data = []
            slot_groups = SlotGroup.objects.filter(price_list=price_list, created_by=user)
            data.append({
                "uuid": str(price_list.uuid),
                "name": price_list.name,
                "default": price_list.default,
                "start_time": str(price_list.start_time),
                "end_time": str(price_list.end_time),
                "is_active": price_list.is_active,
                "slot_groups": [str(sg.uuid) for sg in slot_groups],
            })
            return Response({"message": "Price lists fetched successfully", "data": data}, status=200)

        price_lists = PriceList.objects.filter(created_by=user).order_by("-created_at")
        data = []
        for plist in price_lists:
            slot_groups = SlotGroup.objects.filter(price_list=plist, created_by=user)
            data.append({
                "uuid": str(plist.uuid),
                "name": plist.name,
                "default": plist.default,
                "start_time": str(plist.start_time),
                "end_time": str(plist.end_time),
                "is_active": plist.is_active,
                "slot_groups": [str(sg.uuid) for sg in slot_groups],
            })
        return Response({"message": "Price lists fetched successfully", "data": data}, status=200)

    def post(self, request):
        serializer = PriceListCreateSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            price_list = serializer.save()
            return Response({
                "message": "Price list created successfully",
                "data": serializer.data
            }, status=201)
        else:
            return Response({"error": serializer.errors}, status=400)

    def put(self, request):
        user = request.user
        uuid = request.query_params.get("uuid")
        if not uuid:
            return Response({"error": "PriceList uuid is required"}, status=400)

        price_list = PriceList.objects.filter(uuid=uuid, created_by=user).first()
        if not price_list:
            return Response({"error": "PriceList not found"}, status=404)

        serializer = PriceListCreateSerializer(instance=price_list, data=request.data, partial=True, context={'request': request})
        if serializer.is_valid():
            serializer.save()
            return Response({
                "message": "Price list updated successfully",
                "data": serializer.data
            }, status=200)
        else:
            return Response({"error": serializer.errors}, status=400)

    def delete(self, request):
        user = request.user
        uuid = request.query_params.get("uuid")
        if not uuid:
            return Response({"error": "PriceList uuid is required"}, status=400)

        price_list = PriceList.objects.filter(uuid=uuid, created_by=user).first()
        if not price_list:
            return Response({"error": "PriceList not found"}, status=404)

        try:
            with transaction.atomic():
                SlotGroup.objects.filter(price_list=price_list).update(price_list=None)
                price_list.delete()
            return Response({"message": "PriceList deleted successfully"}, status=200)
        except Exception as e:
            return Response({"error": f"Failed to delete PriceList: {e}"}, status=400)