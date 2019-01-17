from django.shortcuts import render
from . import models


# Create your views here.
def index(request):
    categories = models.Category.objects.all()
    setting = models.NavSetting.objects.get(useful=True)
    kwargs = {
        "categories": categories,
        "setting": setting,
    }
    return render(request, 'Navigation/index.html', kwargs)
