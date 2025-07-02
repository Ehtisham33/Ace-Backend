from rest_framework import generics, permissions

from drf_spectacular.utils import extend_schema, OpenApiParameter
from .models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage
)
from .serializers import (
    MessageSerializer,
    ActivityMessageSerializer,
    MarketplaceItemSerializer,
    MarketplaceMessageSerializer,
    RecentChatUserSerializer
)
from laravel_models.models import users as Users


@extend_schema(
    parameters=[
        OpenApiParameter(
            name='with',
            type=int,
            location=OpenApiParameter.QUERY,
            required=True,
            description='User ID to get messages with'
        )
    ]
)


class MessageListCreateView(generics.ListCreateAPIView):
    serializer_class = MessageSerializer
    permission_classes = [permissions.AllowAny]  

    def get_queryset(self):
        user_id = self.request.headers.get("X-User-ID")
        other_user = self.request.query_params.get("with")
        if user_id and other_user:
            return Message.objects.filter(
                sender_id=user_id, receiver_id=other_user
            ) | Message.objects.filter(
                sender_id=other_user, receiver_id=user_id
            )
        return Message.objects.none()

    def perform_create(self, serializer):
        user_id = self.request.headers.get("X-User-ID")
        user = Users.objects.filter(id=user_id).first()
        if user:
            serializer.save(sender=user)


class RecentChatsView(generics.ListAPIView):
    serializer_class = RecentChatUserSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        user_id = self.request.headers.get("X-User-ID")
        user = Users.objects.filter(id=user_id).first()
        if not user:
            return Users.objects.none()

        sent_to = Message.objects.filter(sender=user).values_list('receiver', flat=True)
        received_from = Message.objects.filter(receiver=user).values_list('sender', flat=True)
        user_ids = set(sent_to).union(set(received_from))
        return Users.objects.filter(id__in=user_ids)


@extend_schema(
    parameters=[
        OpenApiParameter(
            name='activity',
            type=int,
            location=OpenApiParameter.QUERY,
            required=True,
            description='Activity ID to fetch group chat messages'
        )
    ]
)


class ActivityMessageListCreateView(generics.ListCreateAPIView):
    serializer_class = ActivityMessageSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        activity_id = self.request.query_params.get("activity")
        return ActivityMessage.objects.filter(activity_id=activity_id) if activity_id else ActivityMessage.objects.none()

    def perform_create(self, serializer):
        user_id = self.request.headers.get("X-User-ID")
        user = Users.objects.filter(id=user_id).first()
        if user:
            serializer.save(sender=user)


class MarketplaceItemListCreateView(generics.ListCreateAPIView):
    serializer_class = MarketplaceItemSerializer
    queryset = MarketplaceItem.objects.all()
    permission_classes = [permissions.AllowAny]


@extend_schema(
    parameters=[
        OpenApiParameter(
            name='item',
            type=int,
            location=OpenApiParameter.QUERY,
            required=True,
            description='Marketplace Item ID to fetch messages'
        )
    ]
)


class MarketplaceMessageListCreateView(generics.ListCreateAPIView):
    serializer_class = MarketplaceMessageSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        item_id = self.request.query_params.get("item")
        return MarketplaceMessage.objects.filter(item_id=item_id) if item_id else MarketplaceMessage.objects.none()

    def perform_create(self, serializer):
        user_id = self.request.headers.get("X-User-ID")
        user = Users.objects.filter(id=user_id).first()
        if user:
            serializer.save(sender=user)
