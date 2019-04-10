# -*- coding: utf-8 -*-

from .models import Article, Category, Tag, IPLogs

import xadmin


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
