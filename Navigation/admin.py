from django.contrib import admin
from . import models


# Register your models here.

class BookmarkAdmin(admin.ModelAdmin):
    pass


class CategoryAdmin(admin.ModelAdmin):
    pass


admin.site.register(models.Bookmark, BookmarkAdmin)
admin.site.register(models.Category, CategoryAdmin)
