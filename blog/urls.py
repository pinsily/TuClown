<<<<<<< HEAD
from django.urls import path, include, re_path
from . import views

app_name = 'blog'

urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    re_path(r'^article/(?P<article_id>\d+)$',
            views.ArticleDetailView.as_view(), name='detail'),
    re_path(r'comment/(?P<article_id>\d+)$', views.comment, name='comment'),
    path('archive', views.ArchiveView.as_view(), name="archive"),
    path('category', views.CategoryView.as_view(), name="category"),
    path('tag', views.TagView.as_view(), name="tag"),
    path('navigation', views.NavigationView.as_view(), name="navigation"),
]
=======
from django.urls import path, include, re_path
from . import views

app_name = 'blog'

urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
    re_path(r'^article/(?P<article_id>\d+)$',
            views.ArticleDetailView.as_view(), name='detail'),
    re_path(r'comment/(?P<article_id>\d+)$', views.comment, name='comment'),
    path('archive', views.ArchiveView.as_view(), name="archive"),
    path('category', views.CategoryView.as_view(), name="category"),
    path('tag', views.TagView.as_view(), name="tag"),
    path('navigation', views.NavigationView.as_view(), name="navigation"),
]
>>>>>>> dfa1be1e8bf6ee4f8a52e2b475c89765527bcad1
