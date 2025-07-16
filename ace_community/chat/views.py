# from rest_framework import generics, permissions, status
# from rest_framework.response import Response
# from rest_framework.views import APIView
# from django.db.models import Q, Count
# from drf_spectacular.utils import extend_schema, OpenApiParameter, extend_schema_view
# from laravel_models.models import users

# from .models import (
#     Message,
#     ActivityMessage,
#     MarketplaceItem,
#     MarketplaceMessage,
#     Community, 
#     CommunityMembership, 
#     CommunityMessage,
# )
# from .serializers import (
#     MessageSerializer,
#     ActivityMessageSerializer,
#     MarketplaceItemSerializer,
#     MarketplaceMessageSerializer,
#     RecentChatUserSerializer,
#     CommunitySerializer,
#     CommunityMembershipSerializer,
#     CommunityMessageSerializer,
# )

# @extend_schema_view(
#     get=extend_schema(
#         summary="List messages with a specific user",
#         parameters=[
#             OpenApiParameter(
#                 name='with',
#                 type=int,
#                 location=OpenApiParameter.QUERY,
#                 required=True,
#                 description='User ID to get messages with'
#             )
#         ],
#         responses={200: MessageSerializer(many=True)},
#     ),
#     post=extend_schema(
#         summary="Send a message",
#         request=MessageSerializer,
#         responses={201: MessageSerializer}
#     )
# )
# class MessageListCreateView(generics.ListCreateAPIView):
#     serializer_class = MessageSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         user_id = self.request.user.id
#         other_user = self.request.query_params.get("with")
#         if user_id and other_user:
#             return Message.objects.filter(
#                 Q(sender_id=user_id, receiver_id=other_user) |
#                 Q(sender_id=other_user, receiver_id=user_id)
#             ).order_by('-timestamp')
#         return Message.objects.none()

#     def perform_create(self, serializer):
#         try:
#             serializer.save(sender=self.request.user)
#         except Exception as e:
#             import logging
#             logging.exception("Message creation failed")
#             raise e


# @extend_schema(
#     summary="Mark message as read",
#     description="Mark a message as read by ID",
#     request={"application/json": {"type": "object", "properties": {"message_id": {"type": "integer"}}}},
#     responses={200: {"type": "object", "properties": {"status": {"type": "string"}}}}
# )
# class MarkMessageReadView(APIView):
#     permission_classes = [permissions.IsAuthenticated]

#     def post(self, request):
#         message_id = request.data.get('message_id')
#         msg = Message.objects.filter(id=message_id).first()
#         if msg:
#             msg.is_read = True
#             msg.save()
#             return Response({'status': 'read'})
#         return Response({'error': 'Invalid message_id'}, status=400)

# @extend_schema(
#     summary="Unread message count",
#     description="Get total unread messages for the user",
#     responses={200: {"type": "object", "properties": {"unread_count": {"type": "integer"}}}}
# )
# class UnreadCountView(APIView):
#     permission_classes = [permissions.IsAuthenticated]

#     def get(self, request):
#         user_id = self.request.user.id
#         count = Message.objects.filter(receiver_id=user_id, is_read=False).count()
#         return Response({'unread_count': count})

# @extend_schema_view(
#     get=extend_schema(summary="List recent chat users", responses={200: RecentChatUserSerializer(many=True)}),
# )
# class RecentChatsView(generics.ListAPIView):
#     serializer_class = RecentChatUserSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         user_id = self.request.user.id
#         sent_to = Message.objects.filter(sender_id=user_id).values_list('receiver', flat=True)
#         received_from = Message.objects.filter(receiver_id=user_id).values_list('sender', flat=True)
#         user_ids = set(sent_to).union(set(received_from))
#         return users.objects.filter(id__in=user_ids)


# @extend_schema(
#     parameters=[
#         OpenApiParameter(name='activity', type=int, location=OpenApiParameter.QUERY, required=True, description='Activity ID to fetch group chat messages')
#     ],
#     responses={200: ActivityMessageSerializer(many=True)}
# )


# class ActivityMessageListCreateView(generics.ListCreateAPIView):
#     serializer_class = ActivityMessageSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         activity_id = self.request.query_params.get("activity")
#         return ActivityMessage.objects.filter(activity_id=activity_id).order_by('-timestamp') if activity_id else ActivityMessage.objects.none()

