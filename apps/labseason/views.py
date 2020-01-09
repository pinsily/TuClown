from django.shortcuts import render

# Create your views here.


def index(request):
    return render(request, 'labseason/index.html')


def not_found(request):
    return render(request, 'labseason/404.html')


def blank(request):
    return render(request, 'labseason/blank.html')


def buttons(request):
    return render(request, 'labseason/buttons.html')


def cards(request):
    return render(request, 'labseason/cards.html')


def charts(request):
    return render(request, 'labseason/charts.html')


def forget_pwd(request):
    return render(request, 'labseason/forgot-password.html')


def login(request):
    return render(request, 'labseason/login.html')


def register(request):
    return render(request, 'labseason/register.html')


def tables(request):
    return render(request, 'labseason/tables.html')


def animation(request):
    return render(request, 'labseason/utilities-animation.html')


def border(request):
    return render(request, 'labseason/utilities-border.html')


def color(request):
    return render(request, 'labseason/utilities-color.html')


def other(request):
    return render(request, 'labseason/utilities-other.html')