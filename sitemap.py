from django.contrib.sitemaps import Sitemap
from django.urls import reverse

from blog.models import Article


class StaticViewSitemap(Sitemap):
    prioity = 0.5
    changefreq = 'daily'

    def items(self):
        return ['blog:index']

    def location(self, item):
        return reverse(item)


class ArticleSiteMap(Sitemap):
    prioity = 0.6
    changefreq = 'weekly'

    def items(self):
        return Article.objects.filter(status='p')

    def lastmod(self, obj):
        return obj.modified_time
