from django.urls import path, re_path
from . import views

app_name = 'blog'

urlpatterns = [
    path('', views.index, name="index"),
    re_path(r'^article/(?P<article_id>\d+)$',
            views.detail, name='detail'),
    path('archive', views.archive, name="archive"),
    path('search', views.search, name="search"),
]
