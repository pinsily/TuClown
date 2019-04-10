from . import models
import xadmin


class BookmarkAdmin(object):
    list_display = ['created_time', 'name', 'url', 'image', 'cate', 'desc']
    ordering = ['cate', '-created_time']

    # 可以搜索的字段
    search_fields = ('created_time', 'name', 'url', 'cate',)
    # 列出可以编辑的字段
    list_editable = ('name', 'url', 'cate')
    # 右侧过滤条件
    list_filter = ('created_time', 'cate', 'name',)
    # icon
    model_icon = "fa fa-bookmark-o"
    # 下拉框搜索，当有外键指向他时会以ajax方式加载，数据量过大时很有用
    relfield_style = 'fk-ajax'
    # 后台可选刷新频率
    refresh_times = [3, 5]


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
