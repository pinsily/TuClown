from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.contrib.contenttypes.models import ContentType

# Create your views here.

from .models import Comment


def comment(request):
    if request.method == "POST":
        # print("1")
        nick = request.POST['nick']
        email = request.POST['email']
        text = request.POST['comment_body']

        content_type = request.POST["content_type"]
        object_id = int(request.POST["object_id"])
        parent_id = int(request.POST['reply_comment_id'])

        # 新建评论
        # print("2")
        comment = Comment()

        # 关联文章和评论
        model_class = ContentType.objects.get(model=content_type).model_class()
        model_obj = model_class.objects.get(pk=object_id)
        # print("3")
        # 关联评论和父级评论
        parent = None
        if parent_id:
            parent = get_object_or_404(Comment, pk=parent_id)
        # print("4")
        # 判断是否是回复评论
        if not parent is None:
            comment.root = parent.root if not parent.root is None else parent
            comment.parent = parent
            comment.reply_name = parent.user_name
        else:
            comment.root = None
            comment.parent = None
        # print("5")
        comment.user_name = nick
        comment.user_email = email
        comment.text = text
        comment.content_object = model_obj

        comment.save()

        referer = request.META.get(
            'HTTP_REFERER', reverse("blog:index"))
        return redirect(referer)

    referer = request.META.get(
        'HTTP_REFERER', reverse("blog:index"))
    return redirect(referer)
