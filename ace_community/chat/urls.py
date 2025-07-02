from django.urls import path
from .views import (
    MessageListCreateView,
    RecentChatsView,
    ActivityMessageListCreateView,
    MarketplaceItemListCreateView,
    MarketplaceMessageListCreateView
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
]
