from rest_framework import serializers
from laravel_models.models import Users as Users
from chat.models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage,
    Community, 
    CommunityMembership, 
    CommunityMessage,
    CommunityFavorite,
    UserFollower,
    CommunityPost,
    PostComment,
    PostLike,
    CommunityReport
)


class UserMiniSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ['id','first_name','last_name', 'user_name', 'email']  


# 🔹 Private Chat
class MessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()
    sender = UserMiniSerializer(read_only=True)
    receiver = UserMiniSerializer(read_only=True)
    receiver_id = serializers.PrimaryKeyRelatedField(
        queryset=Users.objects.all(), write_only=True, source='receiver'
    )

    class Meta:
        model = Message
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None


# 🔹 Recent Chat List
class RecentChatUserSerializer(serializers.ModelSerializer):
    last_message = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ['id', 'user_name', 'last_message']

    def get_last_message(self, user):
        try:
            request_user_id = self.context['request'].user.id
        except AttributeError:
            return None

        msg = Message.objects.filter(
            sender_id__in=[request_user_id, user.id],
            receiver_id__in=[request_user_id, user.id]
        ).order_by('-timestamp').first()

        return MessageSerializer(msg, context=self.context).data if msg else None

# 🔹 Activity Chat
class ActivityMessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()

    class Meta:
        model = ActivityMessage
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None

# 🔹 Marketplace Items
class MarketplaceItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = MarketplaceItem
        fields = '__all__'

# 🔹 Marketplace Chat
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

# 🔹 Community with extra info
class CommunitySerializer(serializers.ModelSerializer):
    member_count = serializers.SerializerMethodField()
    created_by_name = serializers.CharField(source='created_by.user_name', read_only=True)
    club_name = serializers.CharField(source='club.name', read_only=True)

    class Meta:
        model = Community
        fields = (
            'id', 'name', 'description', 'club', 'sport', 'level', 'is_private',
            'location', 'topic', 'requires_approval', 'cover_image',
            'created_by', 'created_at',
            'member_count', 'created_by_name', 'club_name',
        )
        read_only_fields = ['created_by', 'created_at']

    def get_member_count(self, obj):
        return obj.memberships.count()


# 🔹 Community Members
class CommunityMembershipSerializer(serializers.ModelSerializer):
    user = UserMiniSerializer(read_only=True) 

    class Meta:
        model = CommunityMembership
        fields = '__all__'
        read_only_fields = ['user', 'community'] 

# 🔹 Community Chat
class CommunityMessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()

    class Meta:
        model = CommunityMessage
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None


class CommunityFavoriteSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommunityFavorite
        fields = '__all__'


class UserFollowerSerializer(serializers.ModelSerializer):
    follower_name = serializers.CharField(source='follower.user_name', read_only=True)
    following_name = serializers.CharField(source='following.user_name', read_only=True)

    class Meta:
        model = UserFollower
        fields = ['id', 'follower', 'following', 'created_at', 'follower_name', 'following_name']


MAX_IMAGE_SIZE_MB = 5
MAX_VIDEO_SIZE_MB = 20
MAX_CONTENT_LENGTH = 1000

class CommunityPostSerializer(serializers.ModelSerializer):
    author_name = serializers.CharField(source='author.user_name', read_only=True)
    community_name = serializers.CharField(source='community.name', read_only=True)

    class Meta:
        model = CommunityPost
        fields = [
            'id',
            'community', 'community_name',
            'author', 'author_name',
            'content',
            'image',
            'video',
            'category',
            'tags',
            'is_private',
            'location',
            'created_at'
        ]
        read_only_fields = ['author', 'created_at','community']

    def validate_content(self, value):
        if len(value) > MAX_CONTENT_LENGTH:
            raise serializers.ValidationError(f"Post content cannot exceed {MAX_CONTENT_LENGTH} characters.")
        return value

    def validate_image(self, image):
        if image and image.size > MAX_IMAGE_SIZE_MB * 1024 * 1024:
            raise serializers.ValidationError(f"Image size must be under {MAX_IMAGE_SIZE_MB}MB.")
        return image

    def validate_video(self, video):
        if video and video.size > MAX_VIDEO_SIZE_MB * 1024 * 1024:
            raise serializers.ValidationError(f"Video size must be under {MAX_VIDEO_SIZE_MB}MB.")
        return video

    def create(self, validated_data):
        # Placeholder for future auto-tag parsing logic
        # tags = validated_data.get("tags", "")
        # validated_data["tags"] = process_tags(tags)
        return super().create(validated_data)


class PostLikeSerializer(serializers.ModelSerializer):
    user_name = serializers.CharField(source='user.user_name', read_only=True)

    class Meta:
        model = PostLike
        fields = ['id', 'post', 'user', 'user_name', 'liked_at']
        read_only_fields = ['user', 'liked_at', 'post']


class PostCommentSerializer(serializers.ModelSerializer):
    user_name = serializers.CharField(source='user.user_name', read_only=True)
    replies = serializers.SerializerMethodField()

    class Meta:
        model = PostComment
        fields = [
            'id', 'post', 'user', 'user_name',
            'content', 'parent', 'created_at',
            'replies'
        ]
        read_only_fields = ['user', 'created_at', 'replies']

    def get_replies(self, obj):
        if obj.replies.exists():
            return PostCommentSerializer(
                obj.replies.order_by('created_at'),
                many=True,
                context=self.context
            ).data
        return []



class CommunityReportSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommunityReport
        fields = ['id', 'community', 'reported_by', 'reason', 'created_at']
        read_only_fields = ['reported_by', 'created_at']


class EmptySerializer(serializers.Serializer):
    pass