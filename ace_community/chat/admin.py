from django.contrib import admin
from .models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage,
    Community,
    CommunityMembership,
    CommunityMessage,
)

# -------------------- Messages --------------------

@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'sender', 'receiver', 'content', 'is_read', 'file', 'timestamp')
    search_fields = ('sender__user_name', 'receiver__user_name', 'content')
    list_filter = ('timestamp', 'is_read')
    readonly_fields = ('timestamp',)
    date_hierarchy = 'timestamp'


@admin.register(ActivityMessage)
class ActivityMessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'activity', 'sender', 'content', 'is_read', 'file', 'timestamp')
    search_fields = ('activity__id', 'sender__user_name', 'content')
    list_filter = ('timestamp', 'is_read')
    readonly_fields = ('timestamp',)
    date_hierarchy = 'timestamp'


@admin.register(MarketplaceMessage)
class MarketplaceMessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'item', 'sender', 'receiver', 'content', 'is_read', 'file', 'timestamp')
    search_fields = ('sender__user_name', 'receiver__user_name', 'content', 'item__title')
    list_filter = ('timestamp', 'is_read')
    readonly_fields = ('timestamp',)
    date_hierarchy = 'timestamp'

# -------------------- Marketplace --------------------

@admin.register(MarketplaceItem)
class MarketplaceItemAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'price', 'created_at')
    search_fields = ('title', 'description')
    list_filter = ('created_at',)
    readonly_fields = ('created_at',)
    date_hierarchy = 'created_at'

# -------------------- Communities --------------------

@admin.register(Community)
class CommunityAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'club', 'sport', 'level', 'is_private_display', 'visibility', 'created_by', 'created_at')
    search_fields = ('name', 'sport', 'level', 'created_by__user_name')
    list_filter = ('visibility', 'created_at')
    readonly_fields = ('created_at',)
    date_hierarchy = 'created_at'

    @admin.display(boolean=True, description='Is Private')
    def is_private_display(self, obj):
        return obj.visibility == 'private'

@admin.register(CommunityMembership)
class CommunityMembershipAdmin(admin.ModelAdmin):
    list_display = ('id', 'community', 'user', 'is_admin', 'is_approved', 'joined_at')
    search_fields = ('community__name', 'user__user_name')
    list_filter = ('is_admin', 'is_approved', 'joined_at')
    readonly_fields = ('joined_at',)
    date_hierarchy = 'joined_at'

@admin.register(CommunityMessage)
class CommunityMessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'community', 'sender', 'content', 'is_read', 'file', 'timestamp')
    search_fields = ('community__name', 'sender__user_name', 'content')
    list_filter = ('timestamp', 'is_read')
    readonly_fields = ('timestamp',)
    date_hierarchy = 'timestamp'
