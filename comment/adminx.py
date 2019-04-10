import xadmin

from .models import Comment


class CommentAdmin(object):
    ordering = ['-created_time']

    # 要列出的字段
    list_display = ['user_name', 'user_email', 'created_time', 'text']
    # 可以搜索的字段
    search_fields = ('user_name', 'user_email', 'created_time',)
    # 右侧过滤条件
    list_filter = ('user_name', 'user_email', 'created_time',)
    # icon
    model_icon = "fa fa-commenting-o"
    # 下拉框搜索，当有外键指向他时会以ajax方式加载，数据量过大时很有用
    relfield_style = 'fk-ajax'
    # 后台可选刷新频率
    refresh_times = [3, 5]


xadmin.site.register(Comment, CommentAdmin)
