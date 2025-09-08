import os
from rest_framework.exceptions import ValidationError
from django.db import IntegrityError
from django.db import models
from django.db.models import Model, fields
from rest_framework import serializers
from django.db import transaction
from rest_framework.pagination import PageNumberPagination

import json

from laravel_models.models import Users as user, Clubs
from core.models import (
    ClubCourt,
    CourtSlotDuration,
    CourtSlotPrice,
    PriceSlot,
    PriceList,
    SlotGroup

)

MAX_IMAGE_SIZE_MB = 5

class ClubAddCourtSerializer(serializers.ModelSerializer):
    
    class SlotDurationSerializer(serializers.ModelSerializer):
        class Meta:
            model = CourtSlotDuration
            fields = ['duration']

    slot_durations_input = serializers.JSONField(write_only=True)
    slot_durations = serializers.SerializerMethodField()


    class Meta:
        model = ClubCourt
        fields = ['id','uuid','club','name','surface_type','court_color','court_type',
        'court_size','court_image','select_type','sport','booking_visibility','is_active',
        'buffer_time_btw_slots','private_notes', 'slot_durations','created_by','created_at',
        'updated_at','slot_durations_input'
                
        ]
        read_only_fields = ['id','uuid','club','created_by','created_at','updated_at']

    def get_slot_durations(self, obj):
        return list(obj.courtslotduration_set.values_list('duration', flat=True))
    
    def validate_court_image(self, image):
        if image and image.size > MAX_IMAGE_SIZE_MB * 1024 * 1024:
            raise serializers.ValidationError(f"Image size must be under {MAX_IMAGE_SIZE_MB}MB.")
        return image

        
    def validate_buffer_time_btw_slots(self, value):
        if value !=30:
            raise ValidationError("buffer time between slot must be 30 ")
        
        return value
    
    def validate_slot_durations(self, value):
        # Allow JSON string or Python list
        if isinstance(value, str):
            try:
                value = json.loads(value)
            except json.JSONDecodeError:
                raise ValidationError("slot_durations must be valid JSON.")

        # Ensure it's a list
        if not isinstance(value, list):
            raise ValidationError("slot_durations must be a list of integers.")

        if not value:
            raise ValidationError("court slot durations must be required.")

        invalid_durations = [d for d in value if not isinstance(d, int) or d < 60 or d > 300]

        if invalid_durations:
            raise ValidationError(f"Invalid Court Slot durations: {invalid_durations}. Must be between 60–300 minutes.")

        return value
    
    def validate_select_type(self, value):
        if value == 'sport' and not self.initial_data.get("sport"):
            raise ValidationError("Sport must be selected when select_type is 'sport'")
        
        return value

    def validate_name(self, value):
        if not value:
            raise ValidationError(f"court name is required")
        
        return value

    def validate_surface_type(self, value):
        if not value:
            raise ValidationError(f"surface type is required")

        return value

    def validate_court_type(self, value):
        if not value:
            raise ValidationError(f"court type is required")

        return value

    def validate_court_size(self, value):
        if not value:
            raise ValidationError(f"court size is required")
        
        return value

    def validate_booking_visibility(self, value):
        if not value:
            raise ValidationError(f"booking visibility is required")

        return value       

    def create(self, validated_data):
        try:
            user = self.context['request'].user
            club = Clubs.objects.filter(user_id=user.id).first()

            if not club:
                raise ValidationError("Club not found for this user.")

            validated_data['club'] = club
            validated_data['created_by'] = user

            slot_durations = validated_data.pop('slot_durations_input', [])

            if not slot_durations:
                raise ValidationError("Slot durations are required.")

            invalid_durations = [d for d in slot_durations if not isinstance(d, int) or d < 60 or d > 300]
            if invalid_durations:
                raise ValidationError(f"Invalid Court Slot durations: {invalid_durations}. Must be between 60–300 minutes.")

            with transaction.atomic():
                court = ClubCourt.objects.create(**validated_data)
                for duration in slot_durations:
                    CourtSlotDuration.objects.create(club_court=court, duration=duration)

            return court

        except IntegrityError:
            raise ValidationError("A court with this name already exists for this club.")

        except Exception as e:
            raise ValidationError(f"Could not create court. Reason: {e}")
    
    def update(self, instance, validated_data):
        try:
            slot_durations = validated_data.pop('slot_durations_input', None)

            if slot_durations is not None:
                if not isinstance(slot_durations, list):
                    raise ValidationError("slot_durations must be a list.")
                invalid = [d for d in slot_durations if not isinstance(d, int) or d < 60 or d > 300]
                if invalid:
                    raise ValidationError(f"Invalid Court Slot durations: {invalid}. Must be between 60–300 minutes.")

            with transaction.atomic():
                for attr, value in validated_data.items():
                    setattr(instance, attr, value)
                instance.save()

                if slot_durations is not None:
                    CourtSlotDuration.objects.filter(club_court=instance).delete()
                    for duration in slot_durations:
                        CourtSlotDuration.objects.create(club_court=instance, duration=duration)

            return instance

        except IntegrityError:
            raise ValidationError("A court with this name already exists for this club.")
        except Exception as e:
            raise ValidationError(f"Could not update court. Reason: {e}")


