-- MySQL dump 10.13  Distrib 5.5.60, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tuclown
-- ------------------------------------------------------
-- Server version	5.5.60-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `abstract` varchar(54) DEFAULT NULL,
  `views` int(10) unsigned NOT NULL,
  `likes` int(10) unsigned NOT NULL,
  `topped` tinyint(1) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_category_id_99127861_fk_category_id` (`category_id`),
  CONSTRAINT `article_category_id_99127861_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'django -- 文件上传至七牛云','---\r\n\r\n![][1]\r\n\r\n<p><center>青梅枯萎，竹马老去，从此我爱上的人都像你</center></p>\r\n\r\n\r\n\r\n------\r\n### 说明\r\n因为考虑到本地存储的不方便性，于是在上网找到了相关的插件 django-qiniu-storage\r\n\r\n> 官网：[http://django-qiniu-storage.readthedocs.io/zh_CN/latest/][2]\r\n\r\n----------\r\n### 各项配置\r\n0. 安装\r\n```\r\npip install django-qiniu-storage\r\n```\r\n\r\n安装的时候出现了超时连接的问题，于是就使用了国内镜像安装\r\n```\r\npip  install --index https://pypi.mirrors.ustc.edu.cn/simple/ django-qiniu-storage \r\n```\r\n\r\n有意思的是，这个插件竟然不用放到 settting.py 中的 INSTALLED_APPS \r\n\r\n1. 登录或者注册七牛云获取以下数据,具体地操作可以自行百度\r\n```\r\nQINIU_ACCESS_KEY = \'**\'    # AK\r\nQINIU_SECRET_KEY = \'**\'    # SK\r\nQINIU_BUCKET_NAME = \'django\'   # 存储空间名字\r\nQINIU_BUCKET_DOMAIN = \'p9w6udf2c.bkt.clouddn.com\' # 外链的前缀\r\n```\r\n\r\n2. 配置 `settings.py`\r\n```\r\nQINIU_ACCESS_KEY = \'**\'\r\nQINIU_SECRET_KEY = \'**\'\r\nQINIU_BUCKET_NAME = \'django\'\r\nQINIU_BUCKET_DOMAIN = \'p9w6udf2c.bkt.clouddn.com\'\r\nQINIU_SECURE_URL = False   # 使用http\r\n\r\n# http://p9w6udf2c.bkt.clouddn.com/10-18818.jpg\r\n\r\nPREFIX_URL = \'http://\'\r\n\r\nMEDIA_URL = PREFIX_URL + QINIU_BUCKET_DOMAIN + \'/media/\'\r\n#MEDIA_ROOT = os.path.join(BASE_DIR, \'media\')\r\nMEDIA_ROOT = \'media/\'\r\n\r\nDEFAULT_FILE_STORAGE = \'qiniustorage.backends.QiniuMediaStorage\'\r\n```\r\n\r\n这里需要注意的是 `MEDIA_ROOT` 的值不要还是按照原来本地文件上传时的配置，`MEDIA_ROOT = os.path.join(BASE_DIR, \'media\')`，这样会失败的\r\n\r\n参考：`https://www.jianshu.com/p/6b543668462b`\r\n\r\n\r\n3. 配置 `models`\r\n```python\r\nclass Article(models.Model):\r\n    #image = models.FileField() # 这里什么参数都不用\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/PJ.jpg\r\n  [2]: http://django-qiniu-storage.readthedocs.io/zh_CN/latest/','1.jpg','2018-06-08 15:09:00','2018-07-03 09:05:00','p','因为考虑到本地存储的不方便性，于是在上网找到了相关的插件 django-qiniu-storage',16,0,0,'pinsily',1),(2,'django -- 文件上传至本地','---\r\n\r\n![][1]\r\n\r\n<p><center>他的路在西风的袍袖中,在夕阳的咽喉里</center></p>\r\n\r\n\r\n----------\r\n### 说明\r\n之前看官网一直搞不明白，现在重新折腾了一下，并实现了效果\r\n\r\n------\r\n### 各项配置\r\n1. 配置 MEDIA 路径\r\n\r\n``` python\r\n# setting.py\r\n\r\nMEDIA_ROOT = os.path.join(BASE_DIR, \'media\')\r\nMEDIA_URL = \'/media/\'\r\n```\r\n\r\n```python\r\n# 根目录 urls.py\r\n\r\nfrom django.conf import settings\r\nfrom django.conf.urls.static import static\r\n\r\nif settings.DEBUG:\r\n    urlpatterns += static(settings.MEDIA_URL,\r\n                          document_root=settings.MEDIA_ROOT)\r\n\r\n```\r\n\r\n需要在项目根目录下创建一个 `media` 文件夹，Django 社区是默认这样的，也可以根据自己的需要有所更改\r\n\r\n\r\n2. 配置 models\r\n```python\r\nclass Article(models.Model):\r\n    #image = models.FileField(upload_to=\'blog/uploads/\')\r\n```\r\n\r\n`uploads_to` 的参数指的是上传的文件将存储在 `MEDIA_ROOT\\blog\\uploads` 文件夹中\r\n\r\n3. 迁移进数据库中\r\n```shell\r\n$ python manage.py makemigrations\r\n$ python manage.py migrate\r\n```\r\n\r\n4. 模板中使用\r\n```\r\n{{ article.image.url }}\r\n```\r\n\r\narticle 是一个文章对象，需要注意的是需要使用到 `url`，如果直接使用 `article.image`是访问不到的\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/BklynBrdge.jpg','10-2758.jpg','2018-06-08 15:12:00','2018-06-27 11:01:48','p','之前看官网一直搞不明白，现在重新折腾了一下，并实现了效果',9,0,0,'pinsily',1),(3,'django -- 模板中获得结果集的长度','---\r\n\r\n![][1]\r\n\r\n<p><center>如果，我多一张船票，你会不会跟我一起走？ ——花样年华</center></p>\r\n\r\n\r\n----------\r\n### 参考\r\n> [https://stackoverflow.com/questions/6495563/what-is-the-django-template-tag-to-get-the-number-of-items-returned-in-a-result?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa][2]\r\n\r\n----------\r\n### 方法\r\n可以直接使用模板中的过滤器 length：\r\n\r\n``` python\r\n{{ articles|length }}\r\n```\r\n\r\n\r\n------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/SpringtimeinGiverny.jpg\r\n  [2]: https://stackoverflow.com/questions/6495563/what-is-the-django-template-tag-to-get-the-number-of-items-returned-in-a-result?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa','10-13703.jpg','2018-06-08 15:13:00','2018-06-27 22:58:20','p','如果，我多一张船票，你会不会跟我一起走？',11,0,0,'pinsily',1),(4,'django -- xadmin 自定义右侧菜单栏','---\r\n\r\n![][1]\r\n\r\n<p><center>时间的沙漏沉淀着无法逃离的过往,记忆的双手总是拾起那些明媚的忧伤</center></p>\r\n\r\n------\r\n### 说明\r\nxadmin 默认的菜单栏包含了 Reversion，权限管理等选项，但是一般是用不上的，于是想着办法将其去掉，可以被逼着去翻了源码才搞定了\r\n\r\n----------\r\n### 修改\r\n[源码解析地址][2]\r\n\r\n主要用到的是视图类 `CommAdminView` 中 `get_site_menu()` 和 `get_nav_menu()` 方法，前一个是自定义增加菜单栏的，后一个是将增加的菜单栏合并到原来的菜单栏中并返回新的菜单栏集合，思路就是将返回的新集合只包含新增的菜单栏\r\n\r\n```python\r\n# adminx.py\r\nclass GlobalSetting(object):\r\n    site_title = \"Pinsily.blog\"\r\n    site_footer = \'pinsily blog\'\r\n    # menu_style = \'accordion\'\r\n\r\n    # 自定义新增菜单栏\r\n    def get_site_menu(self):\r\n        return (\r\n            {\'title\': \'Blog\', \'perm\': self.get_model_perm(Article, \'change\'), \'menus\': (\r\n                {\'title\': \'Article\', \'url\': self.get_model_url(\r\n                    Article, \'changelist\')},\r\n                {\'title\': \'Category\', \'url\': self.get_model_url(\r\n                    Category, \'changelist\')},\r\n                {\'title\': \'BlogComment\', \'url\': self.get_model_url(\r\n                    BlogComment, \'changelist\')},\r\n                {\'title\': \'Tag\', \'url\': self.get_model_url(Tag, \'changelist\')},\r\n                {\'title\': \'OneModel\', \'url\': self.get_model_url(\r\n                    OneModel, \'changelist\')},\r\n            )},\r\n        )\r\n\r\n    def get_nav_menu(self):\r\n        # 直接返回新增的菜单栏，源码中还有很大一部分的合并功能\r\n        site_menu = list(self.get_site_menu() or [])\r\n        return site_menu\r\n\r\n\r\nxadmin.site.register(xadmin.views.CommAdminView, GlobalSetting)\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/SatelliteGlades.jpg\r\n  [2]: http://xadmin.readthedocs.io/en/docs-chinese/_modules/xadmin/views/base.html','10-17351.jpg','2018-06-08 15:14:00','2018-06-26 14:49:18','p','xadmin 默认的菜单栏包含了 Reversion，权限管理等选项，但是一般是用不上的，于是想着办法将其去',8,0,0,'pinsily',1),(5,'django -- ajax 403 错误','---\r\n![][1]\r\n<p><center>早知如此绊人心，何如当初莫相识。 ——秋风词</center></p>\r\n\r\n------\r\n### 说明\r\n在使用 ajax 实现文章点赞功能的时候，请求出现了 403 的错误\r\n```shell\r\nPOST http://localhost:8000/likes/1 403 (FORBIDDEN)\r\n```\r\n\r\n\r\n----------\r\n### 解决\r\n在官网上已经有了相应的解决方法和实例，出现这个问题的主要原因是没有添加 csrf 认证,解决的基本原理就是在post数据里面添加csrf信息\r\n> AJAX  \r\n> While the above method can be used for AJAX POST requests, it has some inconveniences: you have to remember to pass the CSRF token in as POST data with every POST request. For this reason, there is an alternative method: on each XMLHttpRequest, set a custom X-CSRFToken header to the value of the CSRF token. This is often easier, because many JavaScript frameworks provide hooks that allow headers to be set on every request.  \r\n> As a first step, you must get the CSRF token itself. The recommended source for the token is the > csrftoken cookie, which will be set if you’ve enabled CSRF protection for your views as outlined above. \r\n\r\n将下面的代码添加到同一个 ajax js 文件中或代码片段中即可解决问题\r\n```javascript\r\nfunction getCookie(name) {  \r\n    var cookieValue = null;  \r\n    if (document.cookie && document.cookie != \'\') {  \r\n        var cookies = document.cookie.split(\';\');  \r\n        for (var i = 0; i < cookies.length; i++) {  \r\n            var cookie = jQuery.trim(cookies[i]);  \r\n            // Does this cookie string begin with the name we want?  \r\n            if (cookie.substring(0, name.length + 1) == (name + \'=\')) {  \r\n                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));  \r\n                break;  \r\n            }  \r\n        }  \r\n    }  \r\n    return cookieValue;  \r\n}  \r\n  \r\nfunction csrfSafeMethod(method) {  \r\n    // these HTTP methods do not require CSRF protection  \r\n    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));  \r\n}  \r\n$.ajaxSetup({  \r\n    beforeSend: function(xhr, settings) {  \r\n    var csrftoken = getCookie(\'csrftoken\');       \r\n    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {  \r\n            xhr.setRequestHeader(\"X-CSRFToken\", csrftoken);  \r\n        }  \r\n    }  \r\n});  \r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/MozambiqueSandbar.jpg','10-18818.jpg','2018-06-08 15:15:00','2018-06-27 22:37:46','p','在使用 ajax 实现文章点赞功能的时候，请求出现了 403 的错误',9,0,0,'pinsily',1),(6,'django -- 自定义数据库表名','---\r\n\r\n![][1]\r\n\r\n<p><center>雨，何时停？ ——秋之回忆</center></p>\r\n\r\n------\r\n### 说明\r\n\r\ndjango 自动生成的表名是 app 名和 model 名的组合，如果想改变的话，自定义 db_table 属性就行了\r\n\r\n```python\r\nfrom django.db import models\r\n\r\n\r\nclass UserModel(models.Model):\r\n    username = models.CharField(max_length=100, default=\"\", verbose_name=u\"用户名\")\r\n    password = models.CharField(max_length=100, default=\"\", verbose_name=u\"密码\")\r\n    \r\n    class Meta:\r\n        db_table = \"userprofile\"\r\n\r\n```\r\n\r\n----------\r\n\r\n[1]: http://owgxfd8jv.bkt.clouddn.com/ResplendentQuetzal.jpg','10-23733_6rrnMPO.jpg','2018-06-08 15:16:00','2018-07-04 11:53:43','p','django 自动生成的表名是 app 名和 model 名的组合，如果想改变的话，自定义 db_table',39,0,0,'pinsily',1),(7,'django -- Abstract User Error','---\r\n\r\n![][1]\r\n\r\n<p><center>回头皆幻景，对面知是谁。 ——牡丹亭</center></p>\r\n\r\n------\r\n### 问题\r\n在使用 AbstractUser 扩展用户的时候，数据库迁移时出现了一下错误\r\n```\r\nReverse accessor for \'User.groups\' clashes with reverse accessor for \'UserModel.groups\'.\r\nHINT: Add or change a related_name argument to the definition for \'User.groups\' or \'UserModel.groups\'.\r\n```\r\n\r\n\r\n----------\r\n### 解决\r\n在 settings.py 中增加相关变量，让 django 知道那个是用户管理 model\r\n```\r\nAUTH_USER_MODEL = \'user_admin.UserModel\'\r\n```\r\n\r\n`user_admin` 为 app 名字， `UserModel` 为所用用户 model\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/10-85058.jpg','10-26520.jpg','2018-06-08 15:17:00','2018-07-01 20:54:51','p','在使用 AbstractUser 扩展用户的时候，数据库迁移时出现了一下错误',40,0,0,'pinsily',1),(8,'django -- 获得当前时间','---\r\n\r\n![][1]\r\n\r\n<p><center>一朝春尽红颜老，花落人亡两不知。 ——红楼梦</center></p>\r\n\r\n------\r\n### 前言\r\n> 之前使用 django 的时候，都是原始的方法获得时间，发现 django 以自带有获得时间的包了\r\n\r\n----------\r\n### 使用\r\n- settings.py\r\n```python\r\nTIME_ZONE = \'Asia/Shanghai\'\r\n```\r\n\r\n- 其他文件\r\n```python\r\nfrom django.utils import timezone\r\n\r\ncreate_time = timezone.localtime(timezone.now())\r\n# datetime.datetime(2018, 3, 17, 19, 34, 53, 993815, tzinfo=<DstTzInfo \'Asia/Shanghai\' CST+8:00:00 STD>)\r\n\r\n# 可以获得相应的年月日\r\nyear = create_time.year\r\nday = create_time.day\r\n\r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/10-85431.jpg','10-48541_IGlTFEl.jpg','2018-06-08 15:18:00','2018-06-30 12:32:26','p','之前使用 django 的时候，都是原始的方法获得时间，发现 django 以自带有获得时间的包了',37,0,0,'pinsily',1),(9,'django  -- static 静态文件','----------\r\n\r\n![][1]\r\n\r\n<center><p>我们确实有如是的优点，但也要隐藏几分，这个叫做涵养</p></center>\r\n\r\n\r\n----------\r\n### 简单说明\r\n关于静态文件的保存使用，应该保存下来的目录习惯，构建项目时将文件放到 app 中，css 文件目录为 `appname/static/appname/style.css`，图片等目录为 `apname/static/appname/image/1.jpg`，之所以加多一层 `appname` 目录，是因为防止多个 app 中存在相同名称的文件，导致出错\r\n\r\n当项目部署时，将所有文件搜集到项目根目录下的 `static/` 中\r\n\r\n---------\r\n### app 下配置\r\n1. 确保 app 在  INSTALLED_APPS 中\r\n2. `settings.py`\r\n```python\r\nSTATIC_URL = \'/static/\'\r\n```\r\n3. 在 app 下新建 static 文件夹并新建相应文件\r\n4. 引用`/static/appname/style.css`\r\n```\r\n{% load static %}\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"{% static \"appname/style.css\" %}\">\r\n```\r\n\r\n\r\n\r\n----------\r\n### 根目录下\r\n1. `settings.py`\r\n```\r\nimport os \r\nBASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))\r\n\r\nSTATICFILES_DIRS = [\r\n    os.path.join(BASE_DIR, \"static\")\r\n]\r\n```\r\n\r\n2. 在根目录下新建 static 文件夹并新建文件\r\n3. 引用 `/static/css/style.css`\r\n```\r\n{% load static %}\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"{% static \"css/style.css\" %}\">\r\n```\r\n\r\n\r\n----------\r\n### 优先级设置\r\n```python\r\nSTATICFILES_FINDERS = (\r\n    \"django.contrib.staticfiles.finders.FileSystemFinder\",\r\n    \"django.contrib.staticfiles.finders.AppDirectoriesFinder\"\r\n)\r\n```\r\n\r\n\r\n----------\r\n### 部署使用\r\n1. 设置 `static_root`\r\n```python\r\nSTATIC_ROOT = os.path.join(BASE_DIR, \'collected_static\')\r\n```\r\n\r\n2. 收集静态文件\r\n```\r\npython manage.py collectstatic\r\n```\r\n3. nginx 部署\r\n```\r\nlocation /static {\r\n    alias /path/to/project/collected_static;\r\n}\r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/%E8%A7%86%E8%A7%89%20-%201.jpg','10-55009.jpg','2018-06-08 15:19:00','2018-07-02 00:39:42','p','我们确实有如是的优点，但也要隐藏几分，这个叫做涵养',30,0,0,'pinsily',1),(10,'django -- templates','----------\r\n![][1]\r\n\r\n<center><p>所谓现实，“发生”的并非实体，而是现象</p></center>\r\n\r\n---------\r\n### 配置信息\r\n```python\r\nBASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))\r\n```\r\n\r\n```python\r\nTEMPLATES = [\r\n    {\r\n        \'BACKEND\': \'django.template.backends.django.DjangoTemplates\',\r\n        \'DIRS\': [os.path.join(BASE_DIR, \'templates\')],\r\n        \'APP_DIRS\': True,\r\n        \'OPTIONS\': {\r\n            \'context_processors\': [\r\n                \'django.template.context_processors.debug\',\r\n                \'django.template.context_processors.request\',\r\n                \'django.contrib.auth.context_processors.auth\',\r\n                \'django.contrib.messages.context_processors.messages\',\r\n            ],\r\n        },\r\n    },\r\n]\r\n```\r\n\r\n#### 简单说明\r\n1. APP_DIRS : 是否使用 APP 下的 templates 目录，貌似是优先\r\n2. DIRS : templates 目录的路径集合，django 会按照排列顺序进行查找\r\n3. BACKEND : 后端类接口，保持默认即可,虽然其中还是挺多学问的\r\n\r\n----------\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/%E8%AE%BE%E8%AE%A1%20-%207.jpg','10-85431.jpg','2018-06-08 15:20:00','2018-07-01 14:54:49','p','所谓现实，“发生”的并非实体，而是现象',41,0,0,'pinsily',1),(11,'django -- js 交互','----------\r\n\r\n![][1]\r\n\r\n<center><p>她走了，一位风一般的佳人</p></center>\r\n\r\n---------\r\n### 前言\r\ndjango 与 js 的交互主要有两种:\r\n- js 不需要处理\r\n- js 需要处理\r\n\r\n----------\r\n### js 不需要处理\r\n直接使用 django 模板传递\r\n\r\n\r\n----------\r\n### js 需要处理\r\n直接传递使用的话会报错\r\n```\r\nUncaught SyntaxError: Unexpected token ILLEGAL\r\n```\r\n\r\n#### 解决方法\r\n- 视图函数中的字典或列表要用 json.dumps() 处理\r\n- 在模板上要加 safe 过滤器\r\n\r\nviews.py\r\n```\r\n# -*- coding: utf-8 -*-\r\n \r\nfrom __future__ import unicode_literals\r\n \r\nimport json\r\nfrom django.shortcuts import render\r\n \r\ndef home(request):\r\n    List = [\'one\', \'two\']\r\n    return render(request, \'home.html\', {\r\n            \'List\': json.dumps(List)\r\n        })\r\n```\r\n\r\nhome.html(部分)\r\n```\r\n<script type=\"text/javascript\">\r\n    var List = {{ List|safe }};\r\n</script>\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/%E5%8A%A8%E6%BC%AB%20-%208.jpg','10-85760.jpg','2018-06-08 15:21:00','2018-07-04 13:49:22','p','django 与 js 的交互主要有两种',52,0,0,'pinsily',1),(12,'docker 笔记(0) -- 概述','--------\r\n![][1]\r\n\r\n<center>摆脱了奴役和罪恶的束缚，摆脱了庸俗和野蛮，生命就显得有生气了。</center>\r\n\r\n----------\r\n### Docker 是什么\r\n百度百科\r\n> Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。\r\n\r\n\r\n就自己所了解的一些，docker 相当于是简化版的虚拟机，但是又跟虚拟机有着不同，在使用时，docker 又相当于一个程序在运作了，不用像虚拟机那样配置各种内存、空间等等，所以说，docker 既有虚拟机的独立性，又没有虚拟机的繁杂\r\n\r\n\r\n一个完整的 docker 包含以下部分：\r\n1. dockerClient 客户端\r\n2. Docker Daemon 守护进程\r\n3. Docker Image 镜像\r\n4. DockerContainer 容器\r\n\r\n上面的前两项自不必说，客户端和进程对程序来说再正常不过，那么镜像和容器呢\r\n\r\n容器是 docker 进行独立的一个箱子，也就是上面所说的沙盒模型，在这个容器当中，我们可以放入相应的镜像，以获得不同的操作系统进行试验\r\n\r\n要有镜像，就要有获取的途径，docker 自身有一个远程镜像仓库 Docker Hub，里面存放在已经打包好的各种镜像，方便性来讲算是超然的了\r\n\r\n\r\n开始的界面\r\n\r\n![][2]\r\n\r\n可以找到许多相关的镜像\r\n\r\n![][3]\r\n\r\n当我们构建容器执行镜像文件时，如果 docker 发现本地没有此镜像文件的话，就自动在这里下载了\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/1508573197221.jpg \r\n  [2]: http://owgxfd8jv.bkt.clouddn.com/1508573197736.jpg\r\n  [3]: http://owgxfd8jv.bkt.clouddn.com/1508573197741.jpg','DandelionXray.jpg','2017-10-21 12:11:00','2018-06-28 02:34:33','p','Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中',20,0,0,'pinsily',2),(13,'docker 笔记(1) -- 安装','---\r\n\r\n![][1]\r\n<center>一段关系无解，不是任何人的错，那么我们就把悲伤藏在心底。微笑着，说再见。</center>\r\n\r\n----------\r\n\r\n###  参考\r\n[菜鸟教程 -- docker][2]\r\n\r\n[2]: http://www.runoob.com/docker/docker-tutorial.html\r\n\r\n----------\r\n\r\n\r\n### 前提条件\r\n>docker 要求 Ubuntu 系统的内核版本高于 3.10\r\n\r\n```shell\r\nroot@pinsily:~# uname -r\r\n4.4.0-79-generic\r\n```\r\n\r\n----------\r\n\r\n### 使用脚本安装 Docker\r\n#### 1. 获取最新版本的 Docker 安装包\r\n\r\n```shell\r\nroot@pinsily:~# wget -qO- https://get.docker.com/ | sh\r\n```\r\n\r\n开始下载脚本并且安装 Docker 及依赖包\r\n```shell\r\n\r\n# Executing docker install script, commit: 490beaa\r\n+ sh -c apt-get update -qq >/dev/null\r\n+ sh -c apt-get install -y -qq apt-transport-https ca-certificates curl software-properties-common >/dev/null\r\n+ sh -c curl -fsSL \"https://download.docker.com/linux/ubuntu/gpg\" | apt-key add -qq - >/dev/null\r\n+ sh -c echo \"deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty edge\" > /etc/apt/sources.list.d/docker.list\r\n+ [ ubuntu = debian ]\r\n+ sh -c apt-get update -qq >/dev/null\r\n+ sh -c apt-get install -y -qq docker-ce >/dev/null\r\n+ sh -c docker version\r\nClient:\r\n Version:      17.10.0-ce\r\n API version:  1.33\r\n Go version:   go1.8.3\r\n Git commit:   f4ffd25\r\n Built:        Tue Oct 17 19:04:40 2017\r\n OS/Arch:      linux/amd64\r\n\r\nServer:\r\n Version:      17.10.0-ce\r\n API version:  1.33 (minimum version 1.12)\r\n Go version:   go1.8.3\r\n Git commit:   f4ffd25\r\n Built:        Tue Oct 17 19:03:20 2017\r\n OS/Arch:      linux/amd64\r\n Experimental: false\r\n\r\n\r\n```\r\n\r\n后面还有一段提示\r\n```shell\r\nIf you would like to use Docker as a non-root user, you should now consider\r\nadding your user to the \"docker\" group with something like:\r\n\r\n  sudo usermod -aG docker your-user\r\n\r\nRemember that you will have to log out and back in for this to take effect!\r\n\r\n```\r\n\r\n如果是非 root 用户的话，就需要留意这条信息，在启动 docker 时需要先执行命令，`your-user`是当前用户名 \r\n```shell\r\nsudo usermod -aG docker your-user\r\n```\r\n\r\n#### 2. 启动docker 后台服务\r\n```\r\nroot@pinsily:~# service docker start\r\n```\r\n\r\n#### 3. 测试运行\r\n```shell\r\nroot@pinsily:~# docker run hello-world\r\n```\r\n\r\n因为本地没有这个 hello-world 的镜像，所以它会自动从远程库 Docker Hub  中下载\r\n```\r\nUnable to find image \'hello-world:latest\' locally\r\nlatest: Pulling from library/hello-world\r\n5b0f327be733: Pull complete\r\nDigest: sha256:07d5f7800dfe37b8c2196c7b1c524c33808ce2e0f74e7aa00e603295ca9a0972\r\nStatus: Downloaded newer image for hello-world:latest\r\n```\r\n\r\n下面是测试的结果\r\n```shell\r\nHello from Docker!\r\nThis message shows that your installation appears to be working correctly.\r\n\r\nTo generate this message, Docker took the following steps:\r\n 1. The Docker client contacted the Docker daemon.\r\n 2. The Docker daemon pulled the \"hello-world\" image from the Docker Hub.\r\n 3. The Docker daemon created a new container from that image which runs the\r\n    executable that produces the output you are currently reading.\r\n 4. The Docker daemon streamed that output to the Docker client, which sent it\r\n    to your terminal.\r\n\r\nTo try something more ambitious, you can run an Ubuntu container with:\r\n $ docker run -it ubuntu bash\r\n\r\nShare images, automate workflows, and more with a free Docker ID:\r\n https://cloud.docker.com/\r\n\r\nFor more examples and ideas, visit:\r\n https://docs.docker.com/engine/userguide/\r\n\r\n```\r\n\r\n\r\n----------\r\n\r\ndocker 的安装还是挺容易的，做一下简单的记录就行\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/1508572492023.jpg','MooseLakeGrass.jpg','2017-10-22 01:42:00','2018-06-28 02:27:16','p','一段关系无解，不是任何人的错，那么我们就把悲伤藏在心底。微笑着，说再见。',9,0,0,'pinsily',2),(14,'docker 笔记(2) -- 镜像','----------\r\n![][1]\r\n<center>无论如何，飞蛾扑火都是一种高贵的姿态。</center>\r\n\r\n----------\r\n###  参考\r\n[菜鸟教程 -- docker][2]\r\n\r\n\r\n----------\r\n\r\n\r\n### 额\r\n\r\n当使用的镜像文件本地不存在时，则从远程镜像库中下载，默认是 docker Hub，也可以找到其他的镜像库使用\r\n\r\n----\r\n### 列出所有的本地镜像\r\n```shell\r\nroot@pinsily:~# docker images\r\nREPOSITORY          TAG                 IMAGE ID            CREATED             SIZE\r\nhello-world         latest              05a3bd381fc2        5 weeks ago         1.84kB\r\n```\r\n\r\n表头名分别表示 镜像源、标签、ID、生成时间以及大小，其中我们经常以 REPOSITORY:TAG 来表示镜像，比如 Ubuntu:14.04,如果使用的时候不加标签的话，默认下载最新版本的，也即 latest 标签\r\n\r\n\r\n----------\r\n\r\n\r\n### 预先下载镜像\r\n可以不在使用的时候就把镜像下载好\r\n```\r\nroot@pinsily:~# docker pull ubuntu:14.04\r\n\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n### 搜索远程镜像库\r\n```shell\r\nroot@pinsily:~# docker search ubuntu\r\n\r\nNAME                                            DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED\r\nubuntu                                          Ubuntu is a Debian-based Linux operating s...   6699                [OK]\r\nubuntu-upstart                                  Upstart is an event-based replacement for ...   80                  [OK]\r\nubuntu-debootstrap                              debootstrap --variant=minbase --components...   31                  [OK]\r\nsaltstack/ubuntu-14.04-minimal                                                                  7                                       [OK]\r\nbrook/ubuntu-14.04.3-baidupcs                   https://github.com/GangZhuo/BaiduPCS 此项目功能...   6                                       [OK]\r\nsaltstack/ubuntu-14.04                                                                          5                                       [OK]\r\ntmartinx/ubuntu-14.04-server-cloudimg           Ubuntu 14.04 LTS (Trusty Tahr)  Cloud image     2\r\nfernandoacorreia/ubuntu-14.04-oracle-java-1.7   Docker image with Ubuntu 14.04 and Oracle ...   1                                       [OK]\r\nmist/ubuntu-14.04                               Ubuntu 14.04 image with openssh server and...   1\r\nsimphonyproject/ubuntu-14.04-remote             LEGACY. Ubuntu 14.04 with Remote Access Su...   1                                       [OK]\r\n```\r\n\r\n|     |     |\r\n| --- | --- |\r\n|   NAME  |   镜像仓库源的名称  |\r\n|   DESCRIPTION  |   镜像的描述  |\r\n|OFFICIAL|是否docker官方发布|\r\n\r\n\r\n----------\r\n\r\n### 运行镜像\r\n```\r\nroot@pinsily:~# docker run hello-world\r\n```\r\n\r\n\r\n----------\r\n### 更新镜像\r\n可以将我们修改后的镜像以副本形式上传\r\n更新之前，需要创建一个容器来进行交互，关于容器的记录一起放到下一节讲\r\n```\r\nroot@pinsily:~# docker run -t -i ubuntu:14.04 /bin/bash\r\nroot@f34700df208e:/#\r\n```\r\n创建了一个交互式进程，进入了容器当中（@后面的表示容器 ID），在其中进行软件库更新\r\n```\r\nroot@f34700df208e:/# apt-get update\r\n```\r\n\r\n使用 `exit` 命令退出容器，记下容器 ID\r\n\r\n提交副本\r\n\r\n```\r\nroot@pinsily:~# docker commit -m=\"updated\" -a=\"pinsily\" f34700df208e pinsily/ubuntu:14.04_v2\r\nsha256:be2e8bc7629efb487cacaf541fddd8dccaec29be05739fa33743cfb3385f3551\r\n```\r\n\r\n|     |     |\r\n| --- | --- |\r\n|  -m |   提交的描述信息  |\r\n| -a |   镜像作者  |\r\n|f34700df208e |   容器ID |\r\n|   pinsily/ubuntu:14.04_v2  |  目标镜像名   |\r\n\r\n可以查看到我们新提交的镜像，可以以此来创建容器使用\r\n\r\n![][3]\r\n\r\n\r\n----------\r\n\r\n### 添加镜像标签\r\n对上面更新的镜像添加一个 hello 标签\r\n```\r\nroot@pinsily:~# docker tag be2e8bc7629e pinsily/ubuntu:hello\r\n```\r\n![][4]\r\n\r\n\r\n----------\r\n\r\n\r\n\r\n \r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/268198-106.jpg\r\n  [2]: http://www.runoob.com/docker/docker-tutorial.html\r\n  [3]: http://owgxfd8jv.bkt.clouddn.com/1508577954564.jpg\r\n  [4]: http://owgxfd8jv.bkt.clouddn.com/1508578299875.jpg','ClaretCup.jpg','2017-10-23 01:44:00','2018-06-26 22:56:46','p','当使用的镜像文件本地不存在时，则从远程镜像库中下载',8,0,0,'pinsily',2),(15,'docker 笔记(3) -- 容器','----------\r\n\r\n![][1]\r\n<center>面壁者，我是你的破壁人</center>\r\n\r\n----------\r\n###  参考\r\n[菜鸟教程 -- docker][2]\r\n\r\n----------\r\n\r\n### 额\r\n容器可以看成是虚拟机软件，是用来运行镜像的\r\n\r\n\r\n----------\r\n\r\n### Docker 客户端\r\ndocker 客户端既是在 bash 下使用 docker 相关的命令，比如之前所记录的 `docker images` 等命令，直接键入 docker 能够看到所有命令，可以通过命令 `docker command --help` 更深入的了解\r\n\r\n![][3]\r\n\r\n![][4]\r\n\r\n\r\n----------\r\n\r\n### 查看正在运行的容器\r\n```\r\nroot@pinsily:~# docker ps\r\n```\r\n\r\n\r\n----------\r\n### 查看网络端口\r\n容器和主机之间会有一个端口映射实现网络连接\r\n```\r\nroot@pinsily:~# docker port ID\r\n```\r\n也可以使用 `docker ps`得到端口映射\r\n\r\n\r\n----------\r\n\r\n### 创建容器\r\n#### 直接镜像的程序\r\n```\r\nroot@pinsily:~# docker run ubuntu:14.04 /bin/echo \"Hello world\"\r\nHello world\r\n```\r\n\r\n#### 交互式容器\r\n`-i`表示可以进行交互，`-t`表示建立虚拟终端，可以并在一起使用`-it`,使用 `exit` 退出\r\n```\r\nroot@pinsily:~# docker run  -i -t ubuntu:14.04 /bin/bash\r\nroot@6c15420e7512:/#\r\n```\r\n\r\n#### 使用后台模式\r\n使用 `-d`实现，打印出容器 ID（前12位可以直接使用），但是容器一直在后台运行着，可以使用`docker ps`确认\r\n```\r\nroot@pinsily:~# docker run -d ubuntu:14.04 /bin/sh -c \"while true; do echo hello world; sleep 1; done\"\r\nb8d8bbb1d21af5d7d184ead1cefd618ca867847deb1c2f6470006cf3ec9c7535\r\n```\r\n\r\n使用 `docker logs name/id` 查看上面的运行结果\r\n\r\n![][5]\r\n\r\n#### 终止容器\r\n使用 `docker stop name/id` \r\n```\r\nroot@pinsily:~# docker stop b8d8bbb1d21a\r\nb8d8bbb1d21a\r\n\r\n```\r\n\r\n----------\r\n\r\n### 总结\r\n容器的基本使用就记录这些常用的了，留当一个学习的记录，之后如果有具体应用的话在再接再厉，可能会用到 python，Nginx 这些网络和编程软件安装的可能\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/1508641911197.jpg\r\n  [2]: http://www.runoob.com/docker/docker-tutorial.html\r\n  [3]: http://owgxfd8jv.bkt.clouddn.com/1508641911578.jpg\r\n  [4]: http://owgxfd8jv.bkt.clouddn.com/1508641911578.jpg\r\n  [5]: http://owgxfd8jv.bkt.clouddn.com/1508641242350.jpg','MooseLakeGrass_NsliWkX.jpg','2017-10-24 01:48:00','2018-06-28 01:35:46','p','容器可以看成是虚拟机软件，是用来运行镜像的',12,0,0,'pinsily',2),(16,'linux -- 日志重定向到文本','---\r\n\r\n![][1]\r\n\r\n<p><center>对于你，我又何止一句喜欢～ ——竹马钢琴师</center></p>\r\n\r\n------\r\n### 说明\r\n在使用Hadoop的使用，输出的日志太多，于是想将其重定向到日志文件中，但是因为忽略了一个细节问题，一直还是在shell中输出日志，找了许久才找到了解决的方法\r\n\r\n----------\r\n### 解决\r\n\r\n``` shell\r\nhadoop jar *.jar $mrClass > mr.log 2>&1\r\n```\r\n\r\n这里的 `2>&1` 很关键，没有的话就无法在mr.log中看到hadoop jar执行过程的内容输出了\r\n\r\n1代表标准输出,2代表标准错误\r\n\r\n那么命令后面跟 2>&1意思就是把命令执行的标准错误和标准输出都重定向到mr.log里面去.\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/SatelliteGlades.jpg','happychildday.jpg','2017-05-30 09:53:00','2018-06-27 02:46:37','p','忽略了一个细节问题',4,0,0,'pinsily',3),(17,'linux -- tar.bz2 文件解压','---\r\n\r\n![][1]\r\n\r\n<p><center>苦难算什么，我本来，就喜欢走上阿修罗之路。 ——海贼王</center></p>\r\n\r\n------\r\n### 解压命令\r\n\r\n假设文件名为 test.tar.bz2\r\n\r\n```bash\r\n$ bzip2 -d test.tar.bz2\r\n$ tar -xvf test.tar\r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/10-23733.jpg','Mariachis.jpg','2018-03-29 19:56:00','2018-06-26 22:15:02','p','常见的解压缩命令',5,0,0,'pinsily',3),(19,'linux -- 后台管理程序 supervisor','----------\r\n![][1]\r\n\r\n<center><p>记忆就像是握在手中的水，不管你握紧还是摊开都会慢慢的消失</p></center>\r\n\r\n---------\r\n### 前言\r\n搭建 ss 的时候发现把 putty 关闭之后就关掉了进程，发现是没有在后台运行，就找了相关的进程管理，发现 supervisor 还不错，就使用了\r\n\r\n查了挺多资料，整合成一份可以使用的\r\n\r\nsupervisor 是用 Python 开发的一套通用的进程管理程序，能将一个普通的命令行进程变为后台 daemon，并监控进程状态，异常退出时能自动重启\r\n\r\n\r\n----------\r\n### 安装\r\n```\r\n$ apt-get install supervisor\r\n```\r\nsupervisor 安装完成后会生成三个执行程序：`supervisortd`、`supervisorctl`、`echo_supervisord_conf`，分别是 supervisor 的守护进程服务（用于接收进程管理命令）、客户端（用于和守护进程通信，发送管理进程的指令）、生成初始配置文件程序\r\n\r\n----------\r\n### 生成初始配置文件\r\n初始的配置文件可能是已经有的，不需要再创建\r\n```\r\n$ mkdir /etc/supervisor\r\n$ echo_supervisord_conf > /etc/supervisor/supervisord.conf\r\n```\r\n\r\n\r\n----------\r\n### 添加进程管理\r\n这里以 ss 为例\r\n```\r\n$ vim /etc/supervisor/supervisord.conf\r\n```\r\n\r\n```\r\n[program:shadowsocks]\r\ncommand=/etc/init.d/shadowsocks restart\r\nautostart=true\r\nautorestart=true\r\nuser=root\r\nlog_stderr=true\r\nlogfile=/var/log/shadowsocks.log\r\n```\r\n\r\n\r\n----------\r\n### 启动\r\n```\r\nsupervisord -c /etc/supervisor/supervisord.conf\r\n```\r\n\r\n\r\n----------\r\n### 管理\r\n```\r\nsupervisorctl stop shadowsocks\r\nsupervisorctl start shadowsocks\r\nsupervisorctl restart shadowsocks\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/%E8%A7%86%E8%A7%89%20-%2016.jpg','Kiasma.jpg','2018-01-31 05:04:00','2018-06-28 02:18:32','p','搭建 ss 的时候发现把 putty 关闭之后就关掉了进程，发现是没有在后台运行，就找了相关的进程管理',5,0,0,'pinsily',3),(20,'linux -- 常用命令含义','----------\r\n\r\n![][1]\r\n\r\n<center><p>在那过去未来，时光两端，青史之外，记忆之前，我可曾，见过你</p></center>\r\n\r\n---------\r\n### 前言\r\n主要记录日常会使用到的命令，偏门的遇上再添加\r\n\r\n----------\r\n### 命令\r\n\r\n| 命令    |  原文   |\r\n| --- | --- |\r\n|   ls  | list    |\r\n|   cd   | change directory    |\r\n|   su  | switch user    |\r\n|   pwd  |  print work directory   |\r\n|   ps  |  process status   |\r\n|   df  |  disk free   |\r\n|   rmdir  |  remove directory   |\r\n|   rm  |  remove   |\r\n|   cat  | concatenate    |\r\n|   ln -s  |  link -soft   |\r\n|   mkdir  | make directory    |\r\n|   man  |  manual   |\r\n|   pwd | print working directory    |\r\n|   mv  |  move   |\r\n|   cp  |  copy   |\r\n|   chown  | change owner    |\r\n|   chmod  | change mode    |\r\n|   bin  | binaries    |\r\n|   etc  | etcetera    |\r\n|   lib  |  library   |\r\n|   proc  | processes    |\r\n|   sbin  | superuser binaries    |\r\n|   tmp  |  temporary   |\r\n|   usr  |  unix shared resources   |\r\n|   var  | variable    |\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/343210-106.jpg','DUAN.jpg','2018-01-20 10:05:00','2018-07-04 05:47:51','p','主要记录日常会使用到的命令，偏门的遇上再添加',12,0,0,'pinsily',3),(21,'linux -- 环境变量 path','----------\r\n\r\n![][1]\r\n\r\n<center><p>A structure this pretty just had to exist</p></center>\r\n\r\n----------\r\n### 环境变量的查看\r\n\r\n```\r\nroot@pinsily:~# echo $PATH\r\n```\r\n\r\n```\r\n/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games\r\n```\r\n\r\n更详细的信息\r\n```\r\nroot@pinsily:~# export\r\n```\r\n\r\n\r\n----------\r\n### 环境变量的添加\r\n#### 临时添加\r\n```Shell\r\nroot@pinsily:~# PATH=\"$PATH\":/NEW_PATH\r\n```\r\n关闭终端后会失效\r\n\r\n#### 永久添加\r\n- 对所有用户生效\r\n```\r\nroot@pinsily:~# sudo vim /etc/profile\r\n```\r\n在末尾添加上以下语句\r\n```\r\nexport PATH=\"/NEW_PATH:$PATH\"\r\n```\r\n执行立即生效语句\r\n```\r\npinsily@zhu:~$ source /etc/profile\r\n```\r\n- 对当前用户生效\r\n```\r\nroot@pinsily:~# vim ~/.bashrc\r\n```\r\n\r\n```\r\nexport PATH=\"/NEW_PATH:$PATH\"\r\n```\r\n\r\n\r\n```\r\n# 生效\r\nsource ~/.bashrc\r\n```\r\n\r\n----------\r\n#### **环境变量的删除**\r\n使用 命令 `unset PATH` 清空 PATH 变量\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/343096-106.jpg','MaryLouWilliams.jpg','2018-01-20 10:06:00','2018-07-04 01:26:19','p','记录关于环境变量的修改',10,0,0,'pinsily',3),(22,'linux -- swap file “*.swp”already exists！','---------\r\n\r\n\r\n![][1]\r\n\r\n<center><p>慕言，思慕的慕，无言以对的言，我的名字</p></center>\r\n\r\n----------\r\n### 问题\r\n在使用 vim 的时候，出现了以下问题\r\n\r\n![][2]\r\n\r\n\r\n使用vim编辑文件实际是先 copy 一份临时文件并映射到内存给你编辑， 编辑的是临时文件， 当执行：w 后才保存临时文件到原文件，执行：q 后才删除临时文件。\r\n\r\n每次启动检索是否有临时文件， 有则询问如何处理，就会出现如上情景\r\n\r\n----------\r\n### 解决\r\n在文件目录下使用 `ls -a` 会看到交换文件，将它删除即可\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/341191-106.jpg\r\n  [2]: http://owgxfd8jv.bkt.clouddn.com/1512980175813.jpg','ClaretCup_dN5fppk.jpg','2017-12-11 10:08:00','2018-07-02 23:30:45','p','使用vim编辑文件实际是先 copy 一份临时文件并映射到内存给你编辑， 编辑的是临时文件',9,0,0,'pinsily',3),(23,'linux -- ls 命令','----------\r\n\r\n![][1]\r\n\r\n<center><p>从此故乡只有冬夏，再无春秋</p></center>\r\n\r\n---------\r\n### emmmm\r\n> ls 是 list 的缩写，在 linux 中用于列出文件和目录,在这里只是记录常用的\r\n\r\n----------\r\n### 用法\r\n- 直接使用\r\n> 列出目录下的所有文件或文件夹\r\n```\r\nroot@pinsily:~# ls\r\npinsily_1  pinsily_2  pinsily_3  test.html\r\n```\r\n\r\n- 获得详细信息\r\n> 使用参数 `-l`\r\n```shell\r\nroot@pinsily:~# ls -l\r\ntotal 16\r\ndrwxr-xr-x 2 root root 4096 Dec 15 15:55 pinsily_1\r\ndrwxr-xr-x 2 root root 4096 Dec 15 15:55 pinsily_2\r\ndrwxrwxrwx 2 root root 4096 Dec 15 15:55 pinsily_3\r\n-rw-r--r-- 1 root root   14 Dec 11 16:12 test.html\r\n```\r\n\r\n|   列数  |   解释  |\r\n| --- | --- |\r\n|   1  |  第一个字母：`d`表示目录，`-`表示文件，`l`表示链接    |\r\n|   1   |   第2-10个字母：三位一组，分别表示文件所有者、所有组、其他用户的权限  |\r\n|   2  |   数字表示有多少个链接指向这个文件  |\r\n|   3  |    文件的所有者 |\r\n|   4  |   文件的所有组  |\r\n|  5   |  文件大小，字节数   |\r\n|   6  |    文件最后的修改时间 |\r\n|   7  |  文件名或者目录名   |\r\n\r\n- 人性化展示信息\r\n> 使用参数`-h`，比如可以把上面的字节数改为我们熟悉的单位\r\n```\r\nroot@pinsily:~# ls -lh\r\ntotal 16K\r\ndrwxr-xr-x 2 root root 4.0K Dec 15 15:55 pinsily_1\r\ndrwxr-xr-x 2 root root 4.0K Dec 15 15:55 pinsily_2\r\ndrwxrwxrwx 2 root root 4.0K Dec 15 15:55 pinsily_3\r\n-rw-r--r-- 1 root root   14 Dec 11 16:12 test.html\r\n```\r\n\r\n- 隐藏文件\r\n> 在 linux 中，以`.`开头的文件都是隐藏文件，可以使用参数`-a`打印\r\n```\r\nroot@pinsily:~# ls -al\r\ntotal 60\r\ndrwx------  8 root root 4096 Dec 15 16:08 .\r\ndrwxr-xr-x 23 root root 4096 Dec  7 11:12 ..\r\n-rw-------  1 root root 1157 Dec 11 16:43 .bash_history\r\n-rw-r--r--  1 root root 3106 Feb 20  2014 .bashrc\r\ndrwx------  3 root root 4096 Aug 24 20:53 .cache\r\n-rw-------  1 root root    0 Dec  7 11:32 .mysql_history\r\n-rw-r--r--  1 root root    0 Dec 15 16:08 .pinsily\r\ndrwxr-xr-x  2 root root 4096 Dec 15 15:55 pinsily_1\r\ndrwxr-xr-x  2 root root 4096 Dec 15 15:55 pinsily_2\r\ndrwxrwxrwx  2 root root 4096 Dec 15 15:55 pinsily_3\r\ndrwxr-xr-x  2 root root 4096 Aug 24 20:53 .pip\r\n-rw-r--r--  1 root root  140 Feb 20  2014 .profile\r\n-rw-r--r--  1 root root   64 Aug 24 20:53 .pydistutils.cfg\r\ndrwx------  2 root root 4096 Dec  7 10:59 .ssh\r\n-rw-r--r--  1 root root   14 Dec 11 16:12 test.html\r\n-rw-------  1 root root 4215 Dec 11 16:43 .viminfo\r\n```\r\n\r\n- 按文件大小排序\r\n> 使用参数`-S`,按文件大小从大到小排序\r\n```\r\nroot@pinsily:~# ls -lhS\r\ntotal 64K\r\n-rw-r--r-- 1 root root  51K Dec 15 16:18 test.html\r\ndrwxr-xr-x 2 root root 4.0K Dec 15 16:17 pinsily_1\r\ndrwxr-xr-x 2 root root 4.0K Dec 15 15:55 pinsily_2\r\ndrwxrwxrwx 2 root root 4.0K Dec 15 15:55 pinsily_3\r\n\r\n```\r\n\r\n- 输出反转\r\n> 使用参数 `-r`,比如可以将排序从小到大输出\r\n```\r\nroot@pinsily:~# ls -lhSr\r\ntotal 64K\r\ndrwxrwxrwx 2 root root 4.0K Dec 15 15:55 pinsily_3\r\ndrwxr-xr-x 2 root root 4.0K Dec 15 15:55 pinsily_2\r\ndrwxr-xr-x 2 root root 4.0K Dec 15 16:17 pinsily_1\r\n-rw-r--r-- 1 root root  51K Dec 15 16:18 test.html\r\n```\r\n\r\n- 只列出目录条目\r\n> 使用参数 `-d`,不过后面得加上参考(通配符)，这个可以自己定\r\n```\r\nroot@pinsily:~# ls -d */\r\npinsily_1/  pinsily_2/  pinsily_3/\r\n```\r\n-- ls 版本\r\n> 使用参数 `--version`\r\n```\r\nroot@pinsily:~# ls --version\r\nls (GNU coreutils) 8.21\r\nCopyright (C) 2013 Free Software Foundation, Inc.\r\nLicense GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.\r\nThis is free software: you are free to change and redistribute it.\r\nThere is NO WARRANTY, to the extent permitted by law.\r\n\r\nWritten by Richard M. Stallman and David MacKenzie.\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/248913-106.jpg','MooseLakeGrass_YDGOj6B.jpg','2017-12-15 10:11:00','2018-07-04 13:23:17','p','ls 是 list 的缩写，在 linux 中用于列出文件和目录,在这里只是记录常用的',11,0,0,'pinsily',3),(24,'linux -- 修改主机名','----------\r\n\r\n![][1]\r\n\r\n<center><p>你永远是我唯爱旅行中名为秘密的起点站</p></center>\r\n\r\n----------\r\n### 序\r\n每次新装的 linux 系统，计算机名都很长，网上找了修改的方法\r\n\r\n![][2]\r\n\r\n----------\r\n### 方法\r\n\r\n\r\n1. 修改 hostname 文件\r\n```\r\nvim /etc/hostname\r\n```\r\n将内容删掉改成自己的计算机名\r\n\r\n2. 修改 hosts 文件\r\n\r\n```\r\nvim /etc/hosts\r\n```\r\n在 localhost 下添加一行数据，本地ip+用户名\r\n```\r\n127.0.0.1       localhost\r\n127.0.0.1       pinsily\r\n```\r\n\r\n修改好后重启系统即可，还没有找到不重启就生效文件的方法，暂时就这样先了\r\n\r\n![][3]\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/341373-106.jpg\r\n  [2]: http://owgxfd8jv.bkt.clouddn.com/1512615869316.jpg\r\n  [3]: http://owgxfd8jv.bkt.clouddn.com/1512616512864.jpg','10-87376.jpg','2017-12-07 10:14:00','2018-07-04 17:17:44','p','每次新装的 linux 系统，计算机名都很长，网上找了修改的方法',12,0,0,'pinsily',3),(25,'nginx -- 403 forbidden 权限问题','----------\r\n\r\n![][1]\r\n\r\n<center><p>奚者为奴，怜我奚儿，囚于闺阁囹圄，终不得见世间川峦，人生百态</p></center>\r\n\r\n---------\r\n### 前言\r\n> 403 Forbidden 不仅仅只是权限问题导致的，还有其他问题，这里仅仅解决权限问题\r\n\r\n----------\r\n### 用户问题\r\n可以直接修改所属用户为 `root`，nginx 默认是 `www-data` 用户，如果需要保险的话，可以新建 `www-data` 用户，然后将文件所属用户改为这个即可，这里直接使用 `root` 用户\r\n```\r\nvim /etc/nginx/nginx.conf\r\n```\r\n```\r\n# 在文件最顶端修改\r\nuser root\r\n```\r\n\r\n\r\n----------\r\n### 文件访问权限\r\n也可以直接将目录的权限通过 `chmod +755 dirname` 修改成可访问的\r\n\r\n但是必须注意的是，文件目录不可以放在父目录为 `/root/` 的目录下，不然修改了是无效的\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/%E5%8A%A8%E6%BC%AB%20-%203.jpg','NamibFace.jpg','2018-02-18 10:15:00','2018-07-04 23:13:21','p','403 Forbidden 不仅仅只是权限问题导致的，还有其他问题，这里仅仅解决权限问题',12,0,0,'pinsily',3),(26,'nginx - nginx:[error] open() \"/run/nginx.pid\" failed','----------\r\n![][1]\r\n\r\n<center>是我能够对你做的最自私的事</center>\r\n\r\n----------\r\n### 问题\r\n在重启 Nginx 之后重新加载配置文件 `nginx -s reload`,报了下面的错误\r\n```\r\nroot@pinsily:~# nginx -s reload\r\nnginx: [error] open() \"/run/nginx.pid\" failed (2: No such file or directory)\r\n```\r\n\r\n----------\r\n### 解决\r\n使用 Nginx `-c` 的参数指定 nginx.conf 文件的位置\r\n```\r\nroot@pinsily:~# nginx -c /etc/nginx/nginx.conf\r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/102493-106.jpg','LongtailedWidowbird.jpg','2017-11-13 10:16:00','2018-06-28 00:01:28','p','在重启 Nginx 之后重新加载配置文件 `nginx -s reload`,报了下面的错误',6,0,0,'pinsily',3),(27,'小知识 -- 彼得潘症候群','----------\r\n![][1]\r\n\r\n<center><p>如果你以为那么简单就可以把我甩掉，就大错特错了</p></center>\r\n\r\n----------\r\n> 维基百科：[彼得潘症候群][2]\r\n\r\n\r\n彼得潘症候群（Peter Pan syndrome）是个流行的心理学名词，用来叙述一个在社会未成熟的成人。这个词汇通常用于一般人，但也用于一些心理学的专业人士在普及心理学上的描述。这个词汇是来自丹·凯利（Dan Kiley）于1983年出版的书《彼得潘症候群：不曾长大的男人》（The Peter Pan Syndrome: Men Who Have Never Grown Up）。丹·凯利也写了一本伙伴书《温蒂穷境》（The Wendy Dilemma），于1984年出版。精神疾病诊断与统计手册并没有列入“彼得潘症候群”这个疾病，而美国心理学会（American Psychiatric Association）并没有承认这是一种心理疾病。应要归类可分入依赖性人格疾患。深受此症困扰的人多半会有逃避大多数形式上的责任，从事一些不成熟的举动，且仍会眷恋其青少年时期的时光，会设法不断留住青春。\r\n\r\n该症候群虽非精神医学正式的诊断，却普遍存在于因家庭、婚姻、社交问题寻求咨商辅导的个案中，患者也往往不自觉。近来，更有学者以新的英文单字“Kidult”，即kid（小孩）与adult（成人）的合体，称呼这些具儿童心态的成年人。\r\n\r\n专家指出，当事者常见的特征约略如下：\r\n\r\n\r\n1. 不负责任：表现任性、散漫，过于自我中心，出了差错老爱怪罪别人。\r\n\r\n\r\n2. 缺乏自信：恐惧失败，不敢勇于任事，面对挑战会找借口逃避。\r\n\r\n\r\n3. 依赖心强：害怕孤单、寂寞，希望随时有人可以帮忙，满足任何需求。\r\n\r\n\r\n4. 难于坚持：挫折忍受度低，行事稍有不顺或遭批评便易情绪化或放弃。\r\n\r\n\r\n5. 关系障碍：与异性交往到需给予承诺时，便会临阵脱逃，故不时更换伴侣，且对象越来越年轻，藉以缓解被要求结婚组织家庭的压力。\r\n\r\n6. 其他：穿着打扮如青少年，与本身年纪有所出入；好奇心强，爱尝试新奇事物，喜欢热闹气氛等。\r\n\r\n患有该症候群者，或许习惯随心所欲，在职场或人际互动上易受挫，总觉得遭到团体排斥，凡事格格不入，故换工作如家常便饭。即使成家立业，事不关己的特质也常让配偶负担沉重，仿佛在照顾另一个孩子般，造成彼此关系恶化\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/341134-105.jpg\r\n  [2]: https://zh.wikipedia.org/wiki/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%97%87%E5%80%99%E7%BE%A4','HollowRock.jpg','2018-06-20 10:18:00','2018-07-02 00:02:21','p','彼得潘症候群（Peter Pan syndrome）是个流行的心理学名词，用来叙述一个在社会未成熟的成人。',29,0,0,'pinsily',4),(28,'css -- 颜色代码对照表','----------\r\n\r\n![][1]\r\n\r\n\r\n<center><p>世间事，除了生死，哪一件事不是闲事</p></center>\r\n\r\n----------\r\n### 对照表\r\n<table border=\"0\">\r\n<tbody>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffffff\">FFFFFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#dddddd\">#DDDDDD</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#aaaaaa\">#AAAAAA</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#888888\">#888888</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#666666\">#666666</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#444444\">#444444</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#000000\">#000000</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffb7dd\">#FFB7DD</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff88c2\">#FF88C2</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff44aa\">#FF44AA&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff0088\">#FF0088&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#c10066\">#C10066&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#a20055\">#A20055&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#8c0044\">#8C0044&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffcccc\">#FFCCCC</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff8888\">#FF8888</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff3333\">#FF3333&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff0000\">#FF0000&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#cc0000\">#CC0000&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#aa0000\">#AA0000&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#880000\">#880000&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffc8b4\">#FFC8B4</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffa488\">#FFA488</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff7744\">#FF7744&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff5511\">#FF5511&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#e63f00\">#E63F00&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#c63300\">#C63300&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#a42d00\">#A42D00&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffddaa\">#FFDDAA</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffbb66\">#FFBB66</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffaa33\">#FFAA33</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff8800\">#FF8800&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ee7700\">#EE7700&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#cc6600\">#CC6600&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#bb5500\">#BB5500&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffee99\">#FFEE99</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffdd55\">#FFDD55</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffcc22\">#FFCC22</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffbb00\">#FFBB00&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ddaa00\">#DDAA00&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#aa7700\">#AA7700&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#886600\">#886600&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffffbb\">#FFFFBB</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffff77\">#FFFF77</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffff33\">#FFFF33</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffff00\">#FFFF00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#eeee00\">#EEEE00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#bbbb00\">#BBBB00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#888800\">#888800</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#eeffbb\">#EEFFBB</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ddff77\">#DDFF77</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ccff33\">#CCFF33</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#bbff00\">#BBFF00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#99dd00\">#99DD00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#88aa00\">#88AA00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#668800\">#668800</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ccff99\">#CCFF99</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#bbff66\">#BBFF66</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#99ff33\">#99FF33</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#77ff00\">#77FF00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#66dd00\">#66DD00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#55aa00\">#55AA00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#227700\">#227700</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#99ff99\">#99FF99</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#66ff66\">#66FF66</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#33ff33\">#33FF33</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00ff00\">#00FF00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00dd00\">#00DD00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00aa00\">#00AA00</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#008800\">#008800</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#bbffee\">#BBFFEE</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#77ffcc\">#77FFCC</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#33ffaa\">#33FFAA</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00ff99\">#00FF99</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00dd77\">#00DD77</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00aa55\">#00AA55</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#008844\">#008844</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#aaffee\">#AAFFEE</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#77ffee\">#77FFEE</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#33ffdd\">#33FFDD</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00ffcc\">#00FFCC</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00ddaa\">#00DDAA</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00aa88\">#00AA88</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#008866\">#008866</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#99ffff\">#99FFFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#66ffff\">#66FFFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#33ffff\">#33FFFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00ffff\">#00FFFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00dddd\">#00DDDD</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00aaaa\">#00AAAA</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#008888\">#008888</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#cceeff\">#CCEEFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#77ddff\">#77DDFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#33ccff\">#33CCFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#00bbff\">#00BBFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#009fcc\">#009FCC</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#0088a8\">#0088A8</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#007799\">#007799</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ccddff\">#CCDDFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#99bbff\">#99BBFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#5599ff\">#5599FF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#0066ff\">#0066FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#0044bb\">#0044BB&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#003c9d\">#003C9D&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#003377\">#003377&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ccccff\">#CCCCFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#9999ff\">#9999FF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#5555ff\">#5555FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#0000ff\">#0000FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#0000cc\">#0000CC&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#0000aa\">#0000AA&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#000088\">#000088&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ccbbff\">#CCBBFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#9f88ff\">#9F88FF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#7744ff\">#7744FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#5500ff\">#5500FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#4400cc\">#4400CC&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#2200aa\">#2200AA&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#220088\">#220088&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#d1bbff\">#D1BBFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#b088ff\">#B088FF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#9955ff\">#9955FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#7700ff\">#7700FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#5500dd\">#5500DD&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#4400b3\">#4400B3&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#3a0088\">#3A0088&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#e8ccff\">#E8CCFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#d28eff\">#D28EFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#b94fff\">#B94FFF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#9900ff\">#9900FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#7700bb\">#7700BB&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#66009d\">#66009D&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#550088\">#550088&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#f0bbff\">#F0BBFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#e377ff\">#E38EFF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#d93eff\">#E93EFF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#cc00ff\">#CC00FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#a500cc\">#A500CC&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#7a0099\">#7A0099&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#660077\">#660077&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ffb3ff\">#FFB3FF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff77ff\">#FF77FF</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff3eff\">#FF3EFF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#ff00ff\">#FF0&nbsp;0FF&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#cc00cc\">#CC00CC&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#990099\">#990099&nbsp;</td>\r\n<td height=\"30\" width=\"95\" bgcolor=\"#770077\">#770077&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/341396-106.jpg','HenningsvaerFootball.jpg','2017-12-10 10:22:00','2018-07-04 16:54:12','p','世间事，除了生死，哪一件事不是闲事',11,0,0,'pinsily',5),(29,'css -- Button 鼠标箭头变手势','---\r\n\r\n![][1]\r\n\r\n<p><center>镜中的雪越发耀眼，活像燃烧的火焰。 ——雪国</center></p>\r\n\r\n------\r\n### 说明\r\n按钮默认是鼠标悬停的时候还是箭头，对交互不明显\r\n\r\n\r\n----------\r\n### 修改\r\n在button 样式中添加\r\n```css\r\nbutton {\r\n    /* ... */\r\n    cursor:pointer; \r\n    /* ... */\r\n}\r\n```\r\n\r\n--------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/HollowRock.jpg','TinyLadybird.jpg','2018-05-18 10:24:00','2018-07-05 01:12:36','p','按钮默认是鼠标悬停的时候还是箭头，对交互不明显',10,0,0,'pinsily',5),(30,'css -- img 等比例自动缩放','---\r\n\r\n![][1]\r\n\r\n<p><center>人生如逆旅，我亦是行人。 ——临江仙</center></p>\r\n\r\n------\r\n### 说明\r\n使得 img 随着父元素的大小自动等比例缩放\r\n\r\n\r\n----------\r\n### 修改\r\n```css\r\nimg{  \r\n    /* ... */\r\n    width: auto;  \r\n    height: auto;  \r\n    max-width: 100%;  \r\n    max-height: 100%;   \r\n    /* ... */\r\n}  \r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/GreatGhost.jpg','PKUCHINA.jpg','2018-05-18 10:25:00','2018-06-27 02:46:40','p','使得 img 随着父元素的大小自动等比例缩放',5,0,0,'pinsily',5),(31,'python -- 去掉字符串的空白字符','---\r\n![][1]\r\n\r\n<p><center>且行善举，莫问前途。 ——浮生物语3</center></p>\r\n\r\n\r\n----------\r\n### 参考\r\n> [https://blog.csdn.net/drbing/article/details/50891172][2]\r\n\r\n------\r\n### 方法\r\n1. 使用 string 自带方法\r\n\r\n``` python\r\nstr = \" pinsily is someome \"\r\n\r\n# 去掉两边的空白 \"pinsily is someome\"\r\nprint(str.strip()) \r\n\r\n# 去掉左边的空白 \"pinsily is someome \"\r\nprint(str.lstrip())  \r\n\r\n# 去掉右边的空白 \" pinsily is someome\"\r\nprint(str.rstrip())     \r\n```\r\n\r\n\r\n2. 使用 re 表达式\r\n\r\n``` python\r\nstr = \" pinsily is someome \"\r\n\r\nimport re\r\n\r\n# 去掉字符串中的所有空格, 返回新字符串\r\nre.sub(\'\\s\', \'\', str)\r\n```\r\n\r\nre.sub() 方法也可以用在删除其他字符上，比如：\r\n\r\n``` python\r\n删除所有空白字符及单双引号\r\nre.sub([\'\\\"\',\'\\\'\',\'\\s\'],\'\',str)  \r\n```\r\n\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/10-18818.jpg\r\n  [2]: https://blog.csdn.net/drbing/article/details/50891172','ConcreteDinosaurs.jpg','2018-07-04 14:50:00','2018-07-05 12:25:18','p','且行善举，莫问前途。 ——浮生物语3',2,0,0,'pinsily',6),(32,'python -- 判断 list 是否为父子集关系','---\r\n\r\n![][1]\r\n\r\n<p><center>心有所愿，便是值得。 ——花火</center></p>\r\n\r\n------\r\n### 说明\r\n list1 和 list2 两个 list ，想要得到list1是不是包含 list2 （是不是其子集 )\r\n\r\n\r\n----------\r\n### 判断\r\n\r\n``` python\r\na = [1,2]  \r\nb = [1,2,3]  \r\nc = [0, 1]  \r\n  \r\nset(b) > set(a)  \r\nset(b) > set(c)   \r\n\r\n# True  \r\n# False  \r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/TopDam.jpg','SallyRideEarthKAM.jpg','2018-07-03 14:42:00','2018-07-04 19:56:06','p','list1 和 list2 两个 list ，想要得到list1是不是包含 list2 （是不是其子集 )',4,0,0,'pinsily',6),(33,'python -- 均匀分割字符串','---\r\n\r\n![][1]\r\n\r\n<p><center>明天的事，交给明天的我</center></p>\r\n\r\n------\r\n### 参考\r\n> [https://segmentfault.com/q/1010000002615925][2]\r\n\r\n\r\n----------\r\n### 说明\r\n遇到了需要使用 k-shingle 算法，想到了直接使用 Python 的字符串分割，比如字符串\"absdgjael\",转换成 2-kingle 为 {\"ab\", \"sd\", \"gj\", \"ae\", \"l\"},不满整得直接单独放置\r\n\r\n\r\n----------\r\n### 实现\r\n```python\r\ns = \'absdgjael\'\r\n    n = 2\r\n    print([s[i:i+n] for i in xrange(0, len(s), n)])\r\n    #[\"ab\", \"sd\", \"gj\", \"ae\", \"l\"]\r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/Grainrain.jpg\r\n  [2]: https://segmentfault.com/q/1010000002615925','10-55009_Z4mWkqm.jpg','2018-07-02 14:43:00','2018-07-04 18:34:50','p','遇到了需要使用 k-shingle 算法，想到了直接使用 Python 的字符串分割，比如字符串\"absdg',2,0,0,'pinsily',6),(34,'python -- 调用 shell 命令','---\r\n\r\n![][1]\r\n\r\n<p><center>一个人想像自己不懂得的事很容易浪漫 ——沉默的大多数</center></p>\r\n\r\n------\r\n### 前言\r\n有时候写 python 脚本的时候，直接使用 shell 命令的话会事半功倍，不需要自己再另外写函数来实现\r\n\r\n参考：[https://www.jianshu.com/p/5d999a668e79][2]\r\n\r\n----------\r\n### os 模块\r\n#### system 方法\r\n> system方法会创建子进程运行外部程序，方法除了返回外部程序的运行结果，还有结束的状态码 1 或 0\r\n\r\n```shell\r\n>>> import os\r\n>>> os.system(\"echo 8\")\r\n8\r\n0\r\n```\r\n\r\n### popen 方法\r\n> popen方不仅仅返回结果，还返回一个类文件对象，通过调用该对象的read()或readlines()方法可以读取输出内容\r\n\r\n```\r\n>>> import os\r\n>>> output = os.popen(\"dir\").read()\r\n>>> output\r\n.....\r\n>>>\r\n>>> outputs = os.popen(\"dir\").readlines()\r\n>>> for line in outputs:\r\n...     print(line)\r\n```\r\n----------\r\n### commands 模块\r\n#### getoutput 方法\r\n> 这种方法同popend的区别在于popen返回的是一个类文件对象，而本方法将外部程序的输出结果当作字符串返回\r\n```python\r\n# 返回(status, output)\r\ncommands.getstatusoutput(command)      \r\n# 只返回输出结果\r\ncommands.getoutput(command)                  \r\n# 调用了getoutput，不建议使用此方法\r\ncommands.getstatus(file)\r\n```\r\n\r\n\r\n----------\r\n### subprocess 模块\r\n> subprocess 允许你去创建一个新的进程让其执行另外的程序，并与它进行通信，获取标准的输入、标准输出、标准错误以及返回码等\r\n```shell\r\n>>> import subprocess\r\n>>> subprocess.call(\"dir\", shell=True)\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/ResplendentQuetzal.jpg\r\n  [2]: https://www.jianshu.com/p/5d999a668e79','EtaAquarids.jpg','2018-07-01 14:45:00','2018-07-04 18:35:13','p','有时候写 python 脚本的时候，直接使用 shell 命令的话会事半功倍，不需要自己再另外写函数来实现',2,0,0,'pinsily',6),(35,'python -- 新建文件夹','---\r\n\r\n![][1]\r\n\r\n<p><center>曾经我眼前不见一物，如今视野中万物多彩</center></p>\r\n\r\n------\r\n### 说明\r\nPython 新建文件夹主要在 os 模块中完成\r\n\r\n----------\r\n### 相关方法\r\n- os.path.exists(path) -- 判断一个目录是否存在\r\n- os.makedirs(path) -- 多层创建目录\r\n- os.mkdir(path) -- 创建目录\r\n\r\n`makedirs(path)` 方法如果父目录不存在的条件下会先创建父目录，而 `mkdir` 没有这个功能\r\n\r\n另外，关于 window 的路径记录，由于 window 的路径是由反斜杠分割的，使用的时候需要另外增加转义字符\r\n\r\n----------\r\n### 使用\r\n```python\r\n\r\npath = \"D:\\\\Wallpaper\\\\\"\r\n\r\nif not os.path.exists(path):\r\n    os.mkdir(path)\r\n\r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/ElephantSibs.jpg','WhalePod.jpg','2018-06-30 14:46:00','2018-07-04 18:34:32','p','Python 新建文件夹主要在 os 模块中完成',2,0,0,'pinsily',6),(36,'python -- 文档字符串','---\r\n\r\n![][1]\r\n\r\n<p><center>改变的东西，一定有其意义</center></p>\r\n\r\n-------\r\n### 文档字符串定义\r\n> 在函数体的第一行，我们可以使用一对三个单引号（\'\'\'）或者一对三个双引号（\"\"\"）来定义文档字符串，文档字符串通常第一行以大写字母开头，以句号（.）结束，第二行是空行，第三行开始是详细描述\r\n\r\n> 文档字符串的作用在于能够很直观地表示出函数或者类的作用，而不用通过源代码来获知，节省使用者的精力时间\r\n\r\n\r\n----------\r\n### 与注释的区别\r\n> 虽然文档字符串使用的也是注释符，但是不同的是，注释在解释器中会直接被忽视掉，但是文档字符串可以被调用使用\r\n\r\n-------\r\n### 实例\r\n```python\r\n>>> def maxnum(x,y):\r\n...     \"\"\" get the max number between x and y.\r\n...\r\n...     x and y much be integer.\"\"\"\r\n...\r\n...     if x>y:\r\n...         return x\r\n...     else:\r\n...         return y\r\n...\r\n```\r\n\r\n#### 使用\r\n```\r\n>>> help(maxnum)\r\nHelp on function maxnum in module __main__:\r\n\r\nmaxnum(x, y)\r\n    get the max number between x and y.\r\n\r\n    x and y much be integer.\r\n\r\n>>> maxnum.__doc__\r\n\' get the max number between x and y.\\n\\n\\tx and y much be integer.\'\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/10-84895.jpg','AuroraPhotographer.jpg','2018-03-12 14:49:00','2018-07-05 10:11:00','p','在函数体的第一行，我们可以使用一对三个单引号（\'\'\'）或者一对三个双引号（\"\"\"）来定义文档字符串',2,0,0,'pinsily',6),(37,'python -- pycharm 新建文件自动填充信息','---\r\n\r\n![][1]\r\n\r\n<p><center>别忘了，你从本质上是个喜欢笑的人</center></p>\r\n\r\n-------\r\n### 前言\r\n在 py 文件中填上必要的文件信息是非常必要的，能够直观地得到相关信息\r\n\r\n\r\n----------\r\n### 设置\r\n打开 settings --> Editor --> Color Scheme --> File and Code Templates\r\n\r\n在右边找到 python script 选项，编辑框里输入相关信息\r\n```python\r\n# -*- coding: utf-8 -*-\r\n\"\"\"\r\n-------------------------------------------------\r\n   Filename：      ${NAME}\r\n   Author :        ${USER}\r\n   date：          ${DATE} ${TIME}\r\n   Description :\r\n-------------------------------------------------\r\n\"\"\"\r\n\r\nif __name__ == \'__main__\':\r\n    pass\r\n```\r\n\r\n其他相关变量模板：\r\n```\r\n${PROJECT_NAME} - 当前Project名称;\r\n\r\n ${NAME} - 在创建文件的对话框中指定的文件名;\r\n\r\n ${USER} - 当前用户名;\r\n\r\n ${DATE} - 当前系统日期;\r\n\r\n ${TIME} - 当前系统时间;\r\n\r\n ${YEAR} - 年;\r\n\r\n ${MONTH} - 月;\r\n\r\n ${DAY} - 日;\r\n\r\n ${HOUR} - 小时;\r\n\r\n ${MINUTE} - 分钟；\r\n\r\n ${PRODUCT_NAME} - 创建文件的IDE名称;\r\n\r\n ${MONTH_NAME_SHORT} - 英文月份缩写, 如: Jan, Feb, etc;\r\n\r\n ${MONTH_NAME_FULL} - 英文月份全称, 如: January, February, etc；\r\n\r\n```\r\n\r\n-------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/%E5%B0%8F%E4%B9%A6%E5%8C%A0/10-84820.jpg','BklynBrdge_Q6BlxaQ.jpg','2018-03-10 14:50:00','2018-07-05 10:09:54','p','在 py 文件中填上必要的文件信息是非常必要的，能够直观地得到相关信息',2,0,0,'pinsily',6);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tags`
--

DROP TABLE IF EXISTS `article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_tags_article_id_tag_id_9ea24d7b_uniq` (`article_id`,`tag_id`),
  KEY `article_tags_tag_id_55b93824_fk_tag_id` (`tag_id`),
  CONSTRAINT `article_tags_article_id_ebbe35ec_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `article_tags_tag_id_55b93824_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tags`
