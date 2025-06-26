from rest_framework import serializers
from .models import Message
from django.contrib.auth import get_user_model

User = get_user_model()

class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = '__all__'

class RecentChatUserSerializer(serializers.ModelSerializer):
    last_message = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['id', 'username', 'last_message']

    def get_last_message(self, user):
        request_user = self.context['request'].user
        msg = Message.objects.filter(
            sender__in=[request_user, user],
            receiver__in=[request_user, user]
        ).order_by('-timestamp').first()
        return MessageSerializer(msg).data if msg else None
