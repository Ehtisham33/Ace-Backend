import secrets
from rest_framework import generics, permissions, status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from django.db.models import Q, Count
from drf_spectacular.utils import extend_schema, OpenApiParameter, extend_schema_view
from drf_spectacular.types import OpenApiTypes
from laravel_models.models import Users, Clubs

from .models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage,
    Community, 
    CommunityMembership, 
    CommunityMessage,
    CommunityFavorite,
    UserFollower,
    CommunityPost,
    PostLike,
    PostComment,
    CommunityReport,
    CustomToken
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
    CommunityFavoriteSerializer,
    UserFollowerSerializer,
    CommunityPostSerializer,
    PostCommentSerializer,
    CommunityReportSerializer,
    UserMiniSerializer
)

@extend_schema_view(
    get=extend_schema(
        summary="List messages with a specific user",
        parameters=[
            OpenApiParameter(
                name='with',
                type=int,
                location=OpenApiParameter.QUERY,
                required=True,
                description='User ID to get messages with'
            )
        ],
        responses={200: MessageSerializer(many=True)},
    ),
    post=extend_schema(
        summary="Send a message",
        request=MessageSerializer,
        responses={201: MessageSerializer}
    )
)
class MessageListCreateView(generics.ListCreateAPIView):
    serializer_class = MessageSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user_id = self.request.user.id
        other_user = self.request.query_params.get("with")
        if user_id and other_user:
            return Message.objects.filter(
                Q(sender_id=user_id, receiver_id=other_user) |
                Q(sender_id=other_user, receiver_id=user_id)
            ).order_by('-timestamp')
        return Message.objects.none()

    def perform_create(self, serializer):
        try:
            serializer.save(sender=self.request.user)
        except Exception as e:
            import logging
            logging.exception("Message creation failed")
            raise e


@extend_schema(
    summary="Mark message as read",
    description="Mark a message as read by ID",
    request={"application/json": {"type": "object", "properties": {"message_id": {"type": "integer"}}}},
    responses={200: {"type": "object", "properties": {"status": {"type": "string"}}}}
)
class MarkMessageReadView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request):
        message_id = request.data.get('message_id')
        msg = Message.objects.filter(id=message_id).first()
        if msg:
            msg.is_read = True
            msg.save()
            return Response({'status': 'read'})
        return Response({'error': 'Invalid message_id'}, status=400)

@extend_schema(
    summary="Unread message count",
    description="Get total unread messages for the user",
    responses={200: {"type": "object", "properties": {"unread_count": {"type": "integer"}}}}
)
class UnreadCountView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        user_id = self.request.user.id
        count = Message.objects.filter(receiver_id=user_id, is_read=False).count()
        return Response({'unread_count': count})

@extend_schema_view(
    get=extend_schema(summary="List recent chat users", responses={200: RecentChatUserSerializer(many=True)}),
)
class RecentChatsView(generics.ListAPIView):
    serializer_class = RecentChatUserSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user_id = self.request.user.id
        sent_to = Message.objects.filter(sender_id=user_id).values_list('receiver', flat=True)
        received_from = Message.objects.filter(receiver_id=user_id).values_list('sender', flat=True)
        user_ids = set(sent_to).union(set(received_from))
        return Users.objects.filter(id__in=user_ids)


@extend_schema(
    parameters=[
        OpenApiParameter(name='activity', type=int, location=OpenApiParameter.QUERY, required=True, description='Activity ID to fetch group chat messages')
    ],
    responses={200: ActivityMessageSerializer(many=True)}
)


class ActivityMessageListCreateView(generics.ListCreateAPIView):
    serializer_class = ActivityMessageSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        activity_id = self.request.query_params.get("activity")
        return ActivityMessage.objects.filter(activity_id=activity_id).order_by('-timestamp') if activity_id else ActivityMessage.objects.none()

    def perform_create(self, serializer):
        serializer.save(sender=self.request.user)

class MarketplaceItemListCreateView(generics.ListCreateAPIView):
    serializer_class = MarketplaceItemSerializer
    queryset = MarketplaceItem.objects.all()
    permission_classes = [permissions.IsAuthenticated]

@extend_schema(
    parameters=[
        OpenApiParameter(name='item', type=int, location=OpenApiParameter.QUERY, required=True, description='Marketplace Item ID to fetch messages')
    ],
    responses={200: MarketplaceMessageSerializer(many=True)}
)


class MarketplaceMessageListCreateView(generics.ListCreateAPIView):
    serializer_class = MarketplaceMessageSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        item_id = self.request.query_params.get("item")
        return MarketplaceMessage.objects.filter(item_id=item_id).order_by('-timestamp') if item_id else MarketplaceMessage.objects.none()

    def perform_create(self, serializer):
        serializer.save(sender=self.request.user)

