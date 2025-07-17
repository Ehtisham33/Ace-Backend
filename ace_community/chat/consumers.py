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
from laravel_models.models import Users


class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_type = self.scope['url_route']['kwargs']['room_type']
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
        message_text = data.get('message', '')
        file_url = data.get('file_url')  # from frontend (optional)
        typing = data.get('typing', False)

        sender = Users.objects.filter(id=sender_id).first()
        if not sender:
            return

        # Handle typing only (no message sent yet)
        if typing and not message_text and not file_url:
            await self.channel_layer.group_send(
                self.room_group_name,
                {
                    'type': 'typing_status',
                    'sender': sender_id,
                    'room_type': self.room_type,
                    'room_id': self.room_id,
                    'typing': True
                }
            )
            return

        # Save message if content or file is present
        if self.room_type == "private":
            receiver = Users.objects.filter(id=receiver_id).first()
            if receiver:
                Message.objects.create(sender=sender, receiver=receiver, content=message_text, file=file_url)

        elif self.room_type == "activity":
            activity = CourtBookings.objects.filter(id=self.room_id).first()
            if activity:
                ActivityMessage.objects.create(activity=activity, sender=sender, content=message_text, file=file_url)

        elif self.room_type == "marketplace":
            item = MarketplaceItem.objects.filter(id=self.room_id).first()
            if item and receiver_id:
                receiver = Users.objects.filter(id=receiver_id).first()
                if receiver:
                    MarketplaceMessage.objects.create(item=item, sender=sender, receiver=receiver, content=message_text, file=file_url)

        elif self.room_type == "community":
            community = Community.objects.filter(id=self.room_id).first()
            if community:
                CommunityMessage.objects.create(community=community, sender=sender, content=message_text, file=file_url)

        # Broadcast message to room
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message_text,
                'file_url': file_url,
                'sender': sender_id,
                'receiver': receiver_id,
                'typing': False,
                'room_type': self.room_type,
                'room_id': self.room_id
            }
        )

    async def chat_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['message'],
            'file_url': event.get('file_url'),
            'sender': event['sender'],
            'receiver': event['receiver'],
            'typing': event.get('typing', False),
            'room_type': event['room_type'],
            'room_id': event['room_id'],
        }))

    async def typing_status(self, event):
        await self.send(text_data=json.dumps({
            'typing': event.get('typing', True),
            'sender': event['sender'],
            'room_type': event['room_type'],
            'room_id': event['room_id'],
        }))
