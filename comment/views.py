from django.shortcuts import render, redirect, reverse, get_object_or_404
from django.contrib.contenttypes.models import ContentType

# Create your views here.

from .models import Comment


def comment(request):
    if request.method == "POST":
        nick = request.POST['nick']
        email = request.POST['email']
        text = request.POST['comment_body']

        # 参数都由隐藏的 input 提供
        content_type = request.POST["content_type"]
        object_id = int(request.POST["object_id"])
        parent_id = int(request.POST['reply_comment_id'])

        # 新建评论
        comment = Comment()

        # 获取对应的文章
        model_class = ContentType.objects.get(model=content_type).model_class()
        model_obj = model_class.objects.get(pk=object_id)

        # 关联评论和父级评论
        parent = None
        if parent_id:
            parent = get_object_or_404(Comment, pk=parent_id)

        # 判断是否是回复评论
        if not parent is None:
            comment.root = parent.root if not parent.root is None else parent
            comment.parent = parent
            comment.reply_name = parent.user_name
        else:
            comment.root = None
            comment.parent = None

        comment.user_name = nick
        comment.user_email = email
        comment.text = text
        comment.content_object = model_obj

        comment.save()

        # 评论后回到原页面
        referer = request.META.get(
            'HTTP_REFERER', reverse("blog:index"))
        return redirect(referer)

    referer = request.META.get(
        'HTTP_REFERER', reverse("blog:index"))
    return redirect(referer)
