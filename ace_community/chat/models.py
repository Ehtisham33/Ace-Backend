# from django.db import models
# from laravel_models.models import users, CourtBookings, Clubs


# class Message(models.Model):
#     sender = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         related_name='sent_messages',
#         db_column='sender_id'
#     )
#     receiver = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         related_name='received_messages',
#         db_column='receiver_id'
#     )
#     content = models.TextField(blank=True)
#     file = models.FileField(upload_to='chat_files/', null=True, blank=True)
#     timestamp = models.DateTimeField(auto_now_add=True)
#     is_read = models.BooleanField(default=False)

#     class Meta:
#         ordering = ['timestamp']
#         db_table = 'messages'
#         indexes = [
#             models.Index(fields=['timestamp']),
#             models.Index(fields=['sender']),
#             models.Index(fields=['receiver']),
#         ]


# class ActivityMessage(models.Model):
#     activity = models.ForeignKey(
#         CourtBookings,
#         on_delete=models.CASCADE,
#         db_column='activity_id',
#         related_name='activity_messages'
#     )
#     sender = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         related_name='activity_sent_messages'
#     )
#     content = models.TextField(blank=True)
#     file = models.FileField(upload_to='chat_files/activity/', null=True, blank=True)
#     timestamp = models.DateTimeField(auto_now_add=True)
#     is_read = models.BooleanField(default=False)

#     class Meta:
#         ordering = ['timestamp']
#         db_table = 'activity_messages'
#         indexes = [
#             models.Index(fields=['timestamp']),
#             models.Index(fields=['activity']),
#             models.Index(fields=['sender']),
#         ]


# class MarketplaceItem(models.Model):
#     title = models.CharField(max_length=255)
#     description = models.TextField()
#     price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
#     image = models.CharField(max_length=255, blank=True, null=True)
#     created_at = models.DateTimeField(auto_now_add=True)

#     class Meta:
#         db_table = 'marketplace_items'


# class MarketplaceMessage(models.Model):
#     item = models.ForeignKey(
#         MarketplaceItem,
#         on_delete=models.CASCADE,
#         related_name='messages'
#     )
#     sender = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         related_name='marketplace_sent_messages'
#     )
#     receiver = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         related_name='marketplace_received_messages'
#     )
#     content = models.TextField(blank=True)
#     file = models.FileField(upload_to='chat_files/marketplace/', null=True, blank=True)
#     timestamp = models.DateTimeField(auto_now_add=True)
#     is_read = models.BooleanField(default=False)

#     class Meta:
#         ordering = ['timestamp']
#         db_table = 'marketplace_messages'
#         indexes = [
#             models.Index(fields=['timestamp']),
#             models.Index(fields=['item']),
#             models.Index(fields=['sender']),
#             models.Index(fields=['receiver']),
#         ]


# class Community(models.Model):
#     name = models.CharField(max_length=255)
#     description = models.TextField(blank=True)
#     club = models.ForeignKey(
#         Clubs,
#         on_delete=models.CASCADE,
#         db_column='club_id',
#         to_field='id'
#     )
#     sport = models.CharField(max_length=50)
#     level = models.CharField(max_length=50)
#     is_private = models.BooleanField(default=False)
#     location = models.CharField(max_length=255, blank=True)
#     topic = models.CharField(max_length=100, blank=True)
#     requires_approval = models.BooleanField(default=False)
#     cover_image = models.ImageField(upload_to='community_covers/', null=True, blank=True)
#     created_by = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         related_name='communities_created',
#         db_column='created_by',
#         to_field='id'
#     )
#     created_at = models.DateTimeField(auto_now_add=True)

#     class Meta:
#         db_table = 'communities'
#         ordering = ['-created_at']


# class CommunityMembership(models.Model):
#     community = models.ForeignKey(
#         Community,
#         on_delete=models.CASCADE,
#         related_name='memberships',
#         db_column='community_id',
#         to_field='id'
#     )
#     user = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         db_column='user_id',
#         to_field='id'
#     )
#     is_admin = models.BooleanField(default=False)
#     is_approved = models.BooleanField(default=True)
#     joined_at = models.DateTimeField(auto_now_add=True)

#     class Meta:
#         db_table = 'community_memberships'
#         unique_together = ('community', 'user')


# class CommunityMessage(models.Model):
#     community = models.ForeignKey(
#         Community,
#         on_delete=models.CASCADE,
#         related_name='messages',
#         db_column='community_id',
#         to_field='id'
#     )
#     sender = models.ForeignKey(
#         users,
#         on_delete=models.CASCADE,
#         db_column='sender_id',
#         to_field='id'
#     )
#     content = models.TextField(blank=True)
#     file = models.FileField(upload_to='chat_files/community/', null=True, blank=True)
#     timestamp = models.DateTimeField(auto_now_add=True)
#     is_read = models.BooleanField(default=False)

#     class Meta:
#         db_table = 'community_messages'
#         ordering = ['timestamp']
#         indexes = [
#             models.Index(fields=['timestamp']),
#             models.Index(fields=['community']),
#             models.Index(fields=['sender']),
#         ]
