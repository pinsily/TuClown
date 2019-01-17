from django.shortcuts import render
from . import models


# Create your views here.
def index(request):
    categories = models.Category.objects.all()
    bookmarks = models.Bookmark.objects.all()
    kwargs = {
        "categories": categories,
        "bookmarks": bookmarks,
    }
    return render(request, 'Navigation/index.html', kwargs)
