from django.db import models
from laravel_models.models import users

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
