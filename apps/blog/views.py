import json

from django.db.models import Sum
from django.shortcuts import render
from django.contrib.contenttypes.models import ContentType
from .models import Article, IPLogs
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

    # if 'HTTP_X_FORWARDED_FOR' in request.META:
    #     ip = request.META['HTTP_X_FORWARDED_FOR']
    # else:
    #     ip = request.META['REMOTE_ADDR']
    #
    # # ips = [ip.ip for ip in IPLogs.objects.all()]
    #
    # try:
    #     ip_instant = IPLogs.objects.get(ip=ip)
    #     ip_instant.visit_times += 1
    #     ip_instant.save()
    # except IPLogs.DoesNotExist:
    #     IPLogs.objects.create(ip=ip)

    kwargs = dict()
    kwargs['pages'] = pages
    kwargs['article_list'] = article_list
    kwargs['favs'] = Article.objects.aggregate(favs=Sum("likes"))["favs"]
    kwargs['views'] = IPLogs.objects.aggregate(views=Sum("visit_times"))["views"]
    kwargs['blogs'] = Article.objects.count()
    kwargs['visiters'] = IPLogs.objects.count()

    return render(request, 'blog/index.html', kwargs)


# 文章详情函数
def detail(request, article_id):
    article = Article.objects.get(pk=article_id)

    article.views += 1
    article.save()

    extensions = [
        'markdown.extensions.extra',
        'markdown.extensions.fenced_code',
        'markdown.extensions.codehilite',
        'markdown.extensions.tables',
        'markdown.extensions.toc'
    ]

    article.body = markdown.markdown(article.body, extensions=extensions, safe_mode=False, enable_attributes=False)

    article_content_type = ContentType.objects.get_for_model(article)

    kwargs = {
        'article': article,
        # 'category_list': Category.objects.all().order_by('name'),
        # 'tag_list': Tag.objects.all().order_by('name'),
        'comment_list': Comment.objects.filter(
            content_type=article_content_type, object_id=article.pk, parent=None).order_by("-created_time"),
        # 'detail': True,
        'views': IPLogs.objects.aggregate(views=Sum("visit_times"))["views"],
        'blogs': Article.objects.count(),
        'visiters': IPLogs.objects.count(),
        'favs': Article.objects.aggregate(favs=Sum("likes"))["favs"]
    }

    return render(request, 'blog/detail.html', kwargs)


# 归档函数
def archive(request):
    article_list = Article.objects.filter(status='p').order_by('-created_time')
    kwargs = dict()
    kwargs['article_list'] = article_list
    # kwargs['current_page'] = 'archive'
    # kwargs['category_list'] = Category.objects.all().order_by('name')
    # kwargs['tag_list'] = Tag.objects.all().order_by('name')
    # kwargs['archive'] = True
    kwargs['views'] = IPLogs.objects.aggregate(views=Sum("visit_times"))["views"]
    kwargs['blogs'] = Article.objects.count()
    kwargs['visiters'] = IPLogs.objects.count()
    kwargs['favs'] = Article.objects.aggregate(favs=Sum("likes"))["favs"]

    return render(request, 'blog/archive.html', kwargs)


# 分类函数
def search(request):
    text = request.GET["text"]

    article_list = Article.objects.filter(
        status="p", title__contains=text).order_by('-created_time')

    kwargs = {
        'archive': True,
        'current_page': 'archive',
        'article_list': article_list,
        'views': IPLogs.objects.aggregate(views=Sum("visit_times"))["views"],
        'blogs': Article.objects.count(),
        'visiters': IPLogs.objects.count(),
        'favs': Article.objects.aggregate(favs=Sum("likes"))["favs"]
    }

    return render(request, 'blog/archive.html', kwargs)


def color(request):
    with open("apps/blog/color.json", 'r') as f:
        data = json.loads(f.read())
    return render(request, 'blog/chinese_colors.html', {'data': data})
