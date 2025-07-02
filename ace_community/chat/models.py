from django.db import models
from laravel_models.models import users, CourtBookings 


class Message(models.Model):
    sender = models.ForeignKey(
        users,
        on_delete=models.CASCADE,
        related_name='sent_messages',
        db_column='sender_id'
    )
    receiver = models.ForeignKey(
        users,
        on_delete=models.CASCADE,
        related_name='received_messages',
        db_column='receiver_id'
    )
    content = models.TextField(blank=True)
    file = models.FileField(upload_to='chat_files/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

    class Meta:
        ordering = ['timestamp']
        db_table = 'messages'


class ActivityMessage(models.Model):
    activity = models.ForeignKey(
        CourtBookings, 
        on_delete=models.CASCADE,
        db_column='activity_id',
        related_name='activity_messages'
    )
    sender = models.ForeignKey(
        users,
        on_delete=models.CASCADE,
        related_name='activity_sent_messages'
    )
    content = models.TextField(blank=True)
    file = models.FileField(upload_to='chat_files/activity/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

    class Meta:
        ordering = ['timestamp']
        db_table = 'activity_messages'


class MarketplaceItem(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'marketplace_items'


class MarketplaceMessage(models.Model):
    item = models.ForeignKey(
        MarketplaceItem,
        on_delete=models.CASCADE,
        related_name='messages'
    )
    sender = models.ForeignKey(
        users,
        on_delete=models.CASCADE,
        related_name='marketplace_sent_messages'
    )
    receiver = models.ForeignKey(
        users,
        on_delete=models.CASCADE,
        related_name='marketplace_received_messages'
    )
    content = models.TextField(blank=True)
    file = models.FileField(upload_to='chat_files/marketplace/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

    class Meta:
        ordering = ['timestamp']
        db_table = 'marketplace_messages'
