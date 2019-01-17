# -*- coding: utf-8 -*-
"""
-------------------------------------------------
   Filename：      urls
   Author :        pinsily
   date：          19.1.16 23:11
   Description :
-------------------------------------------------
"""
from django.urls import path

from Navigation import views

app_name = "Navigation"

urlpatterns = [
    path("", views.index, name="index"),
]