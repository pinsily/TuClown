<<<<<<< HEAD
from django.db import models

from django.contrib.auth.models import AbstractUser
# Create your models here.


# 使用继承扩展用户表
class UserProfile(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='avatar/default.jpg',
                               max_length=200, null=True, blank=True, verbose_name=u"用户头像")
    qq = models.CharField(max_length=20, blank=True,
                          null=True, verbose_name=u'用户QQ')
    wechat = models.CharField(
        max_length=50, blank=True, null=True, verbose_name=u'用户微信')
    mobile = models.CharField(
        max_length=11, blank=True, null=True, verbose_name=u'用户电话')
    url = models.URLField(max_length=100, blank=True,
                          null=True, verbose_name='个人网页地址')

    class Meta:
        # 数据表表名自定义
        db_table = 'user_profile'
        # 定义排序方式为 id 的倒序
        ordering = ['-id']

    def __str__(self):
        return self.username
=======
from django.db import models

from django.contrib.auth.models import AbstractUser
# Create your models here.


# 使用继承扩展用户表
class UserProfile(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='avatar/default.jpg',
                               max_length=200, null=True, blank=True, verbose_name=u"用户头像")
    qq = models.CharField(max_length=20, blank=True,
                          null=True, verbose_name=u'用户QQ')
    wechat = models.CharField(
        max_length=50, blank=True, null=True, verbose_name=u'用户微信')
    mobile = models.CharField(
        max_length=11, blank=True, null=True, verbose_name=u'用户电话')
    url = models.URLField(max_length=100, blank=True,
                          null=True, verbose_name='个人网页地址')

    class Meta:
        # 数据表表名自定义
        db_table = 'user_profile'
        # 定义排序方式为 id 的倒序
        ordering = ['-id']

    def __str__(self):
        return self.username
>>>>>>> dfa1be1e8bf6ee4f8a52e2b475c89765527bcad1