@extend_schema_view(
    get=extend_schema(
        summary="List all communities",
        parameters=[
            OpenApiParameter(name="club_id", type=int, location=OpenApiParameter.QUERY, required=False, description="Filter by club ID"),
            OpenApiParameter(name="sport", type=str, location=OpenApiParameter.QUERY, required=False, description="Filter by sport (e.g. Padel)")
        ]
    ),
    post=extend_schema(summary="Create a new community"),
)


class CommunityListCreateView(generics.ListCreateAPIView):
    queryset = Community.objects.all()
    serializer_class = CommunitySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        club_id = self.request.query_params.get("club_id")
        sport = self.request.query_params.get("sport")
        qs = Community.objects.all()
        if club_id:
            qs = qs.filter(club_id=club_id)
        if sport:
            qs = qs.filter(sport__iexact=sport)
        return qs

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


@extend_schema(summary="Get, update or delete a specific community")
class CommunityDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Community.objects.all()
    serializer_class = CommunitySerializer
    permission_classes = [permissions.IsAuthenticated]
    lookup_field = 'id'


@extend_schema(summary="Join a community")
class JoinCommunityView(generics.CreateAPIView):
    queryset = CommunityMembership.objects.all()
    serializer_class = CommunityMembershipSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

@extend_schema(summary="Get communities the user is a member of")
class MyCommunitiesView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Community.objects.filter(memberships__user__id=self.request.user.id)

@extend_schema(summary="List members of a specific community")
class CommunityMembersView(generics.ListAPIView):
    serializer_class = CommunityMembershipSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return CommunityMembership.objects.filter(community_id=self.kwargs['community_id'])

@extend_schema_view(
    get=extend_schema(summary="Get messages for a community"),
    post=extend_schema(summary="Post a message to a community"),
)
class CommunityMessageListCreateView(generics.ListCreateAPIView):
    serializer_class = CommunityMessageSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return CommunityMessage.objects.filter(community_id=self.kwargs['community_id']).order_by('-timestamp')

    def perform_create(self, serializer):
        serializer.save(sender=self.request.user, community_id=self.kwargs['community_id'])

@extend_schema(summary="List communities the user has active chats in")
class CommunityChatThreadsView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Community.objects.filter(memberships__user__id=self.request.user.id).distinct()

@extend_schema(
    summary="My Created Communities",
    description="Returns all communities that the authenticated user has created.",
    responses={200: CommunitySerializer(many=True)},
    tags=["Community"]
)
class MyCreatedCommunitiesView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Community.objects.filter(created_by_id=self.request.user.id)

@extend_schema(
    summary="Explore Communities",
    description="Communities (public or private) created by players in the selected club that the user has not joined.",
    parameters=[
        OpenApiParameter(name="club_id", required=True, type=int, location=OpenApiParameter.QUERY)
    ],
    responses={200: CommunitySerializer(many=True)},
    tags=["Community"]
)
class ExploreCommunitiesView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        club_id = self.request.query_params.get("club_id")
        qs = Community.objects.filter(
            created_by__user_type='player'
        )
        if club_id:
            qs = qs.filter(club_id=club_id)
        return qs.exclude(memberships__user__id=self.request.user.id)


class MyFavoriteCommunitiesView(generics.ListAPIView):
    serializer_class = CommunitySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return Community.objects.filter(
            communityfavorite__user=self.request.user
        )

class ToggleFavoriteCommunityView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, community_id):
        obj, created = CommunityFavorite.objects.get_or_create(
            user=request.user,
            community_id=community_id
        )
        if not created:
            obj.delete()
            return Response({"status": "removed"})
        return Response({"status": "added"})


class MyFollowersView(generics.ListAPIView):
    serializer_class = UserFollowerSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return UserFollower.objects.filter(following=self.request.user)


class MyFollowingView(generics.ListAPIView):
    serializer_class = RecentChatUserSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        query = self.request.query_params.get("q", "")
        user = self.request.user

        # Get users I follow
        following_ids = UserFollower.objects.filter(
            follower=user
        ).values_list('following_id', flat=True)

        qs = Users.objects.filter(id__in=following_ids)
        if query:
            qs = qs.filter(user_name__icontains=query)
        return qs


class FollowUserView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, user_id):
        if request.user.id == user_id:
            return Response({"error": "You cannot follow yourself."}, status=400)

        obj, created = UserFollower.objects.get_or_create(
            follower=request.user,
            following_id=user_id
        )
        if not created:
            return Response({"status": "already following"})
        return Response({"status": "followed"})


class UnfollowUserView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, user_id):
        deleted, _ = UserFollower.objects.filter(
            follower=request.user,
            following_id=user_id
        ).delete()
        if deleted:
            return Response({"status": "unfollowed"})
        return Response({"status": "not following"}, status=404)


