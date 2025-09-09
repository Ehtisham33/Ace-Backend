from types import MappingProxyType
from django.db import models
from django.core.validators import MaxLengthValidator, MinValueValidator, MaxValueValidator
from django.core.exceptions import ValidationError

import uuid

from django.db.models import fields, indexes

from laravel_models.models import Users, Sports, Clubs

def generate_uuid_with_dash():
    """Generate UUID string with dashes (standard format)."""
    return str(uuid.uuid4())

class UUIDWithDashField(models.CharField):
    def __init__(self, *args, **kwargs):
        kwargs['max_length'] = 36
        kwargs['default'] = generate_uuid_with_dash   # lambda hata diya
        kwargs['unique'] = True
        kwargs['editable'] = False
        super().__init__(*args, **kwargs)


class ClubCourt(models.Model):

    id = models.BigAutoField(primary_key=True)
    uuid = UUIDWithDashField()
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
    uuid = UUIDWithDashField()
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
    uuid = UUIDWithDashField()
    name = models.CharField(max_length=36 , null=False ,blank=False, unique=True)
    start_time = models.DateField(null=True, blank=True, unique= True)
    end_time = models.DateField(null=True, blank=True , unique= True)
    is_active = models.BooleanField(default=True)
    default = models.BooleanField(default=False)    
    created_by = models.ForeignKey(Users, on_delete=models.CASCADE, null = True , blank = True)
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
            models.Index(fields=['updated_at']),
            models.Index(fields=['created_by'])             
        ]


class SlotGroup(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = UUIDWithDashField()
    price_list = models.ForeignKey(PriceList, on_delete=models.CASCADE, related_name="slot_groups", null = True , blank=True)
    created_by = models.ForeignKey(Users, on_delete=models.CASCADE, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    class Meta:
        db_table = "slot_group"
        indexes = [
            models.Index(fields=['uuid']),
            models.Index(fields=['price_list']),
            models.Index(fields=['created_by']),
        ]
        
    def __str__(self):
        return f"Slot Group for {self.price_list.name if self.price_list else 'N/A'}"


class PriceSlot(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = UUIDWithDashField()
    slot_group = models.ForeignKey(SlotGroup, on_delete=models.CASCADE , null=True , blank=True)
    is_checked = models.BooleanField(default=False)
    days = models.CharField(choices=[
        ('mon','Mon'),
        ('tue','Tue'),
        ('wed','Wed'),
        ('thu','Thu'),
        ('fri','Fri'),
        ('sat','Sat'),
        ('sun','Sun')
    ] , max_length=4 , null=True, blank=True)
    interval_number = models.IntegerField(null=True,blank=True)
    start_time = models.TimeField(null=True , blank=True)
    end_time = models.TimeField(null=True, blank=True)
    created_by = models.ForeignKey(Users, on_delete=models.CASCADE, null = True , blank = True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True , null=True, blank = True)

    def clean(self):
        """Custom validation to prevent overlapping time slots"""
        if self.start_time and self.end_time:
            overlaps = PriceSlot.objects.filter(
                days=self.days
            ).exclude(id=self.id).filter(
                start_time__lt=self.end_time,
                end_time__gt=self.start_time
            )
            if overlaps.exists():
                raise ValidationError("This time slot overlaps with an existing slot.")
    
    def save(self, *args, **kwargs):
        self.clean()  
        super().save(*args, **kwargs)

    def __str__(self):
        pl_name = self.slot_group.price_list.name if self.slot_group and self.slot_group.price_list else "No Price List"
        
        return f'{pl_name} slot interval {self.interval_number} start {self.start_time} end {self.end_time}'

    
    class Meta:
        managed = True
        constraints = [
            models.UniqueConstraint(
                fields=['slot_group', 'days', 'start_time', 'end_time'],  # ✅ SCOPED to group
                name='unique_slot_per_group'
            )
        ]
        ordering = ['created_at']
        db_table ='price_slot'
        indexes = [
        models.Index(fields=['uuid']),
        models.Index(fields=['slot_group']),
        models.Index(fields=['days']),
        models.Index(fields=['interval_number']),
        models.Index(fields=['updated_at']),
        models.Index(fields=['created_by'])
    ]
    

class CourtSlotPrice(models.Model):
    id = models.BigAutoField(primary_key=True)
    uuid = UUIDWithDashField()
    club_court = models.ForeignKey(ClubCourt, on_delete=models.CASCADE)
    price_slot_group = models.ForeignKey(SlotGroup, on_delete= models.CASCADE, related_name= 'court_slot_price', null=True, blank=True)
    enforce_slot_start_time = models.BooleanField(default=False)
    is_checked_duration = models.BooleanField(default=True)
    slot_duration = models.ForeignKey(CourtSlotDuration, on_delete=models.CASCADE, null=True, blank=True)
    prices = models.IntegerField(null=True, blank=True)
    created_by = models.ForeignKey(Users, on_delete=models.CASCADE , null = True , blank= True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True, null= True, blank= True)

    def __str__(self):
        return f'{self.club_court.name} - {self.price_slot_group.price_list.name} - {self.slot_duration.duration if self.slot_duration else "N/A"} - {self.prices}'

    

    class Meta:
        managed = True
        ordering = ['created_at']
        unique_together = ('club_court', 'price_slot_group', 'slot_duration')
        db_table = 'court_slot_price'
        indexes = [
            models.Index(fields=['uuid']),
            models.Index(fields=['club_court']),
            models.Index(fields=['price_slot_group']),
            models.Index(fields=['created_at']),
            models.Index(fields=['updated_at']),
            models.Index(fields=['created_by'])
        ]
