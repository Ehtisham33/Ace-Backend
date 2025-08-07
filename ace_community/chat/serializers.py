import os
from django.core.exceptions import ValidationError
from rest_framework import serializers
from rest_framework.pagination import PageNumberPagination
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
    CommunityReport,
    Notification,
    CommentLike
)


class UserMiniSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ['id','first_name','last_name', 'user_name', 'email','image']


MAX_IMAGE_SIZE_MB = 5
MAX_VIDEO_SIZE_MB = 20
MAX_CONTENT_LENGTH = 1000

class CommunityPostSerializer(serializers.ModelSerializer):
    author_name = serializers.CharField(source='author.user_name', read_only=True)
    community_name = serializers.CharField(source='community.name', read_only=True)
    comment_count = serializers.SerializerMethodField()
    like_count = serializers.SerializerMethodField()
    liked_by_me = serializers.SerializerMethodField()
    shared_from = serializers.SerializerMethodField()
    share_count = serializers.SerializerMethodField()

    class Meta:
        model = CommunityPost
        fields = [
            'id',
            'community', 'community_name',
            'author', 'author_name',
            'content',
            'image',
            'video',
            'file',
            'category',
            'tags',
            'is_private',
            'location',
            'created_at',
            'comment_count',
            'like_count',
            'liked_by_me',
            'shared_from',
            'share_count'
        ]
        read_only_fields = ['author', 'created_at','community']

    def get_comment_count(self, obj):
        return PostComment.objects.filter(post=obj).count()
    
    def get_like_count(self, obj):
        return PostLike.objects.filter(post=obj).count()

    def get_liked_by_me(self, obj):
        user = self.context.get('request').user
        return PostLike.objects.filter(post=obj, user=user).exists()
    
    def get_shared_from(self, obj):
        if obj.shared_from:
            return {
                "id": obj.shared_from.id,
                "community_id": obj.shared_from.community.id,
                "community_name": obj.shared_from.community.name,
                "author_id": obj.shared_from.author.id,
                "author_name": obj.shared_from.author.user_name,
                "content": obj.shared_from.content[:100],
            }
        return None

    def get_share_count(self, obj):
        return obj.shared_copies.count()
    
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
    

class PostLikeUserSerializer(serializers.ModelSerializer):
    user = UserMiniSerializer(read_only=True)

    class Meta:
        model = PostLike
        fields = ['user', 'liked_at']



class MutualMemberSerializer(UserMiniSerializer):
    is_mutual_friend = serializers.SerializerMethodField()

    class Meta(UserMiniSerializer.Meta):
        fields = UserMiniSerializer.Meta.fields + ['is_mutual_friend']

    def get_is_mutual_friend(self, obj):
        mutual_ids = self.context.get('mutual_ids', set())
        return obj.id in mutual_ids  

    

# 🔹 Private Chat
class MessageSerializer(serializers.ModelSerializer):
    file_url = serializers.SerializerMethodField()
    sender = UserMiniSerializer(read_only=True)
    receiver = UserMiniSerializer(read_only=True)
    receiver_id = serializers.PrimaryKeyRelatedField(
        queryset=Users.objects.all(), write_only=True, source='receiver'
    )

        # ✅ NEW FIELDS
    shared_post = CommunityPostSerializer(read_only=True)
    shared_post_id = serializers.PrimaryKeyRelatedField(
        queryset=CommunityPost.objects.all(),
        source='shared_post',
        write_only=True,
        required=False
    )

    class Meta:
        model = Message
        fields = '__all__'
        read_only_fields = ['timestamp', 'is_read', 'sender']

    def get_file_url(self, obj):
        request = self.context.get('request')
        return request.build_absolute_uri(obj.file.url) if obj.file and request else None

    def validate(self, data):
        file = data.get('file')
        file_type = data.get('file_type')

        if file:
            ext = os.path.splitext(file.name)[1].lower()

            # Map extensions to expected file_type
            ext_to_type = {
                '.jpg': 'image', '.jpeg': 'image', '.png': 'image', '.gif': 'image',
                '.mp4': 'video', '.mov': 'video', '.avi': 'video',
                '.mp3': 'voice', '.wav': 'voice', '.ogg': 'voice',
                '.pdf': 'document', '.doc': 'document', '.docx': 'document',
                '.xlsx': 'document', '.xls': 'document', '.ppt': 'document', '.pptx': 'document',
            }

            # Determine actual file type from extension
            detected_type = ext_to_type.get(ext)

            if not detected_type:
                raise serializers.ValidationError(f"Unsupported file extension: {ext}")

            # Validate declared type vs detected type
            if file_type != detected_type:
                raise serializers.ValidationError(
                    f"Mismatch: 'file_type' is '{file_type}', but file extension suggests '{detected_type}'"
                )

        return data


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

    def validate_file(self, value):
        allowed_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.mp4', '.mov', '.mp3', '.wav', '.pdf', '.doc', '.docx']
        max_size = 10 * 1024 * 1024  # 10 MB

        ext = os.path.splitext(value.name)[1].lower()
        if ext not in allowed_extensions:
            raise ValidationError(f"Unsupported file type '{ext}'. Allowed types: {', '.join(allowed_extensions)}")

        if value.size > max_size:
            raise ValidationError("File size must be under 10MB.")

        return value

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

    def validate_file(self, value):
        allowed_extensions = [
            '.jpg', '.jpeg', '.png', '.gif',
            '.mp4', '.mov',
            '.mp3', '.wav',
            '.pdf', '.doc', '.docx'
        ]
        max_size = 10 * 1024 * 1024  # 10 MB

        ext = os.path.splitext(value.name)[1].lower()
        if ext not in allowed_extensions:
            raise ValidationError(f"Unsupported file type '{ext}'. Allowed types: {', '.join(allowed_extensions)}")

        if value.size > max_size:
            raise ValidationError("File size must be under 10MB.")

        return value

