from mutagen import File as MutagenFile
import mimetypes
from django.db import models
from django.core.validators import MaxLengthValidator, MinValueValidator, MaxValueValidator
from laravel_models.models import Users, CourtBookings, Clubs


class Message(models.Model):
    sender = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        related_name='sent_messages',
        db_column='sender_id'
    )
    receiver = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        related_name='received_messages',
        db_column='receiver_id'
    )
    content = models.TextField(blank=True)
    file = models.FileField(upload_to='chat_files/', null=True, blank=True)
    file_type = models.CharField(max_length=20, choices=[
        ('document', 'Document'),
        ('voice', 'Voice'),
        ('image','Image'),
        ('video','Video')
    ], null=True, blank=True )
    timestamp = models.DateTimeField(auto_now_add=True)
    duration = models.FloatField(null=True, blank=True, help_text="Voice message duration in seconds")
    is_read = models.BooleanField(default=False)
    shared_post = models.ForeignKey('CommunityPost', null=True, blank=True, on_delete=models.SET_NULL, related_name='shared_in_messages')

    def save(self, *args, **kwargs):
        if self.file and self.file_type == 'voice':
            try:

                mime_type, _ = mimetypes.guess_type(self.file.name)
                if mime_type and mime_type.startswith('audio'):
                    audio = MutagenFile(self.file)
                    self.duration = round(audio.info.length, 2) if audio and audio.info else None
                else:
                    self.duration = None
            except Exception:
                self.duration = None
        super().save(*args, **kwargs)

    class Meta:
        ordering = ['timestamp']
        db_table = 'messages'
        indexes = [
            models.Index(fields=['timestamp']),
            models.Index(fields=['sender']),
            models.Index(fields=['receiver']),
        ]


class ActivityMessage(models.Model):
    activity = models.ForeignKey(
        CourtBookings,
        on_delete=models.CASCADE,
        db_column='activity_id',
        related_name='activity_messages'
    )
    sender = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        related_name='activity_sent_messages'
    )
    content = models.TextField(blank=True)
    duration = models.FloatField(null=True, blank=True, help_text="Voice message duration in seconds")
    file = models.FileField(upload_to='chat_files/activity/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    file_type = models.CharField(max_length=20, choices=[
        ('document', 'Document'),
        ('voice', 'Voice'),
        ('image','Image'),
        ('video','Video')
    ], null=True, blank=True )

    def save(self, *args, **kwargs):
        if self.file and self.file_type == 'voice':
            try:
                # Optional safety check: only proceed if MIME is audio
                mime_type, _ = mimetypes.guess_type(self.file.name)
                if mime_type and mime_type.startswith('audio'):
                    audio = MutagenFile(self.file)
                    self.duration = round(audio.info.length, 2) if audio and audio.info else None
                else:
                    self.duration = None
            except Exception:
                self.duration = None
        super().save(*args, **kwargs)

    class Meta:
        ordering = ['timestamp']
        db_table = 'activity_messages'
        indexes = [
            models.Index(fields=['timestamp']),
            models.Index(fields=['activity']),
            models.Index(fields=['sender']),
        ]


class MarketplaceItem(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'marketplace_items'


class MarketplaceMessage(models.Model):
    item = models.ForeignKey(
        MarketplaceItem,
        on_delete=models.CASCADE,
        related_name='messages'
    )
    sender = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        related_name='marketplace_sent_messages'
    )
    receiver = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        related_name='marketplace_received_messages'
    )
    content = models.TextField(blank=True)
    duration = models.FloatField(null=True, blank=True, help_text="Voice message duration in seconds")
    file = models.FileField(upload_to='chat_files/marketplace/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    file_type = models.CharField(max_length=20, choices=[
        ('document', 'Document'),
        ('voice', 'Voice'),
        ('image','Image'),
        ('video','Video')
    ], null=True, blank=True )
    is_read = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        if self.file and self.file_type == 'voice':
            try:
                # Optional safety check: only proceed if MIME is audio
                mime_type, _ = mimetypes.guess_type(self.file.name)
                if mime_type and mime_type.startswith('audio'):
                    audio = MutagenFile(self.file)
                    self.duration = round(audio.info.length, 2) if audio and audio.info else None
                else:
                    self.duration = None
            except Exception:
                self.duration = None
        super().save(*args, **kwargs)

    class Meta:
        ordering = ['timestamp']
        db_table = 'marketplace_messages'
        indexes = [
            models.Index(fields=['timestamp']),
            models.Index(fields=['item']),
            models.Index(fields=['sender']),
            models.Index(fields=['receiver']),
        ]