#     def perform_create(self, serializer):
#         serializer.save(sender=self.request.user)

# class MarketplaceItemListCreateView(generics.ListCreateAPIView):
#     serializer_class = MarketplaceItemSerializer
#     queryset = MarketplaceItem.objects.all()
#     permission_classes = [permissions.IsAuthenticated]

# @extend_schema(
#     parameters=[
#         OpenApiParameter(name='item', type=int, location=OpenApiParameter.QUERY, required=True, description='Marketplace Item ID to fetch messages')
#     ],
#     responses={200: MarketplaceMessageSerializer(many=True)}
# )


# class MarketplaceMessageListCreateView(generics.ListCreateAPIView):
#     serializer_class = MarketplaceMessageSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         item_id = self.request.query_params.get("item")
#         return MarketplaceMessage.objects.filter(item_id=item_id).order_by('-timestamp') if item_id else MarketplaceMessage.objects.none()

#     def perform_create(self, serializer):
#         serializer.save(sender=self.request.user)

# @extend_schema_view(
#     get=extend_schema(summary="List all communities"),
#     post=extend_schema(summary="Create a new community"),
# )
# class CommunityListCreateView(generics.ListCreateAPIView):
#     queryset = Community.objects.all()
#     serializer_class = CommunitySerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         club_id = self.request.query_params.get('club_id')
#         return Community.objects.filter(club_id=club_id) if club_id else Community.objects.all()

#     def perform_create(self, serializer):
#         serializer.save(created_by=self.request.user)

# @extend_schema(summary="Get, update or delete a specific community")
# class CommunityDetailView(generics.RetrieveUpdateDestroyAPIView):
#     queryset = Community.objects.all()
#     serializer_class = CommunitySerializer
#     permission_classes = [permissions.IsAuthenticated]
#     lookup_field = 'id'


# @extend_schema(summary="Join a community")
# class JoinCommunityView(generics.CreateAPIView):
#     queryset = CommunityMembership.objects.all()
#     serializer_class = CommunityMembershipSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def perform_create(self, serializer):
#         serializer.save(user=self.request.user)

# @extend_schema(summary="Get communities the user is a member of")
# class MyCommunitiesView(generics.ListAPIView):
#     serializer_class = CommunitySerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         return Community.objects.filter(memberships__user__id=self.request.user.id)

# @extend_schema(summary="List members of a specific community")
# class CommunityMembersView(generics.ListAPIView):
#     serializer_class = CommunityMembershipSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         return CommunityMembership.objects.filter(community_id=self.kwargs['community_id'])

# @extend_schema_view(
#     get=extend_schema(summary="Get messages for a community"),
#     post=extend_schema(summary="Post a message to a community"),
# )
# class CommunityMessageListCreateView(generics.ListCreateAPIView):
#     serializer_class = CommunityMessageSerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         return CommunityMessage.objects.filter(community_id=self.kwargs['community_id']).order_by('-timestamp')

#     def perform_create(self, serializer):
#         serializer.save(sender=self.request.user, community_id=self.kwargs['community_id'])

# @extend_schema(summary="List communities the user has active chats in")
# class CommunityChatThreadsView(generics.ListAPIView):
#     serializer_class = CommunitySerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         return Community.objects.filter(memberships__user__id=self.request.user.id).distinct()

# @extend_schema(
#     summary="My Created Communities",
#     description="Returns all communities that the authenticated user has created.",
#     responses={200: CommunitySerializer(many=True)},
#     tags=["Community"]
# )
# class MyCreatedCommunitiesView(generics.ListAPIView):
#     serializer_class = CommunitySerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):
#         return Community.objects.filter(created_by_id=self.request.user.id)

# @extend_schema(
#     summary="Explore Communities",
#     description="Communities in selected club that user has not joined.",
#     parameters=[
#         OpenApiParameter(name="club_id", required=True, type=int, location=OpenApiParameter.QUERY)
#     ],
#     responses={200: CommunitySerializer(many=True)},
#     tags=["Community"]
# )
# class ExploreCommunitiesView(generics.ListAPIView):
#     serializer_class = CommunitySerializer
#     permission_classes = [permissions.IsAuthenticated]

#     def get_queryset(self):

#         club_id = self.request.query_params.get("club_id")
#         return Community.objects.filter(club_id=club_id).exclude(memberships__user__id=self.request.user.id)