# 🔹 Community with extra info
class CommunityPlayerSerializer(serializers.ModelSerializer):
    member_count = serializers.SerializerMethodField()
    mutual_members = serializers.SerializerMethodField()
    is_member = serializers.SerializerMethodField()
    is_creator = serializers.SerializerMethodField()
    is_admin = serializers.SerializerMethodField()
    members = serializers.SerializerMethodField()

    class Meta:
        model = Community
        fields = [
            'id', 'name', 'description', 'sport',
            'skill_level', 'visibility', 'requires_approval', 'cover_image',
            'member_count', 'mutual_members','is_member', 'is_creator', 'is_admin', 'members'
        ]
        read_only_fields = ['id']

    def get_is_member(self, obj):
        user = self.context['request'].user
        return CommunityMembership.objects.filter(community=obj, user=user).exists()

    def get_is_creator(self, obj):
        return obj.created_by_id == self.context['request'].user.id

    def get_is_admin(self, obj):
        user = self.context['request'].user
        return CommunityMembership.objects.filter(community=obj, user=user, is_admin=True).exists()

    def get_members(self, obj):
        qs = CommunityMembership.objects.filter(community=obj)
        return CommunityMembershipSerializer(qs, many=True).data

    def get_member_count(self, obj):
        return obj.memberships.count() if hasattr(obj, 'memberships') else 0

    def get_mutual_members(self, obj):
        request = self.context.get('request')
        if not request or not request.user.is_authenticated:
            return []

        request_user = request.user

        # Get followers and followings
        following_ids = set(UserFollower.objects.filter(follower=request_user).values_list('following_id', flat=True))
        follower_ids = set(UserFollower.objects.filter(following=request_user).values_list('follower_id', flat=True))
        mutual_ids = following_ids & follower_ids

        # Filter users who are both members of the community and mutual friends
        mutual_members_qs = Users.objects.filter(
            communitymembership__community=obj,
            id__in=mutual_ids
        ).distinct()

        return MutualMemberSerializer(
            mutual_members_qs,
            many=True,
            context={**self.context, 'mutual_ids': mutual_ids}
        ).data
    

