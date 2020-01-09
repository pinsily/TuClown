from django.db import models
from django.conf import settings

from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType


class Comment(models.Model):

    # 使用 django 的 ContentType 与 GenericForeignKey 关联评论类型(article)和评论id
    # ContentType： https://juejin.im/entry/581da04f128fe1005afdf618
    content_type = models.ForeignKey(ContentType, on_delete=models.DO_NOTHING)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    # 评论内容
    text = models.TextField(verbose_name='评论内容')

    user_name = models.CharField('评论者名字', max_length=100)
    user_email = models.EmailField(
        max_length=50, blank=True, null=True, verbose_name='邮箱地址', help_text='邮箱地址，用于发送回复')

    created_time = models.DateTimeField('评论发表时间', auto_now_add=True)
    modified_time = models.DateTimeField('修改时间', auto_now=True)

    # 根评论，每个回复都只有一个
    # 根评论的根评论默认为空
    root = models.ForeignKey("self", related_name='root_comment',
                             null=True, on_delete=models.DO_NOTHING, verbose_name=u"根回复")

    # 父级评论，每个回复只有一个
    # 根评论的父级评论默认为空
    parent = models.ForeignKey('self', related_name="parent_comment",
                               null=True, on_delete=models.DO_NOTHING, verbose_name=u'父级评论')

    # 根评论没有回复谁，为空
    reply_name = models.CharField(
        max_length=100, null=True, blank=True, verbose_name=u'回复谁')

    def __str__(self):
        return self.text[:20]

    class Meta:
        db_table = "comment"
        ordering = ['created_time']
