from django.urls import path, re_path
from . import views

app_name = 'blog'

urlpatterns = [
    # path('', views.IndexView.as_view(), name='index'),
    path('', views.index, name="index"),
    re_path(r'^article/(?P<article_id>\d+)$',
            views.ArticleDetailView.as_view(), name='detail'),
    path('archive', views.ArchiveView.as_view(), name="archive"),
    path('category', views.CategoryView.as_view(), name="category"),
    path('tag', views.TagView.as_view(), name="tag"),
    path('search', views.search, name="search"),
]