class ClubCommunitySerializer(serializers.ModelSerializer):
    created_by_name = serializers.CharField(source='created_by.user_name', read_only=True)
    club_name = serializers.CharField(source='club.name', read_only=True)
    member_count = serializers.SerializerMethodField()
    mutual_members = serializers.SerializerMethodField()
    is_member = serializers.SerializerMethodField()
    is_creator = serializers.SerializerMethodField()
    is_admin = serializers.SerializerMethodField()
    members = serializers.SerializerMethodField()

    class Meta:
        model = Community
        fields = [
            'id', 'name', 'official_title', 'description',
            'sport', 'level', 'skill_level', 'visibility', 'requires_approval',
            'cover_image', 'status', 'last_activity_at',
            'club', 'club_name', 'created_by', 'created_by_name',
            'created_at', 'member_count', 'mutual_members','is_member', 'is_creator', 'is_admin', 'members'
        ]
        read_only_fields = ['created_by', 'created_at']

    def get_is_member(self, obj):
        user = self.context['request'].user
        return CommunityMembership.objects.filter(community=obj, user=user).exists()

    def get_is_creator(self, obj):
        return obj.created_by_id == self.context['request'].user.id

    def get_is_admin(self, obj):
        user = self.context['request'].user
        return CommunityMembership.objects.filter(community=obj, user=user, is_admin=True).exists()

    def get_members(self, obj):
        qs = CommunityMembership.objects.filter(community=obj)
        return CommunityMembershipSerializer(qs, many=True).data

    def get_member_count(self, obj):
        return obj.memberships.count() if hasattr(obj, 'memberships') else 0

    def get_mutual_members(self, obj):
        request = self.context.get('request')
        if not request or not request.user.is_authenticated:
            return []

        request_user = request.user
        
        following_ids = set(UserFollower.objects.filter(follower=request_user).values_list('following_id', flat=True))
        follower_ids = set(UserFollower.objects.filter(following=request_user).values_list('follower_id', flat=True))
        mutual_ids = following_ids & follower_ids


        mutual_members_qs = Users.objects.filter(
            communitymembership__community=obj,
            id__in=mutual_ids
        ).distinct()

        return MutualMemberSerializer(
            mutual_members_qs,
            many=True,
            context={**self.context, 'mutual_ids': mutual_ids}
        ).data

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Set all fields optional by default
        for field in self.fields.values():
            field.required = False

        # Make selected fields required on create/update
        required_fields = ['name', 'sport', 'description', 'visibility', 'requires_approval', 'club']
        for field_name in required_fields:
            self.fields[field_name].required = True



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

    def validate_file(self, value):
        allowed_extensions = [
            '.jpg', '.jpeg', '.png', '.gif',
            '.mp4', '.mov',
            '.mp3', '.wav',
            '.pdf', '.doc', '.docx'
        ]
        max_size = 10 * 1024 * 1024  # 10 MB

        ext = os.path.splitext(value.name)[1].lower()
        if ext not in allowed_extensions:
            raise ValidationError(
                f"Unsupported file type '{ext}'. Allowed types: {', '.join(allowed_extensions)}"
            )

        if value.size > max_size:
            raise ValidationError("File size must be under 10MB.")

        return value


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


class PostLikeSerializer(serializers.ModelSerializer):
    user_name = serializers.CharField(source='user.user_name', read_only=True)

    class Meta:
        model = PostLike
        fields = ['id', 'post', 'user', 'user_name', 'liked_at']
        read_only_fields = ['user', 'liked_at', 'post']


class PostCommentSerializer(serializers.ModelSerializer):
    user = UserMiniSerializer(read_only=True)
    user_name = serializers.CharField(source='user.user_name', read_only=True)
    replies = serializers.SerializerMethodField()
    like_count = serializers.SerializerMethodField()
    liked_by_me = serializers.SerializerMethodField()

    class Meta:
        model = PostComment
        fields = [
            'id', 'post', 'user', 'user_name',
            'content', 'parent', 'created_at',
            'replies','like_count', 'liked_by_me'
        ]
        read_only_fields = ['user', 'created_at', 'replies','post']

    def get_like_count(self, obj):
        return obj.likes.count()

    def get_liked_by_me(self, obj):
        user = self.context.get('request').user
        return obj.likes.filter(user=user).exists()

    def get_replies(self, obj):
        request = self.context.get('request')
        if not request:
            return []

        replies_qs = obj.replies.order_by('created_at')

        paginator = PageNumberPagination()
        paginator.page_size_query_param = 'reply_page_size'   # optional: ?reply_page_size=5
        paginator.page_query_param = 'reply_page'             # optional: ?reply_page=2

        paginated_qs = paginator.paginate_queryset(replies_qs, request)
        return PostCommentSerializer(paginated_qs, many=True, context=self.context).data


class CommunityReportSerializer(serializers.ModelSerializer):
    class Meta:
        model = CommunityReport
        fields = ['id', 'community', 'reported_by', 'reason', 'created_at']
        read_only_fields = ['reported_by', 'created_at','community']


class EmptySerializer(serializers.Serializer):
    pass


class NotificationSerializer(serializers.ModelSerializer):
    sender = UserMiniSerializer(read_only=True)

    class Meta:
        model = Notification
        fields = [
            'id', 'recipient', 'sender', 'notification_type',
            'post', 'comment', 'message', 'is_read', 'created_at'
        ]
        read_only_fields = ['recipient', 'created_at']


class PendingMembershipSerializer(serializers.ModelSerializer):
    user = UserMiniSerializer(read_only=True)

    class Meta:
        model = CommunityMembership
        fields = ['user', 'community_id', 'is_approved']


class CommentLikeSerializer(serializers.ModelSerializer):
    user = UserMiniSerializer(read_only=True)

    class Meta:
        model = CommentLike
        fields = ['id', 'comment', 'user', 'liked_at']
        read_only_fields = ['id', 'liked_at', 'user']
