from . import models
import xadmin


class BookmarkAdmin(object):
    list_display = ['created_time', 'name', 'url', 'image', 'cate', 'desc']
    ordering = ['-created_time']


class CategoryAdmin(object):
    list_display = ['created_time', 'name', 'english_name']
    inlines = [BookmarkAdmin]
    ordering = ['-created_time']


class SettingAdmin(object):
    list_display = ['name', 'url', 'image', 'desc', 'useful']
    ordering = ['name']


xadmin.site.register(models.Bookmark, BookmarkAdmin)
xadmin.site.register(models.Category, CategoryAdmin)
xadmin.site.register(models.NavSetting, SettingAdmin)
