from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

from django.contrib.sitemaps.views import sitemap


import xadmin
xadmin.autodiscover()

from xadmin.plugins import xversion
xversion.register_models()

import os
import django

from sitemap import ArticleSiteMap, StaticViewSitemap

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "TuClown.settings")
django.setup()


sitemaps = {
    'blog': ArticleSiteMap,
    'static': StaticViewSitemap
}


urlpatterns = [
    path('admin/', xadmin.site.urls),
    path('', include('blog.urls')),
    # path('ckeditor/', include('ckeditor_uploader.urls')),
    path('comment/', include('comment.urls')),
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps},
         name='django.contrib.sitemaps.views.sitemap'),
]

if settings.DEBUG:
    urlpatterns += static(r'/favicon.ico', document_root='media/favicon.ico')
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
