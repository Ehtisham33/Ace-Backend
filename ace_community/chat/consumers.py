import json
from channels.generic.websocket import AsyncWebsocketConsumer
from channels.db import database_sync_to_async
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
        file_url = data.get('file_url')
        typing = data.get('typing', False)

        sender = await self.get_user(sender_id)
        if not sender:
            return

        # Typing indicator only
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

        # Save messages per room type
        if self.room_type == "private":
            receiver = await self.get_user(receiver_id)
            if receiver:
                await self.save_private_message(sender, receiver, message_text, file_url)

        elif self.room_type == "activity":
            activity = await self.get_activity(self.room_id)
            if activity:
                await self.save_activity_message(activity, sender, message_text, file_url)

        elif self.room_type == "marketplace":
            item = await self.get_item(self.room_id)
            receiver = await self.get_user(receiver_id)
            if item and receiver:
                await self.save_marketplace_message(item, sender, receiver, message_text, file_url)

        elif self.room_type == "community":
            community = await self.get_community(self.room_id)
            if community:
                await self.save_community_message(community, sender, message_text, file_url)

        # Broadcast
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

    # ----- ORM Access via sync wrappers -----

    @database_sync_to_async
    def get_user(self, user_id):
        return Users.objects.filter(id=user_id).first()

    @database_sync_to_async
    def get_activity(self, activity_id):
        return CourtBookings.objects.filter(id=activity_id).first()

    @database_sync_to_async
    def get_item(self, item_id):
        return MarketplaceItem.objects.filter(id=item_id).first()

    @database_sync_to_async
    def get_community(self, community_id):
        return Community.objects.filter(id=community_id).first()

    @database_sync_to_async
    def save_private_message(self, sender, receiver, content, file_url):
        return Message.objects.create(sender=sender, receiver=receiver, content=content, file=file_url)

    @database_sync_to_async
    def save_activity_message(self, activity, sender, content, file_url):
        return ActivityMessage.objects.create(activity=activity, sender=sender, content=content, file=file_url)

    @database_sync_to_async
    def save_marketplace_message(self, item, sender, receiver, content, file_url):
        return MarketplaceMessage.objects.create(item=item, sender=sender, receiver=receiver, content=content, file=file_url)

    @database_sync_to_async
    def save_community_message(self, community, sender, content, file_url):
        return CommunityMessage.objects.create(community=community, sender=sender, content=content, file=file_url)