class CommunityFeedView(generics.ListCreateAPIView):
    serializer_class = CommunityPostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        community_id = self.kwargs.get("community_id")
        return CommunityPost.objects.filter(
            community_id=community_id
        ).order_by('-created_at')

    def perform_create(self, serializer):
        serializer.save(
            author=self.request.user,
            community_id=self.kwargs.get("community_id")
        )


class TogglePostLikeView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, post_id):
        obj, created = PostLike.objects.get_or_create(
            user=request.user,
            post_id=post_id
        )
        if not created:
            obj.delete()
            return Response({"status": "unliked"})
        return Response({"status": "liked"})



class PostCommentListCreateView(generics.ListCreateAPIView):
    serializer_class = PostCommentSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return PostComment.objects.filter(post_id=self.kwargs['post_id'])

    def perform_create(self, serializer):
        serializer.save(user=self.request.user, post_id=self.kwargs['post_id'])


class CommunityPhotosView(generics.ListAPIView):
    serializer_class = CommunityPostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return CommunityPost.objects.filter(
            community_id=self.kwargs["community_id"],
            image__isnull=False
        ).exclude(image='')


class CommunityVideosView(generics.ListAPIView):
    serializer_class = CommunityPostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return CommunityPost.objects.filter(
            community_id=self.kwargs["community_id"],
            video__isnull=False
        ).exclude(video='')


class CommunityDocumentsView(generics.ListAPIView):
    serializer_class = CommunityPostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return CommunityPost.objects.filter(
            community_id=self.kwargs["community_id"],
            file__isnull=False
        ).exclude(file='')
    

class LeaveCommunityView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, community_id):
        deleted, _ = CommunityMembership.objects.filter(
            community_id=community_id,
            user=request.user
        ).delete()

        if deleted:
            return Response({"status": "left"})
        return Response({"status": "not a member"}, status=400)


class ReportCommunityView(generics.CreateAPIView):
    serializer_class = CommunityReportSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(
            reported_by=self.request.user,
            community_id=self.kwargs['community_id']
        )


class AddCommunityMemberView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, community_id):
        user_to_add_id = request.data.get('user')

        if not user_to_add_id:
            return Response({'detail': 'User ID is required.'}, status=400)

        try:
            community = Community.objects.get(id=community_id)
        except Community.DoesNotExist:
            return Response({'detail': 'Community not found.'}, status=404)

        request_user = request.user

        # Check if request.user is creator, admin, or club owner
        is_creator = community.created_by_id == request_user.id
        is_admin = CommunityMembership.objects.filter(
            community=community,
            user=request_user,
            is_admin=True
        ).exists()
        is_club_owner = Clubs.objects.filter(id=community.club_id, user_id=request_user.id).exists()

        # if not (is_creator or is_admin or is_club_owner):
        #     return Response({'detail': 'Not authorized to add members.'}, status=403)

        if CommunityMembership.objects.filter(community_id=community_id, user_id=user_to_add_id).exists():
            return Response({'detail': 'User is already a member.'}, status=409)

        membership = CommunityMembership.objects.create(
            community_id=community_id,
            user_id=user_to_add_id,
            is_admin=True,
            is_approved=True
        )

        serializer = CommunityMembershipSerializer(membership)
        return Response(serializer.data, status=201)


@extend_schema(
    summary="Exchange Laravel user ID for Django token",
    description="Receives a Laravel-managed user_id (from frontend after login) and returns a Django token for authenticated requests.",
    request={
        "application/json": {
            "type": "object",
            "properties": {
                "user_id": {
                    "type": "integer",
                    "example": 1
                }
            },
            "required": ["user_id"]
        }
    },
    responses={
        200: {
            "type": "object",
            "properties": {
                "token": {
                    "type": "string",
                    "example": "27f92ae238914308ad843e3f171f13efb23acdb2"
                }
            }
        },
        400: {"type": "object", "properties": {"detail": {"type": "string"}}},
        404: {"type": "object", "properties": {"detail": {"type": "string"}}},
    },
    tags=["Authentication"]
)

@api_view(['POST'])
@permission_classes([AllowAny])
def exchange_laravel_token(request):
    user_id = request.data.get("user_id")
    if not user_id:
        return Response({"detail": "User ID is required"}, status=status.HTTP_400_BAD_REQUEST)

    try:
        user = Users.objects.get(id=user_id)
    except Users.DoesNotExist:
        return Response({"detail": "User not found in Laravel Users"}, status=404)

    try:
        token = CustomToken.objects.get(user=user)
    except CustomToken.DoesNotExist:
        token = CustomToken(user=user, key=secrets.token_hex(20))
        token.save()

    return Response({
        "token": token.key,
        "user": UserMiniSerializer(user).data
    })
