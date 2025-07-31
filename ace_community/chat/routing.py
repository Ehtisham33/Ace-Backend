from django.urls import re_path
from . import consumers

# WebSocket chat routing for:
# - private: 1:1 direct messaging
# - activity: group chats tied to CourtBookings
# - marketplace: item-specific chats
# - community: general community threads
websocket_urlpatterns = [
    re_path(
        r'ws/(?P<room_type>private|activity|marketplace|community)/(?P<room_id>\w+)/$',
        consumers.ChatConsumer.as_asgi(),
        name='chat-socket'
    ),
]
