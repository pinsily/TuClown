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

    def items(self):
        return models.Article.objects.all()

    def item_title(self, item):
        return "{1}".format(item.title)

    def item_description(self, item):
        # markdown to html
        extensions = ['markdown.extensions.extra',
                      'markdown.extensions.codehilite',
                      'markdown.extensions.tables',
                      'markdown.extensions.toc'
                      ]

        return markdown.markdown(item.body, extensions=extensions)


if __name__ == '__main__':
    pass
