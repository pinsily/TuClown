import xadmin

from .models import Comment


class CommentAdmin(object):
    list_display = ['user_name', 'user_email', 'created_time', 'text']
    ordering = ['-created_time']


xadmin.site.register(Comment, CommentAdmin)