--

LOCK TABLES `article_tags` WRITE;
/*!40000 ALTER TABLE `article_tags` DISABLE KEYS */;
INSERT INTO `article_tags` VALUES (1,1,1),(2,1,2),(3,2,1),(4,3,1),(5,4,1),(6,4,3),(7,5,1),(8,5,4),(9,6,1),(10,6,5),(11,7,1),(12,7,5),(13,8,1),(14,9,1),(15,9,6),(16,10,1),(17,10,7),(18,11,1),(19,11,4),(20,12,8),(21,13,8),(22,14,8),(23,15,8),(24,16,9),(25,16,10),(26,16,11),(27,17,9),(28,17,10),(31,19,9),(32,19,10),(33,20,9),(34,20,10),(35,21,9),(36,21,10),(37,22,10),(38,22,12),(39,23,9),(40,23,10),(41,24,9),(42,24,10),(43,25,10),(44,25,13),(45,26,9),(46,26,10),(47,26,13),(48,28,14),(49,29,14),(50,30,14),(51,31,15),(52,32,15),(53,33,15),(54,34,15),(55,35,15),(56,36,15),(57,37,15);
/*!40000 ALTER TABLE `article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add group',3,'add_group'),(9,'Can change group',3,'change_group'),(10,'Can delete group',3,'delete_group'),(11,'Can view group',3,'view_group'),(12,'Can view permission',2,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add article',6,'add_article'),(22,'Can change article',6,'change_article'),(23,'Can delete article',6,'delete_article'),(24,'Can add category',7,'add_category'),(25,'Can change category',7,'change_category'),(26,'Can delete category',7,'delete_category'),(27,'Can add comment',8,'add_comment'),(28,'Can change comment',8,'change_comment'),(29,'Can delete comment',8,'delete_comment'),(30,'Can add link',9,'add_link'),(31,'Can change link',9,'change_link'),(32,'Can delete link',9,'delete_link'),(33,'Can add link category',10,'add_linkcategory'),(34,'Can change link category',10,'change_linkcategory'),(35,'Can delete link category',10,'delete_linkcategory'),(36,'Can add tag',11,'add_tag'),(37,'Can change tag',11,'change_tag'),(38,'Can delete tag',11,'delete_tag'),(39,'Can view article',6,'view_article'),(40,'Can view category',7,'view_category'),(41,'Can view comment',8,'view_comment'),(42,'Can view link',9,'view_link'),(43,'Can view link category',10,'view_linkcategory'),(44,'Can view tag',11,'view_tag'),(45,'Can add user profile',12,'add_userprofile'),(46,'Can change user profile',12,'change_userprofile'),(47,'Can delete user profile',12,'delete_userprofile'),(48,'Can view user profile',12,'view_userprofile'),(49,'Can add Bookmark',13,'add_bookmark'),(50,'Can change Bookmark',13,'change_bookmark'),(51,'Can delete Bookmark',13,'delete_bookmark'),(52,'Can add User Setting',14,'add_usersettings'),(53,'Can change User Setting',14,'change_usersettings'),(54,'Can delete User Setting',14,'delete_usersettings'),(55,'Can add User Widget',15,'add_userwidget'),(56,'Can change User Widget',15,'change_userwidget'),(57,'Can delete User Widget',15,'delete_userwidget'),(58,'Can add log entry',16,'add_log'),(59,'Can change log entry',16,'change_log'),(60,'Can delete log entry',16,'delete_log'),(61,'Can view Bookmark',13,'view_bookmark'),(62,'Can view log entry',16,'view_log'),(63,'Can view User Setting',14,'view_usersettings'),(64,'Can view User Widget',15,'view_userwidget'),(65,'Can add revision',17,'add_revision'),(66,'Can change revision',17,'change_revision'),(67,'Can delete revision',17,'delete_revision'),(68,'Can add version',18,'add_version'),(69,'Can change version',18,'change_version'),(70,'Can delete version',18,'delete_version'),(71,'Can view revision',17,'view_revision'),(72,'Can view version',18,'view_version'),(73,'Can add comment',19,'add_comment'),(74,'Can change comment',19,'change_comment'),(75,'Can delete comment',19,'delete_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Django','2018-06-08 15:07:14','2018-06-08 15:07:14'),(2,'Docker','2018-06-15 12:11:37','2018-06-15 12:11:37'),(3,'Linux','2018-06-20 09:53:42','2018-06-20 09:53:42'),(4,'小知识','2018-06-20 10:18:52','2018-06-20 10:18:52'),(5,'css','2018-06-20 10:23:06','2018-06-20 10:23:06'),(6,'Python','2018-07-04 14:40:51','2018-07-04 14:40:51');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `text` longtext NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `reply_name` varchar(100) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_content_type_id_142ac1c1_fk_django_content_type_id` (`content_type_id`),
  KEY `comment_root_id_729e6580_fk_comment_id` (`root_id`),
  KEY `comment_parent_id_07748d21_fk_comment_id` (`parent_id`),
  CONSTRAINT `comment_content_type_id_142ac1c1_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_parent_id_07748d21_fk_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `comment_root_id_729e6580_fk_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,27,'不负责任：表现任性、散漫，过于自我中心，出了差错老爱怪罪别人。','zhu','13160724868@163.com','2018-07-01 14:41:33','2018-07-01 14:41:33',NULL,6,NULL,NULL),(2,27,'是真的吗','pinsily','13160724868@163.com','2018-07-01 14:41:53','2018-07-01 14:41:53','zhu',6,1,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_profile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'blog','article'),(7,'blog','category'),(8,'blog','comment'),(9,'blog','link'),(10,'blog','linkcategory'),(11,'blog','tag'),(19,'comment','comment'),(4,'contenttypes','contenttype'),(17,'reversion','revision'),(18,'reversion','version'),(5,'sessions','session'),(12,'userprofile','userprofile'),(13,'xadmin','bookmark'),(16,'xadmin','log'),(14,'xadmin','usersettings'),(15,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-08 15:03:45'),(2,'contenttypes','0002_remove_content_type_name','2018-06-08 15:03:45'),(3,'auth','0001_initial','2018-06-08 15:03:45'),(4,'auth','0002_alter_permission_name_max_length','2018-06-08 15:03:45'),(5,'auth','0003_alter_user_email_max_length','2018-06-08 15:03:45'),(6,'auth','0004_alter_user_username_opts','2018-06-08 15:03:45'),(7,'auth','0005_alter_user_last_login_null','2018-06-08 15:03:45'),(8,'auth','0006_require_contenttypes_0002','2018-06-08 15:03:45'),(9,'auth','0007_alter_validators_add_error_messages','2018-06-08 15:03:45'),(10,'auth','0008_alter_user_username_max_length','2018-06-08 15:03:45'),(11,'auth','0009_alter_user_last_name_max_length','2018-06-08 15:03:45'),(12,'userprofile','0001_initial','2018-06-08 15:03:45'),(13,'admin','0001_initial','2018-06-08 15:03:45'),(14,'admin','0002_logentry_remove_auto_add','2018-06-08 15:03:45'),(15,'blog','0001_initial','2018-06-08 15:03:46'),(16,'blog','0002_auto_20180602_0950','2018-06-08 15:03:46'),(17,'blog','0003_auto_20180602_2242','2018-06-08 15:03:46'),(18,'blog','0004_auto_20180603_1150','2018-06-08 15:03:46'),(19,'reversion','0001_initial','2018-06-08 15:06:00'),(20,'reversion','0002_auto_20141216_1509','2018-06-08 15:06:00'),(21,'reversion','0003_auto_20160601_1600','2018-06-08 15:06:00'),(22,'reversion','0004_auto_20160611_1202','2018-06-08 15:06:00'),(23,'sessions','0001_initial','2018-06-08 15:06:00'),(24,'userprofile','0002_auto_20180531_2218','2018-06-08 15:06:00'),(25,'xadmin','0001_initial','2018-06-08 15:06:00'),(26,'xadmin','0002_log','2018-06-08 15:06:00'),(27,'xadmin','0003_auto_20160715_0100','2018-06-08 15:06:00'),(28,'reversion','0001_squashed_0004_auto_20160611_1202','2018-06-08 15:06:00'),(29,'blog','0005_auto_20180603_1749','2018-07-01 14:00:11'),(30,'blog','0006_auto_20180604_1308','2018-07-01 14:00:11'),(31,'blog','0007_auto_20180605_1858','2018-07-01 14:00:11'),(32,'blog','0008_auto_20180605_1924','2018-07-01 14:00:11'),(33,'blog','0009_auto_20180606_0857','2018-07-01 14:00:11'),(34,'blog','0010_auto_20180606_0901','2018-07-01 14:00:11'),(35,'blog','0011_auto_20180606_0927','2018-07-01 14:00:11'),(36,'blog','0012_auto_20180606_1620','2018-07-01 14:00:11'),(37,'blog','0013_auto_20180607_0858','2018-07-01 14:00:11'),(38,'blog','0014_auto_20180628_2136','2018-07-01 14:00:11'),(39,'comment','0001_initial','2018-07-01 14:00:11'),(40,'comment','0002_auto_20180628_2143','2018-07-01 14:00:12'),(41,'comment','0003_comment','2018-07-01 14:00:12'),(42,'comment','0004_auto_20180701_0845','2018-07-01 14:00:12'),(43,'comment','0005_auto_20180701_0848','2018-07-01 14:00:12'),(44,'comment','0006_auto_20180701_0856','2018-07-01 14:00:12'),(45,'comment','0007_auto_20180701_0909','2018-07-01 14:00:12'),(46,'comment','0008_auto_20180701_2003','2018-07-01 14:00:12');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1nrkjl06r1yuymfen73gr3qce0jh5p01','YWE5MWNjNWM1YmU3MTA2N2I3MGU0OGM3N2YzZTMxZmUwNGQxNWIwYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNTcxYjFlYWIyNDk4MzhhNWI2MThjZjRhNjk3YzBkOTY3ZTJmNzYwIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsImFydGljbGUiXSwiIl19','2018-07-18 14:39:32'),('sd6hl7uqnm0ztc2rwbqjdzm21twnm1bo','YWE5MWNjNWM1YmU3MTA2N2I3MGU0OGM3N2YzZTMxZmUwNGQxNWIwYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNTcxYjFlYWIyNDk4MzhhNWI2MThjZjRhNjk3YzBkOTY3ZTJmNzYwIiwiTElTVF9RVUVSWSI6W1siYmxvZyIsImFydGljbGUiXSwiIl19','2018-07-18 00:52:06');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_category_id_efbf5163_fk_linkcategory_id` (`category_id`),
  CONSTRAINT `link_category_id_efbf5163_fk_linkcategory_id` FOREIGN KEY (`category_id`) REFERENCES `linkcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linkcategory`
--

DROP TABLE IF EXISTS `linkcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkcategory`
--

LOCK TABLES `linkcategory` WRITE;
/*!40000 ALTER TABLE `linkcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `linkcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_revision`
--

DROP TABLE IF EXISTS `reversion_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_user_profile_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_revision`
--

LOCK TABLES `reversion_revision` WRITE;
/*!40000 ALTER TABLE `reversion_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_version`
--

DROP TABLE IF EXISTS `reversion_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_version`
--

LOCK TABLES `reversion_version` WRITE;
/*!40000 ALTER TABLE `reversion_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'django','2018-06-08 15:08:17','2018-06-08 15:08:17'),(2,'七牛云','2018-06-08 15:08:26','2018-06-08 15:08:26'),(3,'xadmin','2018-06-08 15:14:16','2018-06-08 15:14:16'),(4,'js','2018-06-08 15:15:56','2018-06-08 15:15:56'),(5,'db','2018-06-08 15:16:59','2018-06-08 15:16:59'),(6,'static','2018-06-08 15:19:49','2018-06-08 15:19:49'),(7,'templates','2018-06-08 15:20:53','2018-06-08 15:20:53'),(8,'docker','2018-06-15 12:11:46','2018-06-15 12:11:46'),(9,'linux','2018-06-20 09:53:50','2018-06-20 09:53:50'),(10,'ubuntu','2018-06-20 09:53:55','2018-06-20 09:53:55'),(11,'shell','2018-06-20 09:54:03','2018-06-20 09:54:03'),(12,'vim','2018-06-20 10:08:42','2018-06-20 10:08:42'),(13,'nginx','2018-06-20 10:16:17','2018-06-20 10:16:17'),(14,'css','2018-06-20 10:23:15','2018-06-20 10:23:15'),(15,'python','2018-07-04 14:41:21','2018-07-04 14:41:21');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'pbkdf2_sha256$100000$YCe89kgoIVfL$VUJpL2xn4kUwH2681tC6aj27KEZ42cLUybM9LgD/Geg=','2018-07-04 00:51:49',1,'pinsily','','','13160724868@163.com',1,1,'2018-06-08 15:06:40','avatar/default.jpg',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile_groups`
--

DROP TABLE IF EXISTS `user_profile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_profile_groups_userprofile_id_group_id_634d6ad7_uniq` (`userprofile_id`,`group_id`),
  KEY `user_profile_groups_group_id_864f8fbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_profile_groups_group_id_864f8fbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_profile_groups_userprofile_id_3e52d209_fk_user_profile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile_groups`
--

LOCK TABLES `user_profile_groups` WRITE;
/*!40000 ALTER TABLE `user_profile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile_user_permissions`
--

DROP TABLE IF EXISTS `user_profile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_profile_user_permis_userprofile_id_permissio_881e08f1_uniq` (`userprofile_id`,`permission_id`),
  KEY `user_profile_user_pe_permission_id_f5abe73f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_profile_user_pe_permission_id_f5abe73f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_profile_user_pe_userprofile_id_663dc0ea_fk_user_prof` FOREIGN KEY (`userprofile_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile_user_permissions`
--

LOCK TABLES `user_profile_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_profile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_user_profile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_user_profile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-06-08 15:07:14','211.97.3.233','1','Django','create','已添加。',7,1),(2,'2018-06-08 15:08:17','211.97.3.233','1','django','create','已添加。',11,1),(3,'2018-06-08 15:08:26','211.97.3.233','2','七牛云','create','已添加。',11,1),(4,'2018-06-08 15:09:28','211.97.3.233','1','django -- 文件上传至七牛云','create','已添加。',6,1),(5,'2018-06-08 15:12:33','211.97.3.233','2','django -- 文件上传至本地','create','已添加。',6,1),(6,'2018-06-08 15:13:25','211.97.3.233','3','django -- 模板中获得结果集的长度','create','已添加。',6,1),(7,'2018-06-08 15:14:16','211.97.3.233','3','xadmin','create','已添加。',11,1),(8,'2018-06-08 15:14:23','211.97.3.233','4','Django -- xadmin 自定义右侧菜单栏','create','已添加。',6,1),(9,'2018-06-08 15:15:56','211.97.3.233','4','js','create','已添加。',11,1),(10,'2018-06-08 15:16:03','211.97.3.233','5','django -- ajax 403 错误','create','已添加。',6,1),(11,'2018-06-08 15:16:59','211.97.3.233','5','db','create','已添加。',11,1),(12,'2018-06-08 15:17:07','211.97.3.233','6','django -- 自定义数据库表名','create','已添加。',6,1),(13,'2018-06-08 15:17:58','211.97.3.233','7','django -- Abstract User Error','create','已添加。',6,1),(14,'2018-06-08 15:18:44','211.97.3.233','8','django -- 获得当前时间','create','已添加。',6,1),(15,'2018-06-08 15:19:49','211.97.3.233','6','static','create','已添加。',11,1),(16,'2018-06-08 15:20:00','211.97.3.233','9','Django  -- static 静态文件','create','已添加。',6,1),(17,'2018-06-08 15:20:53','211.97.3.233','7','templates','create','已添加。',11,1),(18,'2018-06-08 15:21:00','211.97.3.233','10','django -- templatesd','create','已添加。',6,1),(19,'2018-06-08 15:21:52','211.97.3.233','11','django -- js 交互','create','已添加。',6,1),(20,'2018-06-15 12:11:37','39.108.166.59','2','Docker','create','已添加。',7,1),(21,'2018-06-15 12:11:46','39.108.166.59','8','docker','create','已添加。',11,1),(22,'2018-06-15 12:11:53','39.108.166.59','12','docker 笔记(0) -- 概述','create','已添加。',6,1),(23,'2018-06-16 01:43:01','39.108.166.59','13','docker 笔记(1) -- 安装','create','已添加。',6,1),(24,'2018-06-16 01:45:19','39.108.166.59','14','docker 笔记(2) -- 镜像','create','已添加。',6,1),(25,'2018-06-16 01:48:53','39.108.166.59','15','docker 笔记(3) -- 容器','create','已添加。',6,1),(26,'2018-06-20 09:53:42','39.108.166.59','3','Linux','create','已添加。',7,1),(27,'2018-06-20 09:53:50','39.108.166.59','9','linux','create','已添加。',11,1),(28,'2018-06-20 09:53:55','39.108.166.59','10','ubuntu','create','已添加。',11,1),(29,'2018-06-20 09:54:03','39.108.166.59','11','shell','create','已添加。',11,1),(30,'2018-06-20 09:54:14','39.108.166.59','16','linux -- 日志重定向到文本','create','已添加。',6,1),(31,'2018-06-20 09:55:39','39.108.166.59','17','linux -- tar.bz2 文件解压','create','已添加。',6,1),(32,'2018-06-20 09:59:39','39.108.166.59','18','linux -- Ubuntu 修改主机名','create','已添加。',6,1),(33,'2018-06-20 10:02:18','39.108.166.59','9','django  -- static 静态文件','change','修改 title',6,1),(34,'2018-06-20 10:02:30','39.108.166.59','4','django -- xadmin 自定义右侧菜单栏','change','修改 title',6,1),(35,'2018-06-20 10:04:11','39.108.166.59','19','linux -- 后台管理程序 supervisor','create','已添加。',6,1),(36,'2018-06-20 10:05:34','39.108.166.59','20','linux -- 常用命令含义','create','已添加。',6,1),(37,'2018-06-20 10:07:09','39.108.166.59','21','linux -- 环境变量 path','create','已添加。',6,1),(38,'2018-06-20 10:08:42','39.108.166.59','12','vim','create','已添加。',11,1),(39,'2018-06-20 10:08:58','39.108.166.59','22','linux -- swap file “*.swp”already exists！','create','已添加。',6,1),(40,'2018-06-20 10:12:32','39.108.166.59','23','linux -- ls 命令','create','已添加。',6,1),(41,'2018-06-20 10:13:02','39.108.166.59',NULL,'','delete','批量删除 1 个 article',NULL,1),(42,'2018-06-20 10:13:25','39.108.166.59','11','django -- js 交互','change','没有字段被修改。',6,1),(43,'2018-06-20 10:13:34','39.108.166.59','19','linux -- 后台管理程序 supervisor','change','没有字段被修改。',6,1),(44,'2018-06-20 10:14:43','39.108.166.59','24','linux -- 修改主机名','create','已添加。',6,1),(45,'2018-06-20 10:16:17','39.108.166.59','13','nginx','create','已添加。',11,1),(46,'2018-06-20 10:16:26','39.108.166.59','25','nginx -- 403 forbidden 权限问题','create','已添加。',6,1),(47,'2018-06-20 10:17:31','39.108.166.59','26','nginx - nginx:[error] open() \"/run/nginx.pid\" failed','create','已添加。',6,1),(48,'2018-06-20 10:18:52','39.108.166.59','4','小知识','create','已添加。',7,1),(49,'2018-06-20 10:19:00','39.108.166.59','27','小知识 -- 彼得潘症候群','create','已添加。',6,1),(50,'2018-06-20 10:23:06','39.108.166.59','5','css','create','已添加。',7,1),(51,'2018-06-20 10:23:15','39.108.166.59','14','css','create','已添加。',11,1),(52,'2018-06-20 10:23:33','39.108.166.59','28','css -- 颜色代码对照表','create','已添加。',6,1),(53,'2018-06-20 10:24:40','39.108.166.59','29','css -- Button 鼠标箭头变手势','create','已添加。',6,1),(54,'2018-06-20 10:25:39','39.108.166.59','30','css -- img 等比例自动缩放','create','已添加。',6,1),(55,'2018-06-20 10:26:52','39.108.166.59','31','css -- 图片悬停原区域放大','create','已添加。',6,1),(56,'2018-06-20 10:27:51','39.108.166.59','10','django -- templates','change','修改 title',6,1),(57,'2018-06-26 14:50:54','39.108.166.59',NULL,'','delete','批量删除 1 个 article',NULL,1),(58,'2018-07-04 14:40:51','39.108.166.59','6','Python','create','已添加。',7,1),(59,'2018-07-04 14:41:21','39.108.166.59','15','python','create','已添加。',11,1),(60,'2018-07-04 14:41:49','39.108.166.59','31','python -- 去掉字符串的空白字符','create','已添加。',6,1),(61,'2018-07-04 14:43:16','39.108.166.59','32','python -- 判断 list 是否为父子集关系','create','已添加。',6,1),(62,'2018-07-04 14:44:36','39.108.166.59','33','python -- 均匀分割字符串','create','已添加。',6,1),(63,'2018-07-04 14:45:34','39.108.166.59','34','python -- 调用 shell 命令','create','已添加。',6,1),(64,'2018-07-04 14:46:55','39.108.166.59','35','python -- 新建文件夹','create','已添加。',6,1),(65,'2018-07-04 14:49:31','39.108.166.59','36','在函数体的第一行，我们可以使用一对三个单引号（\'\'\'）或者一对三个双引号（\"\"\"）来定义文档字符串','create','已添加。',6,1),(66,'2018-07-04 14:50:13','39.108.166.59','36','python -- 文档字符串','change','修改 title',6,1),(67,'2018-07-04 14:51:11','39.108.166.59','37','--- title: python -- pycharm 新建文件自动填充信息 tags: python, pycharm grammar_cjkRuby: true ---  ![][1]  <p>','create','已添加。',6,1),(68,'2018-07-04 14:51:39','39.108.166.59','37','python -- pycharm 新建文件自动填充信息','change','修改 title',6,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_profile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_user_profile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-05 20:34:22
