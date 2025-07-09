from django.urls import path
from .views import (
    MessageListCreateView,
    RecentChatsView,
    ActivityMessageListCreateView,
    MarketplaceItemListCreateView,
    MarketplaceMessageListCreateView,
    CommunityListCreateView,
    CommunityDetailView,
    JoinCommunityView,
    MyCommunitiesView,
    CommunityMembersView,
    CommunityMessageListCreateView,
    CommunityChatThreadsView,
    MyCreatedCommunitiesView,
    ExploreCommunitiesView
)

urlpatterns = [
    # 🔹 Direct Chat (1:1)
    path('messages/', MessageListCreateView.as_view(), name='messages'),
    path('recent-chats/', RecentChatsView.as_view(), name='recent-chats'),

    # 🔹 Activity Group Chat
    path('activity/messages/', ActivityMessageListCreateView.as_view(), name='activity-messages'),

    # 🔹 Marketplace Chat
    path('marketplace/items/', MarketplaceItemListCreateView.as_view(), name='marketplace-items'),
    path('marketplace/messages/', MarketplaceMessageListCreateView.as_view(), name='marketplace-messages'),

     # 🔹 Community System
    path('communities/', CommunityListCreateView.as_view(), name='community-list-create'),
    path('communities/<int:id>/', CommunityDetailView.as_view(), name='community-detail'),
    path('communities/<int:community_id>/join/', JoinCommunityView.as_view(), name='join-community'),
    path('communities/my/', MyCommunitiesView.as_view(), name='my-communities'),
    path('communities/<int:community_id>/members/', CommunityMembersView.as_view(), name='community-members'),
    path('communities/<int:community_id>/messages/', CommunityMessageListCreateView.as_view(), name='community-messages'),
    path('communities/chat-threads/', CommunityChatThreadsView.as_view(), name='community-chat-threads'),
    path('community/my-created/', MyCreatedCommunitiesView.as_view(), name='my-created-communities'),
    path('community/explore/', ExploreCommunitiesView.as_view(), name='explore-communities'),


]
