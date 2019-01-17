from django.db import models


# Create your models here.

class CommonClass(models.Model):
    # auto_now_add 创建时间戳，不会被覆盖
    created_time = models.DateTimeField(auto_now_add=True, verbose_name=u'创建时间')
    # auto_now 自动覆盖
    modified_time = models.DateTimeField(auto_now=True, verbose_name=u'修改时间')


class Category(CommonClass):
    name = models.CharField('分类名', max_length=20)
    english_name = models.CharField("分类英文名", max_length=100)

    class Meta:
        db_table = "nav_category"
        ordering = ['name']

    def __str__(self):
        return self.name


class Bookmark(CommonClass):
    name = models.CharField(max_length=200, verbose_name=u'书签名')
    url = models.URLField(default="http://blog.pinsily.site", verbose_name=u'书签地址')
    image = models.FileField(upload_to='bookmark/uploads/')
    cate = models.ForeignKey('Category', on_delete=models.CASCADE, verbose_name=u'书签分类')
    desc = models.CharField(max_length=255, verbose_name="描述", blank=True, default="暂时没有描述，请到官网了解")

    class Meta:
        db_table = 'bookmark'
        ordering = ['cate', 'name']

    def __str__(self):
        return "{0} - {1}".format(self.cate, self.name)


class NavSetting(CommonClass):
    name = models.CharField(max_length=255, verbose_name="导航栏名称")
    url = models.URLField(verbose_name="导航栏网址")
    image = models.FileField(upload_to="bookmark/uploads/")
    desc = models.CharField(max_length=255, verbose_name="导航栏描述")
    useful = models.BooleanField(verbose_name="是否使用")

    class Meta:
        db_table = "nav_setting"
        ordering = ['name']

    def __str__(self):
        return self.name
