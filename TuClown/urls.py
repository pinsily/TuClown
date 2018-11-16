from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.sitemaps.views import sitemap

from sitemap import ArticleSiteMap, StaticViewSitemap
from blog.feeds import AllArticalRssFeed
from xadmin.plugins import xversion

import xadmin
import os
import django

xadmin.autodiscover()
xversion.register_models()

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "TuClown.settings")
django.setup()

sitemaps = {
    'blog': ArticleSiteMap,
    'static': StaticViewSitemap
}

urlpatterns = [
    path('xadmin/', xadmin.site.urls, name="xadmin"),
    path('admin/', admin.site.urls, name="admin"),
    path('', include('blog.urls')),
    path('comment/', include('comment.urls')),
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps},
         name='django.contrib.sitemaps.views.sitemap'),
    path("rss/", AllArticalRssFeed(), name="rss"),
]

if settings.DEBUG:
    urlpatterns += static(r'/favicon.ico', document_root='media/favicon.ico')
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
