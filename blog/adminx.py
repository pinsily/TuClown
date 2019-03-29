# -*- coding: utf-8 -*-

from .models import Article, Category, Tag, Link, LinkCategory, IPLogs

import xadmin

'''
class GlobalSetting(object):
    site_title = "Pinsily.blog"
    site_footer = 'pinsily blog'
    # menu_style = 'accordion'

    def get_site_menu(self):
        return (
            {'title': 'Blog', 'perm': self.get_model_perm(Article, 'change'), 'menus': (
                {'title': 'Article', 'url': self.get_model_url(
                    Article, 'changelist')},
                {'title': 'Category', 'url': self.get_model_url(
                    Category, 'changelist')},
                {'title': 'Comment', 'url': self.get_model_url(
                    Comment, 'changelist')},
                {'title': 'Tag', 'url': self.get_model_url(Tag, 'changelist')},
            )},
        )

    def get_nav_menu(self):
        site_menu = list(self.get_site_menu() or [])
        return site_menu


xadmin.site.register(xadmin.views.CommAdminView, GlobalSetting)
'''


class ArticleAdmin(object):
    list_display = ['title', 'created_time', 'status', 'category', 'tags']


class CategoryAdmin(object):
    list_display = ['name', 'created_time']


class TagAdmin(object):
    list_display = ['name', 'created_time']


# class LinkAdmin(object):
#     list_display = ['name', 'url']
#
#
# class LinkCategoryAdmin(object):
#     list_display = ['name']


class IpLogAdmin(object):
    list_display = ['ip', 'created_time', 'visit_times', "latest_time"]
    ordering = ['-created_time']


xadmin.site.register(Article)
xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Tag, TagAdmin)
# xadmin.site.register(Link, LinkAdmin)
# xadmin.site.register(LinkCategory, LinkCategoryAdmin)
xadmin.site.register(IPLogs, IpLogAdmin)
