"""TuClown URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
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
    path('admin/', admin.site.urls),
    path('', xadmin.site.urls),
    path('blog/', include('blog.urls')),
    # path('ueditor/', include('DjangoUeditor.urls')),
    # path('mdeditor/', include('mdeditor.urls')),
    # path('markdown/', include( 'django_markdown.urls')),
    path('ckeditor/', include('ckeditor_uploader.urls')),
]

if settings.DEBUG:
    urlpatterns += static(r'/favicon.ico', document_root='media/favicon.ico')
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
