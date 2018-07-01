----
# 基本配置 -- 2018.05.31
1. 新建 Django 项目
```
django - admin startproject TuClown
```

2. 新建数据库： tuclown

3. 修改数据库连接配置
```python
# settings.py
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'tuclown',
        'USER': 'root',
        'PASSWORD': 'pinsily',
        'HOST': '127.0.0.1',
        'PORT': '3306',
        'OPTIONS': {
            'sql_mode': 'traditional',
            'charset': 'utf8mb4',
        }
    }
}
```

4. 新建 App
```shell
python manage.py startapp blog
python manage.py startapp userprofile
```

5. 修改中文和时区
```python
# settings.py
LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Shanghai'
```


-----
# 解决标签图标问题
1. 添加 `media / favicon.ico`
2. 配置路由
```python
from django.conf import settings
from django.conf.urls.static import static

if settings.DEBUG:
    urlpatterns += static(r'/favicon.ico', document_root='media/favicon.ico')
```


-----
# 配置 xadmin 后台 -- 2018.05.31
1. 下载安装
2. 添加 app
```python
    'xadmin',
    'crispy_forms',
    'reversion',
```
3. 修改路由
```python
# TuClown/urls.py
from django.contrib import admin
from django.urls import path

import xadmin
xadmin.autodiscover()

from xadmin.plugins import xversion
xversion.register_models()


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', xadmin.site.urls),
]
```

4. 基本配置
```python
# adminx.py
import xadmin


class GlobalSetting(object):
    site_title = "Pinsily.blog"
    site_footer = 'pinsily blog'


xadmin.site.register(xadmin.views.CommAdminView, GlobalSetting)
```


5. 创建管理员
```shell
python manage.py createsuperuser
```

------
# 完成原始用户表的扩展 -- 2018.05.31
1. 继承 `from django.contrib.auth.models import AbstractUser`
2. 增加字段
```
avatar, qq, wechat, mobile
```

3. 生成数据表前需指定
```python
# settings.py
AUTH_USER_MODEL = 'userprofile.UserProfile'
```

4. 迁移
```shell
python manage.py makemigrations
python manage.py migrate
```

5. 配置头像上传路径
```python
# settings.py

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')  # store
MEDIA_URL = '/media/'  # browser use
```

----
# 完成博客有关表的设计 -- 2018.05.31


------

取文章的前120字符并去掉html标签
{{  article.blog | striptags | truncatechars:120 }}


----
使用 django-ckeditor

pip install django-ckeditor

'ckeditor'

配置 model
from ckeditor.fields import RichTextField

content = RichTextField


xadmin 注册的时候单纯注册就行

添加上传图片

1. pip install pillow
2. 添加app： ckeditor_uploader
3. 配置参数
CKEDITOR_UPLOAD_PATH = 'upload/'

MEDIA_URL
MEDIA_ROOT

4. 配置URL
path('ckeditor', include(ckeditor_uploader.urls')),
还有MEDIA的

5. 在修改models

from ckeditor_uploader.fields import RichTextUploadingField


------------

### 登录之后返回原来页面
```
referer = request.META.get("HTTP_REFERER", '/')

if user is not None:
    return redirect(referer)
```