from django.contrib import admin
from .models import (
    Message,
    ActivityMessage,
    MarketplaceItem,
    MarketplaceMessage
)


@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'sender', 'receiver', 'content', 'timestamp')
    search_fields = ('sender__user_name', 'receiver__user_name', 'content')
    list_filter = ('timestamp',)


@admin.register(ActivityMessage)
class ActivityMessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'activity', 'sender', 'content', 'timestamp')
    search_fields = ('activity__id', 'sender__user_name', 'content')
    list_filter = ('timestamp',)


@admin.register(MarketplaceItem)
class MarketplaceItemAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'price', 'created_at')
    search_fields = ('title', 'description')
    list_filter = ('created_at',)


@admin.register(MarketplaceMessage)
class MarketplaceMessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'item', 'sender', 'receiver', 'content', 'timestamp')
    search_fields = ('sender__user_name', 'receiver__user_name', 'content', 'item__title')
    list_filter = ('timestamp',)
