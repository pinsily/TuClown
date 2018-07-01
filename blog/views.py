from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.views.generic import ListView, DetailView
from django.shortcuts import get_list_or_404, redirect, get_object_or_404
from django.urls import reverse
from django.contrib import auth
from django.utils.six import BytesIO
from django.contrib.contenttypes.models import ContentType

# Create your views here.

from .models import Article, Category, Tag, Link, LinkCategory
from comment.models import Comment

import markdown
import re
import qrcode
import base64


# 首页函数
class IndexView(ListView):
    template_name = "blog/index.html"

    # 获取数据表数据
    context_object_name = "article_list"

    def get_queryset(self):
        """过滤数据，并转换markdown为html
        """
        article_list = Article.objects.filter(
            status="p").order_by('-created_time')
        # print(self.request.META['REMOTE_ADDR'])
        return article_list

    # 为模板添加分类和标签上下文变量
    def get_context_data(self, **kwargs):
        kwargs['category_list'] = Category.objects.all()
        kwargs['stick_articles'] = Article.objects.filter(topped=True)
        kwargs['current_page'] = 'home'
        kwargs['home'] = True
        kwargs['tag_list'] = Tag.objects.all()
        kwargs['recent_articles'] = Article.objects.all(
        ).order_by('-created_time')[:4]
        return super(IndexView, self).get_context_data(**kwargs)


# 文章详情函数
class ArticleDetailView(DetailView):
    """显示文章详情
    """

    model = Article
    template_name = 'blog/detail.html'
    context_object_name = 'article'

    # 接受来自 url 中的参数
    pk_url_kwarg = 'article_id'

    # 从数据库中获取相应ID文章、
    def get_object(self, queryset=None):
        obj = super(ArticleDetailView, self).get_object()

        # views 增加阅读量
        obj.views += 1
        obj.save()

        # markdown to html
        extensions = ['markdown.extensions.extra',
                      'markdown.extensions.codehilite',
                      'markdown.extensions.tables',
                      'markdown.extensions.toc'
                      ]

        obj.body = markdown.markdown(obj.body, extensions=extensions)
        # print(obj.body)
        return obj

    # 为模板添加分类和标签上下文变量
    def get_context_data(self, **kwargs):

        article = self.get_object()

        article_content_type = ContentType.objects.get_for_model(article)

        kwargs['category_list'] = Category.objects.all().order_by('name')
        kwargs['tag_list'] = Tag.objects.all().order_by('name')
        kwargs['comment_list'] = Comment.objects.filter(
            content_type=article_content_type, object_id=article.pk, parent=None)
        kwargs['detail'] = True
        return super(ArticleDetailView, self).get_context_data(**kwargs)


# 归档函数
class ArchiveView(ListView):
    model = Article
    context_object_name = 'article_list'
    template_name = 'blog/archive.html'

    def get_queryset(self):
        """过滤数据，并转换markdown为html
        """
        article_list = Article.objects.filter(
            status="p").order_by('-created_time')
        return article_list

    # 为模板添加分类和标签上下文变量
    def get_context_data(self, **kwargs):
        kwargs['stick_articles'] = Article.objects.filter(topped=True)
        kwargs['current_page'] = 'archive'
        kwargs['category_list'] = Category.objects.all().order_by('name')
        kwargs['tag_list'] = Tag.objects.all().order_by('name')
        kwargs['archive'] = True
        return super(ArchiveView, self).get_context_data(**kwargs)


# 标签函数
class TagView(ListView):
    model = Tag
    context_object_name = 'tag_list'
    template_name = 'blog/tag.html'

    # 为模板添加分类和标签上下文变量
    def get_context_data(self, **kwargs):
        kwargs['stick_articles'] = Article.objects.filter(topped=True)
        kwargs['current_page'] = 'tag'
        kwargs['category_list'] = Category.objects.all().order_by('name')
        kwargs['tag_list'] = Tag.objects.all().order_by('name')
        kwargs['tags'] = True
        return super(TagView, self).get_context_data(**kwargs)


# 分类函数
class CategoryView(ListView):
    model = Category
    context_object_name = 'category_list'
    template_name = 'blog/category.html'

    # 为模板添加分类和标签上下文变量
    def get_context_data(self, **kwargs):
        kwargs['stick_articles'] = Article.objects.filter(topped=True)
        kwargs['current_page'] = 'category'
        kwargs['category_list'] = Category.objects.all().order_by('name')
        kwargs['tag_list'] = Tag.objects.all().order_by('name')
        kwargs['category'] = True
        return super(CategoryView, self).get_context_data(**kwargs)


# 分类函数
class NavigationView(ListView):
    model = LinkCategory
    context_object_name = 'linkcategory_list'
    template_name = 'blog/navigation.html'

    # 为模板添加分类和标签上下文变量
    def get_context_data(self, **kwargs):
        kwargs['navigation'] = True
        link_qr_dict = {}
        link_list = Link.objects.all()
        for link in link_list:
            link_qr_dict[link.id] = self.generate_qrcode(link.url)
        kwargs['link_qr_dict'] = link_qr_dict
        return super(NavigationView, self).get_context_data(**kwargs)

    def generate_qrcode(self, data):
        img = qrcode.make(data)

        buf = BytesIO()
        img.save(buf)
        image_stream = buf.getvalue()
        image_stream = base64.b64encode(image_stream)

        return str(image_stream)[2:-1]
