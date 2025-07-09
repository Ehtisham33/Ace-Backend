import json
from channels.generic.websocket import AsyncWebsocketConsumer
from chat.models import (
    Message,
    ActivityMessage,
    MarketplaceMessage,
    CommunityMessage,
    MarketplaceItem,
    Community,
    CourtBookings,
)
from laravel_models.models import users


class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_type = self.scope['url_route']['kwargs']['room_type']  # private, activity, marketplace, community
        self.room_id = self.scope['url_route']['kwargs']['room_id']
        self.room_group_name = f"{self.room_type}_chat_{self.room_id}"

        await self.channel_layer.group_add(self.room_group_name, self.channel_name)
        await self.accept()

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(self.room_group_name, self.channel_name)

    async def receive(self, text_data):
        data = json.loads(text_data)
        sender_id = data.get('sender')
        receiver_id = data.get('receiver')
        message_text = data.get('message')
        typing = data.get('typing', False)

        # Save to DB based on chat type
        sender = users.objects.filter(id=sender_id).first()
        if not sender:
            return

        if self.room_type == "private":
            receiver = users.objects.filter(id=receiver_id).first()
            if receiver:
                Message.objects.create(sender=sender, receiver=receiver, content=message_text)

        elif self.room_type == "activity":
            activity = CourtBookings.objects.filter(id=self.room_id).first()
            if activity:
                ActivityMessage.objects.create(activity=activity, sender=sender, content=message_text)

        elif self.room_type == "marketplace":
            item = MarketplaceItem.objects.filter(id=self.room_id).first()
            if item and receiver_id:
                receiver = users.objects.filter(id=receiver_id).first()
                if receiver:
                    MarketplaceMessage.objects.create(item=item, sender=sender, receiver=receiver, content=message_text)

        elif self.room_type == "community":
            community = Community.objects.filter(id=self.room_id).first()
            if community:
                CommunityMessage.objects.create(community=community, sender=sender, content=message_text)

        # Broadcast message to room
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message_text,
                'sender': sender_id,
                'receiver': receiver_id,
                'typing': typing,
                'room_type': self.room_type,
                'room_id': self.room_id
            }
        )

    async def chat_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['message'],
            'sender': event['sender'],
            'receiver': event['receiver'],
            'typing': event.get('typing', False),
            'room_type': event['room_type'],
            'room_id': event['room_id'],
        }))
