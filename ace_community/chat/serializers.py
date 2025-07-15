from rest_framework import serializers
from laravel_models.models import users as Users
from chat.models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage,
    Community, 
    CommunityMembership, 
    CommunityMessage
)


class MessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()

    class Meta:
        model = Message
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None


class RecentChatUserSerializer(serializers.ModelSerializer):
    last_message = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ['id', 'user_name', 'last_message']

    def get_last_message(self, user):
        try:
            request_user_id = int(self.context['request'].headers.get("X-User-ID"))
        except (TypeError, ValueError):
            return None

        msg = Message.objects.filter(
            sender_id__in=[request_user_id, user.id],
            receiver_id__in=[request_user_id, user.id]
        ).order_by('-timestamp').first()

        return MessageSerializer(msg, context=self.context).data if msg else None


class ActivityMessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()

    class Meta:
        model = ActivityMessage
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None


class MarketplaceItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = MarketplaceItem
        fields = '__all__'


class MarketplaceMessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()
    item = MarketplaceItemSerializer(read_only=True)

    class Meta:
        model = MarketplaceMessage
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None


class CommunitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Community
        fields = '__all__'


class CommunityMembershipSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommunityMembership
        fields = '__all__'


class CommunityMessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()

    class Meta:
        model = CommunityMessage
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None
