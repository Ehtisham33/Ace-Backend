from rest_framework import serializers
from laravel_models.models import users as Users
from chat.models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage
)


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = '__all__'


class RecentChatUserSerializer(serializers.ModelSerializer):
    last_message = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ['id', 'user_name', 'last_message']

    def get_last_message(self, user):
        request_user_id = self.context['request'].headers.get("X-User-ID")
        if not request_user_id:
            return None
        msg = Message.objects.filter(
            sender_id__in=[request_user_id, user.id],
            receiver_id__in=[request_user_id, user.id]
        ).order_by('-timestamp').first()
        return MessageSerializer(msg).data if msg else None


class ActivityMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ActivityMessage
        fields = '__all__'


class MarketplaceItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = MarketplaceItem
        fields = '__all__'


class MarketplaceMessageSerializer(serializers.ModelSerializer):
    item = MarketplaceItemSerializer(read_only=True)

    class Meta:
        model = MarketplaceMessage
        fields = '__all__'
