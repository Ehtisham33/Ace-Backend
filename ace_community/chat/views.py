from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework import status
from django.db.models import Q
from laravel_models.models import users
from drf_spectacular.utils import extend_schema, OpenApiParameter, extend_schema, extend_schema_view
from .models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage,
    Community, 
    CommunityMembership, 
    CommunityMessage

)
from .serializers import (
    MessageSerializer,
    ActivityMessageSerializer,
    MarketplaceItemSerializer,
    MarketplaceMessageSerializer,
    RecentChatUserSerializer,
    CommunitySerializer,
    CommunityMembershipSerializer,
    CommunityMessageSerializer,
)



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
        user = users.objects.filter(id=user_id).first()
        if user:
            serializer.save(sender=user)


class RecentChatsView(generics.ListAPIView):
    serializer_class = RecentChatUserSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        user_id = self.request.headers.get("X-User-ID")
        user = users.objects.filter(id=user_id).first()
        if not user:
            return users.objects.none()

        sent_to = Message.objects.filter(sender=user).values_list('receiver', flat=True)
        received_from = Message.objects.filter(receiver=user).values_list('sender', flat=True)
        user_ids = set(sent_to).union(set(received_from))
        return users.objects.filter(id__in=user_ids)


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
        user = users.objects.filter(id=user_id).first()
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
        user = users.objects.filter(id=user_id).first()
        if user:
            serializer.save(sender=user)


@extend_schema_view(
    get=extend_schema(summary="List all communities"),
    post=extend_schema(summary="Create a new community"),
)
class CommunityListCreateView(generics.ListCreateAPIView):
    queryset = Community.objects.all()
    serializer_class = CommunitySerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        club_id = self.request.query_params.get('club_id')
        if club_id:
            return Community.objects.filter(club_id=club_id)
        return Community.objects.all()

    def perform_create(self, serializer):
        user_id = self.request.headers.get("X-User-ID")
        user = users.objects.filter(id=user_id).first()
        if user:
            serializer.save(created_by=user)


@extend_schema(summary="Get, update or delete a specific community")
class CommunityDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Community.objects.all()
    serializer_class = CommunitySerializer
    permission_classes = [permissions.AllowAny]
    lookup_field = 'id'


@extend_schema(summary="Join a community")
class JoinCommunityView(generics.CreateAPIView):
    queryset = CommunityMembership.objects.all()
    serializer_class = CommunityMembershipSerializer
    permission_classes = [permissions.AllowAny]

    def perform_create(self, serializer):
        user_id = self.request.headers.get("X-User-ID")
        user = users.objects.filter(id=user_id).first()
        if user:
            serializer.save(user=user)


@extend_schema(summary="Get communities the user is a member of")
class MyCommunitiesView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        user_id = self.request.headers.get("X-User-ID")
        return Community.objects.filter(memberships__user__id=user_id)

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['user_id'] = self.request.headers.get("X-User-ID")
        return context


@extend_schema(summary="List members of a specific community")
class CommunityMembersView(generics.ListAPIView):
    serializer_class = CommunityMembershipSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        community_id = self.kwargs['community_id']
        return CommunityMembership.objects.filter(community_id=community_id)


@extend_schema_view(
    get=extend_schema(summary="Get messages for a community"),
    post=extend_schema(summary="Post a message to a community"),
)
class CommunityMessageListCreateView(generics.ListCreateAPIView):
    serializer_class = CommunityMessageSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        return CommunityMessage.objects.filter(community_id=self.kwargs['community_id'])

    def perform_create(self, serializer):
        user_id = self.request.headers.get("X-User-ID")
        user = users.objects.filter(id=user_id).first()
        community_id = self.kwargs['community_id']
        if user:
            serializer.save(sender=user, community_id=community_id)


@extend_schema(summary="List communities the user has active chats in")
class CommunityChatThreadsView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        user_id = self.request.headers.get("X-User-ID")
        return Community.objects.filter(memberships__user__id=user_id).distinct()

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['user_id'] = self.request.headers.get("X-User-ID")
        return context


@extend_schema(
    summary="My Created Communities",
    description="Returns all communities that the authenticated user has created.",
    responses={200: CommunitySerializer(many=True)},
    tags=["Community"]
)
class MyCreatedCommunitiesView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        user_id = self.request.headers.get("X-User-ID")
        return Community.objects.filter(created_by_id=user_id)

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['user_id'] = self.request.headers.get("X-User-ID")
        return context


@extend_schema(
    summary="Explore Communities",
    description="Communities in selected club that user has not joined.",
    parameters=[
        OpenApiParameter(name="club_id", required=True, type=int, location=OpenApiParameter.QUERY)
    ],
    responses={200: CommunitySerializer(many=True)},
    tags=["Community"]
)
class ExploreCommunitiesView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        user_id = self.request.headers.get("X-User-ID")
        club_id = self.request.query_params.get("club_id")
        return Community.objects.filter(club_id=club_id).exclude(
            memberships__user__id=user_id
        )

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['user_id'] = self.request.headers.get("X-User-ID")
        return context