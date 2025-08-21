import os
from rest_framework.exceptions import ValidationError
from django.db import IntegrityError
from django.db import models
from django.db.models import fields
from rest_framework import serializers
from rest_framework.pagination import PageNumberPagination

from laravel_models.models import Users as user, Clubs
from core.models import (
    ClubCourt,
    CourtSlotDuration,
    PriceList,
    PriceSlot,
    CourtSlotPrice

)

MAX_IMAGE_SIZE_MB = 5

class ClubAddCourtSerializer(serializers.ModelSerializer):
    
    class SlotDurationSerializer(serializers.ModelSerializer):
        class Meta:
            model = CourtSlotDuration
            fields = ['duration']

    slot_durations = SlotDurationSerializer(many= True, write_only = True)
    slot_durations_data = SlotDurationSerializer(source='courtslotduration_set', many=True, read_only=True)


    class Meta:
        model = ClubCourt
        fields = ['id','uuid','club','name','surface_type','court_color','court_type',
        'court_size','court_image','select_type','sport','booking_visibility','is_active',
        'buffer_time_btw_slots','private_notes', 'slot_durations','created_by','created_at',
        'updated_at','slot_durations_data'
                
        ]
        read_only_fields = ['id','uuid','club','created_by','created_at','updated_at']

    def validate_court_image(self, image):
        if image and image.size > MAX_IMAGE_SIZE_MB * 1024 * 1024:
            raise serializers.ValidationError(f"Image size must be under {MAX_IMAGE_SIZE_MB}MB.")
        return image

        
    def validate_buffer_time_btw_slots(self, value):
        if value !=30:
            raise ValidationError("buffer time between slot must be 30 ")
        
        return value
    
    def validate_slot_durations(self, value):
        slot_duration_wrong = []

        if not value:
            raise ValidationError("court slot durations must be required")
        for slot_duration in value:
            if slot_duration['duration'] < 60 or slot_duration['duration'] > 300:
                slot_duration_wrong.append(slot_duration['duration'])
        if slot_duration_wrong:    
            raise ValidationError(f"Invalid Court Slot durations: {slot_duration_wrong}. Must be between 60–300 min.")
        
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

            slot_durations = validated_data.pop('slot_durations')
            court = ClubCourt.objects.create(**validated_data)

            for slot in slot_durations:
                CourtSlotDuration.objects.create(club_court=court, duration=slot['duration'])
            return court
        
        except IntegrityError as e:
            raise ValidationError(f"{'error'} : A court with this name already exists for this club.")
        
        except Exception as e:
            raise ValidationError(f"{'error'} : Could not create court. Reason: {e}")
    
    def update(self, instance, validated_data):
        try:
            slot_durations = validated_data.pop('slot_durations', None)

            for attr, value in validated_data.items():
                setattr(instance, attr, value)
            instance.save()

            if slot_durations is not None:
                CourtSlotDuration.objects.filter(club_court= instance).delete()
                for slot in slot_durations:
                    CourtSlotDuration.objects.create(club_court= instance, duration = slot['duration'])

            return instance
        
        except IntegrityError as e:
            raise ValidationError(f"{'error'} : A court with this name already exists for this club.")
        
        except Exception as e:
            raise ValidationError(f"{'error'} : Could not create court. Reason: {e}")
        

class ClubAddPriceListSerializer(serializers.ModelSerializer):

    class PriceSlotSerializer(serializers.ModelSerializer):
        

        class Meta:
            model = PriceSlot
            fields = [
                'id','uuid','is_checked','days_of_week','interval_number',
                'start_time','end_time','created_at','updated_at'
            ]
    
    class CourtSlotPriceSerializer(serializers.ModelSerializer):

        class Meta:
            model = CourtSlotPrice
            fields = [
                'id', 'uuid', 'price','created_at', 'updated_at'
            ]
    

    class Meta:
        model = PriceList
        fields = [
            'id','uuid','name','start_time','end_time','is_active','created_at','updated_at'
        ]