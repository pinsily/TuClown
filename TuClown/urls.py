from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static


import xadmin
xadmin.autodiscover()

from xadmin.plugins import xversion
xversion.register_models()

import os
import django

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "TuClown.settings")
django.setup()


urlpatterns = [
    path('admin/', xadmin.site.urls),
    path('', include('blog.urls')),
    # path('ckeditor/', include('ckeditor_uploader.urls')),
    path('comment/', include('comment.urls')),
]

if settings.DEBUG:
    urlpatterns += static(r'/favicon.ico', document_root='media/favicon.ico')
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
