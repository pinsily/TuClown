from django.urls import path, include, re_path
from . import views

app_name = 'comment'

urlpatterns = [
    path('', views.comment, name='user_comment'),
]