class Community(models.Model):
    # Basic Fields
    name = models.CharField(max_length=255)  # Display name for both mobile and CMS
    official_title = models.CharField(max_length=255, blank=True)  # Optional for CMS table

    description = models.TextField(
        blank=True,
        validators=[MaxLengthValidator(300)]
    )

    sport = models.CharField(max_length=50)  # e.g., Padel, Yoga
    level = models.CharField(max_length=50)  # Beginner / Intermediate / Advanced

    skill_level = models.IntegerField(
        null=True, blank=True,
        validators=[MinValueValidator(0), MaxValueValidator(10)]
    )

    visibility = models.CharField(
        max_length=10,
        choices=[
            ('public', 'Public'),
            ('private', 'Private'),
            ('hidden', 'Hidden')
        ],
        default='public'
    )

    requires_approval = models.BooleanField(default=False)

    cover_image = models.ImageField(
        upload_to='community_covers/',
        null=True,
        blank=True
    )

    # Status for Club Portal (Active/Inactive/Archived)
    status = models.CharField(
        max_length=10,
        choices=[
            ('active', 'Active'),
            ('inactive', 'Inactive'),
            ('archived', 'Archived')
        ],
        default='active'
    )

    last_activity_at = models.DateTimeField(null=True, blank=True)

    # Optional fields
    topic = models.CharField(max_length=100, blank=True)
    location = models.CharField(max_length=255, blank=True)

    # Relations
    club = models.ForeignKey(
        Clubs,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column='club_id',
        to_field='id'
    )

    created_by = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        related_name='communities_created',
        db_column='created_by',
        to_field='id'
    )

    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'communities'
        ordering = ['-created_at']

    def __str__(self):
        return self.name



class CommunityMembership(models.Model):
    community = models.ForeignKey(
        Community,
        on_delete=models.CASCADE,
        related_name='memberships',
        db_column='community_id',
        to_field='id'
    )
    user = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        db_column='user_id',
        to_field='id'
    )
    is_admin = models.BooleanField(default=False)
    is_approved = models.BooleanField(default=True)
    joined_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'community_memberships'
        unique_together = ('community', 'user')


class CommunityMessage(models.Model):
    community = models.ForeignKey(
        Community,
        on_delete=models.CASCADE,
        related_name='messages',
        db_column='community_id',
        to_field='id'
    )
    sender = models.ForeignKey(
        Users,
        on_delete=models.CASCADE,
        db_column='sender_id',
        to_field='id'
    )
    content = models.TextField(blank=True)
    duration = models.FloatField(null=True, blank=True, help_text="Voice message duration in seconds")
    file = models.FileField(upload_to='chat_files/community/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    file_type = models.CharField(max_length=20, choices=[
        ('document', 'Document'),
        ('voice', 'Voice'),
        ('image','Image'),
        ('video','Video')
    ], null=True, blank=True )

    def save(self, *args, **kwargs):
        if self.file and self.file_type == 'voice':
            try:
                # Optional safety check: only proceed if MIME is audio
                mime_type, _ = mimetypes.guess_type(self.file.name)
                if mime_type and mime_type.startswith('audio'):
                    audio = MutagenFile(self.file)
                    self.duration = round(audio.info.length, 2) if audio and audio.info else None
                else:
                    self.duration = None
            except Exception:
                self.duration = None
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'community_messages'
        ordering = ['timestamp']
        indexes = [
            models.Index(fields=['timestamp']),
            models.Index(fields=['community']),
            models.Index(fields=['sender']),
        ]


