# -*- coding: utf-8 -*-
from django.db import models
from django.urls import reverse


class Article(models.Model):
    STATUS_CHOICES = (
        ('d', 'draft'),
        ('p', 'publish'),
    )

    title = models.CharField(max_length=100, verbose_name=u'标题')
    body = models.TextField(verbose_name=u'正文')
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

    def get_absolute_url(self):
        return reverse('blog:detail', args=[str(self.id)])

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


class Link(models.Model):
    name = models.CharField(max_length=200, verbose_name=u'链接名')
    url = models.URLField(
        blank=True, default="http://blog.pinsily.site", verbose_name=u'链接地址')
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


# 记录访问IP
class IPLogs(models.Model):
    ip = models.GenericIPAddressField()
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    visit_times = models.IntegerField(default=1)
    latest_time = models.DateTimeField('最近访问时间', auto_now=True)

    class Meta:
        db_table = 'iplogs'
        ordering = ['created_time']

    def __str__(self):
        return self.ip


