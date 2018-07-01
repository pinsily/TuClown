import xadmin

from .models import Comment


class CommentAdmin(object):
    pass


xadmin.site.register(Comment, CommentAdmin)
