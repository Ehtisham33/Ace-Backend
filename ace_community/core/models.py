from types import MappingProxyType
from django.db import models
from django.core.validators import MaxLengthValidator, MinValueValidator, MaxValueValidator

import uuid

from django.db.models import fields, indexes

from laravel_models.models import Users, Sports, Clubs


class ClubCourt(models.Model):

    id = models.BigAutoField(primary_key=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    club = models.ForeignKey(Clubs, on_delete=models.CASCADE)
    name = models.CharField(max_length=30,blank=False)
    surface_type = models.CharField(max_length=15, choices=[
        ('artificial_turf','Artificial Turf'),
        ('clay','Clay'),
        ('concrete','Concrete')
    ], null=False, blank=False)
    court_color = models.CharField(max_length=20,null=True, blank=True)
    court_type = models.CharField(max_length= 8 , choices=[
        ('indoor','Indoor'),
        ('outdoor','Outdoor')
    ],null=False, blank=False)
    court_size = models.CharField(max_length=11, choices=[
        ('double','Double'),
        ('single','Single'),
        ('5v5','5V5'),
        ('6v6','6V6'),
        ('7v7','7V7'),
        ('11v11','11V11'),  
        ('half_court','Half Court'),
        ('full_court','Full Court')       
    ], null=False, blank=False)
    court_image = models.ImageField(upload_to='court_image', null=True, blank=True)
    select_type = models.CharField(max_length=16, choices=[
        ('sport','Sport'),
        ('class_and_event','Class And Event'),
    ],null=False , blank=False )
    sport = models.ForeignKey(Sports, on_delete=models.CASCADE, null=True, blank=True)
    
    booking_visibility = models.CharField(max_length=12 , choices=[
        ('public_only','Public_Only'),
        ('members_only','Members Only'),
        ('admin_only','Admin Only')
    ], null=False , blank=False)
    is_active = models.BooleanField(default=False)
    buffer_time_btw_slots = models.IntegerField(validators=[MinValueValidator(30)] ,null=False , blank=False)
    private_notes = models.CharField(max_length=100, null=True, blank=True)

    created_by = models.ForeignKey(Users, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True, null = True, blank = True)



    def __str__(self):
        return self.name
    
    class Meta:
        managed = True
        unique_together = ('club', 'name')
        db_table = 'club_courts'
        ordering = ['created_at']
        indexes = [
            models.Index(fields=['created_at']),
            models.Index(fields=['updated_at']),            
            models.Index(fields=['club']),
            models.Index(fields=['is_active']),
            models.Index(fields=['booking_visibility']),
            models.Index(fields=['court_size']),
            models.Index(fields=['court_type']),
            models.Index(fields=['surface_type']),
            models.Index(fields=['select_type']),  
            models.Index(fields=['uuid'])              
        ]

    

class CourtSlotDuration(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    club_court = models.ForeignKey(ClubCourt, on_delete=models.CASCADE)
    duration = models.IntegerField(validators=[MinValueValidator(50),MaxValueValidator(320)],null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True, null = True, blank = True)


    def __str__(self):
        return f"{self.club_court.name} - {self.duration}  minutes"
    
    
    class Meta:
        managed = True
        ordering = ['created_at']
        unique_together = ('club_court','duration')
        db_table = 'court_slot_duration'
        indexes = [ 
            models.Index(fields=['uuid']),
            models.Index(fields=['club_court']),
            models.Index(fields=['duration']),
            models.Index(fields=['created_at']),
            models.Index(fields=['updated_at'])                              
                   
         ]


class PriceList(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    name = models.CharField(max_length=35 , null=False ,blank=False, unique=True)
    start_time = models.DateTimeField(null=False, blank=False)
    end_time = models.DateTimeField(null=False, blank=False)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at =models.DateTimeField(auto_now=True, null=True, blank= True)

    def __str__(self):
        return f'{self.name}'
    
    class Meta:
        managed = True
        db_table = 'price_list'
        ordering = ['created_at']
        indexes= [
            models.Index(fields=['uuid']),
            models.Index(fields=['name']),
            models.Index(fields=['start_time']),
            models.Index(fields=['end_time']),
            models.Index(fields=['is_active']),
            models.Index(fields=['created_at']),
            models.Index(fields=['updated_at'])             
        ]


class PriceSlot(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    price_list = models.ForeignKey(PriceList, on_delete=models.CASCADE)
    is_checked = models.BooleanField(default=False)
    days_of_week = models.CharField(choices=[
        ('mon','Mon'),
        ('tue','Tue'),
        ('wed','Wed'),
        ('thu','Thu'),
        ('fri','Fri'),
        ('sat','Sat'),
        ('sun','Sun')
    ] , max_length=4 , null=True, blank=True)
    interval_number = models.IntegerField(null=True,blank=True)
    start_time = models.DateTimeField(null=True , blank=True)
    end_time = models.DateTimeField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True , null=True, blank = True)

    def __str__(self):
        return f'{self.price_list.name}  slot interval {self.interval_number} start time {self.start_time} end time {self.end_time}'
    
    class Meta:
        managed = True
        ordering = ['created_at']
        unique_together = ('price_list', 'days_of_week', 'interval_number')
        db_table ='price_slot'
        indexes = [
        models.Index(fields=['uuid']),
        models.Index(fields=['price_list']),
        models.Index(fields=['days_of_week']),
        models.Index(fields=['interval_number']),
        models.Index(fields=['updated_at'])
    ]
    

class CourtSlotPrice(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    club_court = models.ForeignKey(ClubCourt, on_delete=models.CASCADE)
    price_slot = models.ForeignKey(PriceSlot, on_delete= models.CASCADE)
    slot_duration = models.ForeignKey(CourtSlotDuration, on_delete=models.CASCADE, null=True, blank=True)
    prices = models.IntegerField(null=True, blank=True)
    created_by = models.ForeignKey(Users, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True, null= True, blank= True)

    def __str__(self):
        return f'{self.club_court.name} - {self.price_slot.price_list.name} - {self.slot_duration.duration} - {self.prices}'
    

    class Meta:
        managed = True
        ordering = ['created_at']
        unique_together = ('club_court', 'price_slot', 'slot_duration')
        db_table = 'court_slot_price'
        indexes = [
            models.Index(fields=['uuid']),
            models.Index(fields=['club_court']),
            models.Index(fields=['price_slot']),
            models.Index(fields=['created_at']),
            models.Index(fields=['updated_at'])
        ]