class PriceSlotSerializer(serializers.ModelSerializer):
    class Meta:
        model = PriceSlot
        fields = ['id', 'uuid', 'is_checked', 'days', 'interval_number', 'start_time', 'end_time', 'created_at', 'updated_at', 'created_by']
        read_only_fields = ['id', 'uuid', 'created_by', 'created_at', 'updated_at']

    def validate(self, data):
        if data.get('is_checked') is not True:
            raise ValidationError("is_checked is required and must be True.")
        for field in ['days', 'interval_number', 'start_time', 'end_time']:
            if not data.get(field):
                raise ValidationError(f"{field} is required.")
        if data['start_time'] >= data['end_time']:
            raise ValidationError("start_time must be less than end_time.")
        
        slot_group = self.instance.slot_group if self.instance else data.get('slot_group')
        overlaps = PriceSlot.objects.filter(
            days=data['days'], slot_group=slot_group
        ).exclude(
            id=self.instance.id if self.instance else None
        ).filter(
            start_time__lt=data['end_time'],
            end_time__gt=data['start_time']
        )

        if overlaps.exists():
            raise ValidationError("Slot overlaps with an existing slot in this group.")
        
        return data


class SlotGroupCreateSerializer(serializers.ModelSerializer):
    slots = PriceSlotSerializer(many=True, write_only=True)

    class Meta:
        model = SlotGroup
        fields = ['id', 'uuid', 'slots', 'created_at', 'updated_at', 'created_by']
        read_only_fields = ['id', 'uuid', 'created_by', 'created_at', 'updated_at']

    def create(self, validated_data):
        user = self.context['request'].user
        slots_data = validated_data.pop('slots', [])

        with transaction.atomic():
            slot_group = SlotGroup.objects.create(
                created_by=user, **validated_data
            )
            for slot in slots_data:
                PriceSlot.objects.create(
                    slot_group=slot_group,
                    created_by=user,
                    **slot
                )

        return slot_group


class SlotGroupLinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = SlotGroup
        fields = ['id','uuid']  # Only existing SlotGroup UUIDs


class PriceListCreateSerializer(serializers.ModelSerializer):
    # Accept list of UUIDs instead of nested serializer
    slot_group_uuids = serializers.ListField(
        child=serializers.UUIDField(), write_only=True
    )


    class Meta:
        model = PriceList
        fields = [
            'id', 'uuid', 'name', 'default',
            'start_time', 'end_time', 'is_active',
            'created_at', 'updated_at', 'slot_group_uuids', 'created_by'
        ]
        read_only_fields = ['id', 'uuid', 'created_by', 'created_at', 'updated_at']

    def validate(self, data):
        start_time = data.get('start_time')
        end_time = data.get('end_time')
        if start_time and end_time and start_time >= end_time:
            raise ValidationError("start_time must be less than end_time.")
        
        print("DEBUG slot_group_uuids =>", data.get('slot_group_uuids'))
        
        if not data.get('slot_group_uuids'):
            raise ValidationError("At least one slot group UUID must be provided.")
        return data

    def create(self, validated_data):
        user = self.context['request'].user
        slot_group_uuids = validated_data.pop('slot_group_uuids')

        try:
            with transaction.atomic():
                # Step 1: Create PriceList
                price_list = PriceList.objects.create(created_by=user, **validated_data)

                # Step 2: Get SlotGroups owned by user
                slot_groups = SlotGroup.objects.filter(uuid__in=slot_group_uuids, created_by=user)

                # Step 3: Validate all SlotGroups exist
                if slot_groups.count() != len(slot_group_uuids):
                    raise ValidationError("Some SlotGroups not found or not owned by the user.")

                # Step 4: Attach PriceList to SlotGroups
                updated_count = slot_groups.update(price_list=price_list)

                if updated_count != len(slot_group_uuids):
                    raise ValidationError("Failed to attach all SlotGroups to PriceList.")

                return price_list
            
        except Exception as e:
            # Any error → rollback will happen automatically
            raise ValidationError(f"PriceList creation failed: {str(e)}")
