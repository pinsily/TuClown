from django.db import models

# Create your models here.

from django.db import models
#from DjangoUeditor.models import UEditorField
from ckeditor_uploader.fields import RichTextUploadingField


class Article(models.Model):
    STATUS_CHOICES = (
        ('d', 'draft'),
        ('p', 'publish'),
    )

    title = models.CharField(max_length=100, verbose_name=u'标题')
    body = models.TextField(verbose_name=u'正文')
    # body = RichTextUploadingField()
    # body = UEditorField('内容', height=300, width=1000,
    #                     default=u'', blank=True, imagePath="uploads/images/",
    #                     toolbars='besttome', filePath='uploads/files/')
    # image = models.URLField(
    # blank=True, default="http://owgxfd8jv.bkt.clouddn.com/HollowRock.jpg", verbose_name=u'封面图片')
    #image = models.FileField(upload_to='blog/uploads/')
    image = models.FileField()

    # auto_now_add 创建时间戳，不会被覆盖
    created_time = models.DateTimeField(verbose_name=u'创建时间')
    # auto_now 自动覆盖
    modified_time = models.DateTimeField(auto_now=True, verbose_name=u'修改时间')
    status = models.CharField(
        max_length=1, choices=STATUS_CHOICES, verbose_name=u'文章状态')
    abstract = models.CharField(max_length=54, blank=True, null=True,
                                verbose_name=u'摘要')
    # 阅读量
    views = models.PositiveIntegerField(default=0, verbose_name=u'浏览量')
    # 点赞数
    likes = models.PositiveIntegerField(default=0, verbose_name=u'点赞数')
    # 是否置顶
    topped = models.BooleanField(default=False, verbose_name=u'置顶')
    author = models.CharField(
        max_length=100, default='pinsily', verbose_name=u'作者')
    category = models.ForeignKey(
        'Category', null=True, on_delete=models.SET_NULL, verbose_name=u'分类')
    tags = models.ManyToManyField(
        'Tag', blank=True, verbose_name=u'标签集')

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['-created_time']
        db_table = 'article'


class Category(models.Model):
    """
    储存文章的分类信息
    文章表的外键指向
    """
    name = models.CharField('类名', max_length=20)
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    modified_time = models.DateTimeField('修改时间', auto_now=True)

    class Meta:
        db_table = "category"
        ordering = ['name']

    def __str__(self):
        return self.name


class Tag(models.Model):
    """
    tag(标签云)对应的数据库
    """
    name = models.CharField('标签名', max_length=20)
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    modified_time = models.DateTimeField('修改时间', auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "tag"
        ordering = ['name']


class Comment(models.Model):
    user_name = models.CharField('评论者名字', max_length=100)
    user_email = models.EmailField(
        max_length=50, blank=True, null=True, verbose_name='邮箱地址')
    body = models.TextField('评论内容')
    created_time = models.DateTimeField('评论发表时间', auto_now_add=True)
    article = models.ForeignKey(
        'Article', verbose_name='评论所属文章', on_delete=models.CASCADE)
    pid = models.ForeignKey('self', verbose_name=u'父级评论',
                            on_delete=models.CASCADE)
    user_head = models.ImageField(
        upload_to='head_imgs', default='head_imgs/default.jpg', verbose_name='用户头像')
    user_url = models.URLField(
        max_length=100, blank=True, null=True, verbose_name='个人网页地址')

    def __str__(self):
        return self.body[:20]

    class Meta:
        db_table = "comment"


class Link(models.Model):
    name = models.CharField(max_length=200, verbose_name=u'链接名')
    url = models.URLField(
        blank=True, default="http://blog.pinsily.site", verbose_name=u'链接地址')
    # image = models.URLField(
    # blank=True, null=True, default="http://owgxfd8jv.bkt.clouddn.com/HollowRock.jpg", verbose_name=u'链接图片')
    # qrcode = models.ImageField(
    # upload_to='qrcode', default='head_imgs/default.jpg', verbose_name=u'链接二维码', null=True, blank=True)
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    modified_time = models.DateTimeField('修改时间', auto_now=True)
    category = models.ForeignKey(
        'LinkCategory', on_delete=models.CASCADE, verbose_name=u'链接分类')

    class Meta:
        db_table = "link"
        ordering = ['name']

    def __str__(self):
        return self.name


class LinkCategory(models.Model):
    name = models.CharField('类名', max_length=20)
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    modified_time = models.DateTimeField('修改时间', auto_now=True)

    class Meta:
        db_table = "linkcategory"
        ordering = ['name']

    def __str__(self):
        return self.name


# from mdeditor.fields import MDTextField


# class ExampleModel(models.Model):
#     name = models.CharField(max_length=10)
#     content = MDTextField()
