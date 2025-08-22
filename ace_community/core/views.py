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

from laravel_models.models import Users , Clubs, Players
from core.models import (
    ClubCourt,
    CourtSlotDuration
)

from core.serializers import (
    ClubAddCourtSerializer
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

    def patch(self, request):
        court_uuid = request.query_params.get("uuid")

        if not court_uuid:
            return Response({"error": "court uuid is missing "},status = 400)
        
        try:
            court = ClubCourt.objects.get(uuid = court_uuid , created_by = request.user)
        except ClubCourt.DoesNotExist:
            return Response({"error":"club court does not exist"}, status = 404)
        
        serializer = ClubAddCourtSerializer(instance = court, data = request.data, partial = True)

        if serializer.is_valid():
            serializer.save()
            return Response({"message": "club courts partially updated successfully ","data":serializer.data}, status = 200)
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

