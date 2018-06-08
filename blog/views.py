from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.views.generic import ListView, DetailView
from django.shortcuts import get_list_or_404, redirect, get_object_or_404
from django.urls import reverse
from django.contrib import auth
from django.utils.six import BytesIO

# Create your views here.

from .models import Article, Category, Tag, Comment, Link, LinkCategory


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
        # kwargs['tag_list'] = Tag.objects.all().order_by("name")
        # kwargs['tag_list'] = Tag.objects.all().order_by("name")
        # print(self)
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
        kwargs['comment_list'] = self.object.comment_set.all()

        kwargs['category_list'] = Category.objects.all().order_by('name')
        kwargs['tag_list'] = Tag.objects.all().order_by('name')
        kwargs['detail'] = True
        kwargs['stick_articles'] = Article.objects.filter(topped=True)
        return super(ArticleDetailView, self).get_context_data(**kwargs)


# 评论函数
def comment(request, article_id):
    article = Article.objects.get(pk=article_id)

    if request.method == 'POST':
        user_name = request.POST['nick']
        user_email = request.POST['email']
        content = request.POST['comment-body']

        Comment.objects.create(user_name=user_name,
                               user_email=user_email, body=content, article=article)

        return HttpResponseRedirect(reverse('blog:detail', args=(article_id,)))

    return HttpResponseRedirect(reverse('blog:detail', args=(article_id,)))


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
        # return HttpResponse(image_stream, content_type="image/png")
        # return HttpResponse(image_stream)
        #response = HttpResponse(image_stream, content_type="image/png")
        # return response
