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

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{% block title %}TuClown | TuClown{% endblock %}</title>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">

    {% block ownstatic %}
        
    {% endblock  %}

</head>
<body>

    <div class="container">
        <p>hello</p>
    </div>


    {% block body %}


        
    {% endblock %}

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</body>
</html>