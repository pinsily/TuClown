from __future__ import absolute_import
import xadmin
from .models import UserSettings, Log
from xadmin import views

from django.utils.translation import ugettext_lazy as _

from blog import models as blog_models
from comment import models as comment_models
from Navigation import models as nav_models


class UserSettingsAdmin(object):
    model_icon = 'fa fa-cog'
    hidden_menu = True


xadmin.site.register(UserSettings, UserSettingsAdmin)


class LogAdmin(object):
    def link(self, instance):
        if instance.content_type and instance.object_id and instance.action_flag != 'delete':
            admin_url = self.get_admin_url(
                '%s_%s_change' % (instance.content_type.app_label, instance.content_type.model),
                instance.object_id)
            return "<a href='%s'>%s</a>" % (admin_url, _('Admin Object'))
        else:
            return ''

    link.short_description = ""
    link.allow_tags = True
    link.is_column = False

    list_display = ('action_time', 'user', 'ip_addr', '__str__', 'link')
    list_filter = ['user', 'action_time']
    search_fields = ['ip_addr', 'message']
    model_icon = 'fa fa-cog'


xadmin.site.register(Log, LogAdmin)


class BaseSetting(object):
    # 开启主题功能
    enable_themes = True
    # 支持切换主题
    use_bootswatch = True


xadmin.site.register(views.BaseAdminView, BaseSetting)


class GlobalSettings(object):
    site_title = "pinsily's blog"
    site_footer = "Copyright @2019-2020 pinsily All Rights Reserved"
    # 菜单可折叠
    # menu_style = "accordion"

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
            {'title': 'Ip Log', 'menus': (
                {'title': 'ip', 'url': self.get_model_url(
                    blog_models.IPLogs, 'changelist')},
            )},
        )

    # 可以重写此方法，使右侧菜单栏只有上面添加的项
    def get_nav_menu(self):
        # 直接返回新增的菜单栏，源码中还有很大一部分的合并功能
        site_menu = list(self.get_site_menu() or [])
        return site_menu


xadmin.site.register(views.CommAdminView, GlobalSettings)
