from django.db.models import Sum
from django.shortcuts import render
from django.views.generic import ListView, DetailView
from django.contrib.contenttypes.models import ContentType

from .models import Article, Category, Tag, IPLogs
from comment.models import Comment

from blog.templatetags.paginate_tags import getpages

import markdown


def index(request):
    """博客首页

    :param request:
    :return: kwargs
    """
    article_list = Article.objects.filter(status="p").order_by('-created_time')
    pages, article_list = getpages(request, article_list)

    if 'HTTP_X_FORWARDED_FOR' in request.META:
        ip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']

    ips = [ip.ip for ip in IPLogs.objects.all()]

    if ip not in ips:
        IPLogs.objects.create(ip=ip)
    else:
        ipInstant = IPLogs.objects.get(ip=ip)
        ipInstant.visit_times += 1
        ipInstant.save()

    kwargs = dict()
    kwargs['pages'] = pages
    kwargs['article_list'] = article_list
    kwargs['favs'] = Article.objects.aggregate(favs=Sum("likes"))["favs"]
    kwargs['views'] = IPLogs.objects.aggregate(views=Sum("visit_times"))["views"]
    kwargs['blogs'] = Article.objects.count()
    kwargs['visiters'] = IPLogs.objects.count()
    return render(request, 'blog/index.html', kwargs)


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
                      'markdown.extensions.fenced_code',
                      'markdown.extensions.codehilite',
                      'markdown.extensions.tables',
                      'markdown.extensions.toc'
                      ]

        obj.body = markdown.markdown(obj.body, extensions=extensions, safe_mode=True, enable_attributes=False)
        # print(obj.body)
        return obj

    # 为模板添加分类和标签上下文变量
    def get_context_data(self, **kwargs):
        article = self.get_object()

        article_content_type = ContentType.objects.get_for_model(article)

        kwargs['category_list'] = Category.objects.all().order_by('name')
        kwargs['tag_list'] = Tag.objects.all().order_by('name')
        kwargs['comment_list'] = Comment.objects.filter(
            content_type=article_content_type, object_id=article.pk, parent=None).order_by("-created_time")
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
