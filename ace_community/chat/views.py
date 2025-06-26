from rest_framework import generics, permissions
from rest_framework.permissions import AllowAny
from .models import Message
from .serializers import MessageSerializer, RecentChatUserSerializer
from django.contrib.auth import get_user_model

User = get_user_model()

class MessageListCreateView(generics.ListCreateAPIView):
    serializer_class = MessageSerializer
    permission_classes = [permissions.IsAuthenticated]


    def get_queryset(self):
        user = self.request.user
        other_user = self.request.query_params.get("with")
        if other_user:
            return Message.objects.filter(
                sender=user, receiver_id=other_user
            ) | Message.objects.filter(
                sender_id=other_user, receiver=user
            )
        return Message.objects.none()

    def perform_create(self, serializer):
        serializer.save(sender=self.request.user)

class RecentChatsView(generics.ListAPIView):
    serializer_class = RecentChatUserSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        # All users who chatted with this user
        sent_to = Message.objects.filter(sender=user).values_list('receiver', flat=True)
        received_from = Message.objects.filter(receiver=user).values_list('sender', flat=True)
        user_ids = set(sent_to).union(set(received_from))
        return User.objects.filter(id__in=user_ids)
