from django.urls import path
from .views import MessageListCreateView, RecentChatsView

urlpatterns = [
    path('messages/', MessageListCreateView.as_view(), name='messages'),
    path('recent-chats/', RecentChatsView.as_view(), name='recent-chats'),
]
