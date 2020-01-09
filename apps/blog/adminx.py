# -*- coding: utf-8 -*-

from .models import Article, Category, Tag, IPLogs
import xadmin
from xadmin import views
from blog import models as blog_models
from comment import models as comment_models
from Navigation import models as nav_models


class ArticleAdmin(object):
    # 要列出的字段
    list_display = ['title', 'created_time', 'status', 'category', 'tags']
    # 可以搜索的字段
    search_fields = ('title',)
    # 列出可以编辑的字段
    list_editable = ('status', 'topped',)
    # 右侧过滤条件
    list_filter = ('created_time',)
    # icon
    model_icon = "fa fa-book"
    # 下拉框搜索，当有外键指向他时会以ajax方式加载，数据量过大时很有用
    relfield_style = 'fk-ajax'
    ordering = ['id']
    # 后台可选刷新频率
    refresh_times = [3, 5]


class CategoryAdmin(object):
    # 要列出的字段
    list_display = ['name', 'created_time']
    # 可以搜索的字段
    search_fields = ('name',)
    # 右侧过滤条件
    list_filter = ('created_time',)
    # icon
    model_icon = "fa fa-bookmark-o"
    # 下拉框搜索，当有外键指向他时会以ajax方式加载，数据量过大时很有用
    relfield_style = 'fk-ajax'
    ordering = ['id']
    # 后台可选刷新频率
    refresh_times = [3, 5]


class TagAdmin(object):
    # 要列出的字段
    list_display = ['name', 'created_time']
    # 可以搜索的字段
    search_fields = ('name',)
    # 右侧过滤条件
    list_filter = ('created_time',)
    # icon
    model_icon = "fa fa-map"
    # 下拉框搜索，当有外键指向他时会以ajax方式加载，数据量过大时很有用
    relfield_style = 'fk-ajax'
    ordering = ['id']
    # 后台可选刷新频率
    refresh_times = [3, 5]


# class LinkAdmin(object):
#     list_display = ['name', 'url']
#
#
# class LinkCategoryAdmin(object):
#     list_display = ['name']


class IpLogAdmin(object):
    list_display = ['ip', 'created_time', 'visit_times', "latest_time"]
    ordering = ['-created_time']
    # 可以搜索的字段
    search_fields = ('ip',)
    # 右侧过滤条件
    list_filter = ('created_time',)
    # icon
    model_icon = "fa fa-file-powerpoint-o"
    # 下拉框搜索，当有外键指向他时会以ajax方式加载，数据量过大时很有用
    relfield_style = 'fk-ajax'
    # 后台可选刷新频率
    refresh_times = [3, 5]


xadmin.site.register(Article, ArticleAdmin)
xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Tag, TagAdmin)
xadmin.site.register(IPLogs, IpLogAdmin)


class BaseSetting(object):
    # 开启主题功能
    enable_themes = True
    # 支持切换主题
    use_bootswatch = True


xadmin.site.register(views.BaseAdminView, BaseSetting)


class GlobalSettings(object):
    site_title = "pinsily's blog"
    site_footer = "Copyright @2017-2019 pinsily All Rights Reserved"
    # 菜单可折叠
    menu_style = "accordion"

    # 自定义新增菜单栏
    def get_site_menu(self):
        return (
            {'title': 'BLOG', 'menus': (
                {'title': 'Articles', 'url': self.get_model_url(
                    blog_models.Article, 'changelist')
                 },
                {'title': 'Category', 'url': self.get_model_url(
                    blog_models.Category, 'changelist')
                 },
                {'title': 'Tag', 'url': self.get_model_url(
                    blog_models.Tag, 'changelist')
                 },
                # {'title': 'Link', 'url': self.get_model_url(
                #     blog_models.Link, 'changelist')
                #  },
                # {'title': 'Link category', 'url': self.get_model_url(
                #     blog_models.LinkCategory, 'changelist')
                #  },
            )},
            {'title': 'Comment', 'menus': (
                {'title': 'comment', 'url': self.get_model_url(
                    comment_models.Comment, 'changelist')},
            )},
            {'title': 'Navigation', 'menus': (
                {'title': 'Bookmark', 'url': self.get_model_url(
                    nav_models.Bookmark, 'changelist')},
                {'title': 'BookCategory', 'url': self.get_model_url(
                    nav_models.Category, 'changelist')},
                {'title': 'Setting', 'url': self.get_model_url(
                    nav_models.NavSetting, 'changelist')},
            )},


        )

    # 可以重写此方法，使右侧菜单栏只有上面添加的项
    def get_nav_menu(self):
        # 直接返回新增的菜单栏，源码中还有很大一部分的合并功能
        site_menu = list(self.get_site_menu() or [])
        return site_menu


xadmin.site.register(views.CommAdminView, GlobalSettings)

