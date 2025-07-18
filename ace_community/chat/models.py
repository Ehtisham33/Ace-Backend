from django.db import models
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
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

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
    file = models.FileField(upload_to='chat_files/activity/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

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
    file = models.FileField(upload_to='chat_files/marketplace/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

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
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    club = models.ForeignKey(
        Clubs,
        on_delete=models.CASCADE,
        db_column='club_id',
        to_field='id'
    )
    sport = models.CharField(max_length=50)
    level = models.CharField(max_length=50)
    is_private = models.BooleanField(default=False)
    location = models.CharField(max_length=255, blank=True)
    topic = models.CharField(max_length=100, blank=True)
    requires_approval = models.BooleanField(default=False)
    cover_image = models.ImageField(upload_to='community_covers/', null=True, blank=True)
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
    file = models.FileField(upload_to='chat_files/community/', null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

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
    post = models.ForeignKey(CommunityPost, on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']
        db_table = 'post_comments'
        indexes = [
            models.Index(fields=['post']),
            models.Index(fields=['user']),
            models.Index(fields=['created_at']),
        ]


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
