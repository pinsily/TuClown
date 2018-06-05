from django.contrib import admin

# Register your models here.
from .models import Article, Category, Comment, Tag, Link, LinkCategory

admin.site.register(Article)
admin.site.register(Category)
admin.site.register(Comment)
admin.site.register(Tag)
admin.site.register(Link)
admin.site.register(LinkCategory)