class CommunityFavorite(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    community = models.ForeignKey(Community, on_delete=models.CASCADE)
    favorited_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('user', 'community')
        db_table = 'community_favorites'


class UserFollower(models.Model):
    follower = models.ForeignKey(Users, related_name='following', on_delete=models.CASCADE)
    following = models.ForeignKey(Users, related_name='followers', on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('follower', 'following')


class CommunityPost(models.Model):
    community = models.ForeignKey(
        Community, on_delete=models.CASCADE, related_name='posts'
    )
    author = models.ForeignKey(
        Users, on_delete=models.CASCADE
    )
    content = models.TextField()
    image = models.ImageField(
        upload_to='community_posts/', null=True, blank=True
    )
    video = models.FileField(
        upload_to='community_posts/videos/', null=True, blank=True
    )
    file = models.FileField(upload_to='community_documents/', null=True, blank=True)
    category = models.CharField(max_length=100, blank=True)
    tags = models.CharField(max_length=255, blank=True) 
    is_private = models.BooleanField(default=False)
    location = models.CharField(max_length=255, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    shared_from = models.ForeignKey('self', null=True, blank=True, on_delete=models.SET_NULL, related_name='shared_copies')

    class Meta:
        ordering = ['-created_at']
        db_table = 'community_posts'
        indexes = [
            models.Index(fields=['community']),
            models.Index(fields=['author']),
            models.Index(fields=['created_at']),
            models.Index(fields=['category']),
            models.Index(fields=['is_private']),
        ]

    def __str__(self):
        return f"{self.author.user_name}'s post in {self.community.name}"


class PostLike(models.Model):
    post = models.ForeignKey(CommunityPost, on_delete=models.CASCADE, related_name='likes')
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    liked_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('post', 'user')
        db_table = 'post_likes'
        indexes = [
            models.Index(fields=['post']),
            models.Index(fields=['user']),
        ]

class PostComment(models.Model):
    post = models.ForeignKey(
        CommunityPost,
        on_delete=models.CASCADE,
        related_name='comments'
    )
    user = models.ForeignKey(
        Users,
        on_delete=models.CASCADE
    )
    content = models.TextField()
    parent = models.ForeignKey(
        'self',
        null=True,
        blank=True,
        related_name='replies',
        on_delete=models.CASCADE
    )
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']
        db_table = 'post_comments'
        indexes = [
            models.Index(fields=['post']),
            models.Index(fields=['user']),
            models.Index(fields=['created_at']),
        ]

    def __str__(self):
        return f"{self.user.user_name} on post {self.post.id}"


class CommunityReport(models.Model):
    community = models.ForeignKey(Community, on_delete=models.CASCADE, related_name='reports')
    reported_by = models.ForeignKey(Users, on_delete=models.CASCADE)
    reason = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'community_reports'
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['community']),
            models.Index(fields=['reported_by']),
        ]

    def __str__(self):
        return f"Report by {self.reported_by.user_name} on {self.community.name}"

class CustomToken(models.Model):
    key = models.CharField(max_length=40, primary_key=True)
    user = models.OneToOneField(Users, related_name='auth_token', on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.key


class Notification(models.Model):
    NOTIFICATION_TYPES = [
        ('like', 'Like'),
        ('comment', 'Comment'),
        ('message', 'Message'),
    ]

    recipient = models.ForeignKey(Users, on_delete=models.CASCADE, related_name='notifications', db_index=True)
    sender = models.ForeignKey(Users, on_delete=models.CASCADE, related_name='sent_notifications')
    notification_type = models.CharField(max_length=20, choices=NOTIFICATION_TYPES, db_index=True)
    post = models.ForeignKey(CommunityPost, null=True, blank=True, on_delete=models.CASCADE)
    comment = models.ForeignKey(PostComment, null=True, blank=True, on_delete=models.CASCADE)
    message = models.ForeignKey(Message, null=True, blank=True, on_delete=models.CASCADE)
    is_read = models.BooleanField(default=False, db_index=True)
    created_at = models.DateTimeField(auto_now_add=True, db_index=True)

    class Meta:
        indexes = [
            models.Index(fields=["recipient", "is_read"]),
            models.Index(fields=["recipient", "created_at"]),
        ]


class CommentLike(models.Model):
    comment = models.ForeignKey(PostComment, on_delete=models.CASCADE, related_name='likes')
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    liked_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('comment', 'user')
        db_table = 'comment_likes'
