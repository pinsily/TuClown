# -*- coding: utf-8 -*-
"""
-------------------------------------------------
   Filename：      feeds
   Author :        pinsily
   date：          18.11.14 11:51
   Description :   rss 订阅功能
-------------------------------------------------
"""
import markdown
from django.contrib.syndication.views import Feed

from . import models


class AllArticalRssFeed(Feed):
    title = "TuClown"
    link = "/"
    description = "TuClown Detail"

    # 所有的文章集合
    def items(self):
        return models.Article.objects.all()

    # 显示的文章标题
    def item_title(self, item):
        return "{0}".format(item.title)

    # 文章的描述，这里将文章内容作为描述，并将markdown解析为html
    def item_description(self, item):
        # markdown to html
        extensions = ['markdown.extensions.extra',
                      'markdown.extensions.codehilite',
                      'markdown.extensions.tables',
                      'markdown.extensions.toc']

        return markdown.markdown(item.body, extensions=extensions)
