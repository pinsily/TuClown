/*
Navicat MySQL Data Transfer

Source Server         : pinsily
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : tuclown

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-07 11:00:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', 'Django -- xadmin 自定义右侧菜单栏', '---\r\n\r\n![][1]\r\n\r\n<p><center>时间的沙漏沉淀着无法逃离的过往,记忆的双手总是拾起那些明媚的忧伤</center></p>\r\n\r\n------\r\n### 说明\r\nxadmin 默认的菜单栏包含了 Reversion，权限管理等选项，但是一般是用不上的，于是想着办法将其去掉，可以被逼着去翻了源码才搞定了\r\n\r\n----------\r\n### 修改\r\n[源码解析地址][2]\r\n\r\n主要用到的是视图类 `CommAdminView` 中 `get_site_menu()` 和 `get_nav_menu()` 方法，前一个是自定义增加菜单栏的，后一个是将增加的菜单栏合并到原来的菜单栏中并返回新的菜单栏集合，思路就是将返回的新集合只包含新增的菜单栏\r\n\r\n```python\r\n# adminx.py\r\nclass GlobalSetting(object):\r\n    site_title = \"Pinsily.blog\"\r\n    site_footer = \'pinsily blog\'\r\n    # menu_style = \'accordion\'\r\n\r\n    # 自定义新增菜单栏\r\n    def get_site_menu(self):\r\n        return (\r\n            {\'title\': \'Blog\', \'perm\': self.get_model_perm(Article, \'change\'), \'menus\': (\r\n                {\'title\': \'Article\', \'url\': self.get_model_url(\r\n                    Article, \'changelist\')},\r\n                {\'title\': \'Category\', \'url\': self.get_model_url(\r\n                    Category, \'changelist\')},\r\n                {\'title\': \'BlogComment\', \'url\': self.get_model_url(\r\n                    BlogComment, \'changelist\')},\r\n                {\'title\': \'Tag\', \'url\': self.get_model_url(Tag, \'changelist\')},\r\n                {\'title\': \'OneModel\', \'url\': self.get_model_url(\r\n                    OneModel, \'changelist\')},\r\n            )},\r\n        )\r\n\r\n    def get_nav_menu(self):\r\n        # 直接返回新增的菜单栏，源码中还有很大一部分的合并功能\r\n        site_menu = list(self.get_site_menu() or [])\r\n        return site_menu\r\n\r\n\r\nxadmin.site.register(xadmin.views.CommAdminView, GlobalSetting)\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/SatelliteGlades.jpg\r\n  [2]: http://xadmin.readthedocs.io/en/docs-chinese/_modules/xadmin/views/base.html', '10-48541.jpg', '2018-06-02 14:44:00.000000', '2018-06-07 00:59:57.241856', 'p', 'xadmin 默认的菜单栏包含了 Reversion，权限管理等选项，但是一般是用不上的', '75', '0', '0', 'pinsily', '2');
INSERT INTO `article` VALUES ('3', 'css -- img 等比例自动缩放', '---\r\n\r\n![][1]\r\n\r\n<p><center>人生如逆旅，我亦是行人。 ——临江仙</center></p>\r\n\r\n------\r\n### 说明\r\n使得 img 随着父元素的大小自动等比例缩放\r\n\r\n\r\n----------\r\n### 修改\r\n```css\r\nimg{  \r\n    /* ... */\r\n    width: auto;  \r\n    height: auto;  \r\n    max-width: 100%;  \r\n    max-height: 100%;   \r\n    /* ... */\r\n}  \r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/GreatGhost.jpg', '10-23733.jpg', '2018-06-03 03:03:00.000000', '2018-06-07 01:01:06.962638', 'p', '使得 img 随着父元素的大小自动等比例缩放', '5', '0', '0', 'pinsily', '3');
INSERT INTO `article` VALUES ('5', 'django -- ajax 403 错误', '---\r\n![][1]\r\n<p><center>早知如此绊人心，何如当初莫相识。 ——秋风词</center></p>\r\n\r\n------\r\n### 说明\r\n在使用 ajax 实现文章点赞功能的时候，请求出现了 403 的错误\r\n```shell\r\nPOST http://localhost:8000/likes/1 403 (FORBIDDEN)\r\n```\r\n\r\n\r\n----------\r\n### 解决\r\n在官网上已经有了相应的解决方法和实例，出现这个问题的主要原因是没有添加 csrf 认证,解决的基本原理就是在post数据里面添加csrf信息\r\n> AJAX  \r\n> While the above method can be used for AJAX POST requests, it has some inconveniences: you have to remember to pass the CSRF token in as POST data with every POST request. For this reason, there is an alternative method: on each XMLHttpRequest, set a custom X-CSRFToken header to the value of the CSRF token. This is often easier, because many JavaScript frameworks provide hooks that allow headers to be set on every request.  \r\n> As a first step, you must get the CSRF token itself. The recommended source for the token is the > csrftoken cookie, which will be set if you’ve enabled CSRF protection for your views as outlined above. \r\n\r\n将下面的代码添加到同一个 ajax js 文件中或代码片段中即可解决问题\r\n```javascript\r\nfunction getCookie(name) {  \r\n    var cookieValue = null;  \r\n    if (document.cookie && document.cookie != \'\') {  \r\n        var cookies = document.cookie.split(\';\');  \r\n        for (var i = 0; i < cookies.length; i++) {  \r\n            var cookie = jQuery.trim(cookies[i]);  \r\n            // Does this cookie string begin with the name we want?  \r\n            if (cookie.substring(0, name.length + 1) == (name + \'=\')) {  \r\n                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));  \r\n                break;  \r\n            }  \r\n        }  \r\n    }  \r\n    return cookieValue;  \r\n}  \r\n  \r\nfunction csrfSafeMethod(method) {  \r\n    // these HTTP methods do not require CSRF protection  \r\n    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));  \r\n}  \r\n$.ajaxSetup({  \r\n    beforeSend: function(xhr, settings) {  \r\n    var csrftoken = getCookie(\'csrftoken\');       \r\n    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {  \r\n            xhr.setRequestHeader(\"X-CSRFToken\", csrftoken);  \r\n        }  \r\n    }  \r\n});  \r\n```\r\n\r\n----------\r\n\r\n\r\n  [1]: http://owgxfd8jv.bkt.clouddn.com/MozambiqueSandbar.jpg', 'BklynBrdge.jpg', '2018-05-09 15:49:00.000000', '2018-06-07 01:05:44.479418', 'p', '在使用 ajax 实现文章点赞功能的时候，请求出现了 403 的错误', '5', '0', '0', 'pinsily', '2');

-- ----------------------------
-- Table structure for article_tags
-- ----------------------------
DROP TABLE IF EXISTS `article_tags`;
CREATE TABLE `article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_tags_article_id_tag_id_9ea24d7b_uniq` (`article_id`,`tag_id`),
  KEY `article_tags_tag_id_55b93824_fk_tag_id` (`tag_id`),
  CONSTRAINT `article_tags_article_id_ebbe35ec_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `article_tags_tag_id_55b93824_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tags
-- ----------------------------
INSERT INTO `article_tags` VALUES ('1', '2', '2');
INSERT INTO `article_tags` VALUES ('2', '2', '3');
INSERT INTO `article_tags` VALUES ('3', '2', '4');
INSERT INTO `article_tags` VALUES ('4', '3', '5');
INSERT INTO `article_tags` VALUES ('6', '5', '2');
INSERT INTO `article_tags` VALUES ('7', '5', '3');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add article', '6', 'add_article');
INSERT INTO `auth_permission` VALUES ('22', 'Can change article', '6', 'change_article');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete article', '6', 'delete_article');
INSERT INTO `auth_permission` VALUES ('24', 'Can add category', '7', 'add_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can change category', '7', 'change_category');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete category', '7', 'delete_category');
INSERT INTO `auth_permission` VALUES ('27', 'Can add comment', '8', 'add_comment');
INSERT INTO `auth_permission` VALUES ('28', 'Can change comment', '8', 'change_comment');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete comment', '8', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('30', 'Can add tag', '9', 'add_tag');
INSERT INTO `auth_permission` VALUES ('31', 'Can change tag', '9', 'change_tag');
INSERT INTO `auth_permission` VALUES ('32', 'Can delete tag', '9', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('33', 'Can view article', '6', 'view_article');
INSERT INTO `auth_permission` VALUES ('34', 'Can view category', '7', 'view_category');
INSERT INTO `auth_permission` VALUES ('35', 'Can view comment', '8', 'view_comment');
INSERT INTO `auth_permission` VALUES ('36', 'Can view tag', '9', 'view_tag');
INSERT INTO `auth_permission` VALUES ('37', 'Can add user profile', '10', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('38', 'Can change user profile', '10', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete user profile', '10', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('40', 'Can view user profile', '10', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('41', 'Can add Bookmark', '11', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('42', 'Can change Bookmark', '11', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete Bookmark', '11', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('44', 'Can add User Setting', '12', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('45', 'Can change User Setting', '12', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('46', 'Can delete User Setting', '12', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('47', 'Can add User Widget', '13', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('48', 'Can change User Widget', '13', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('49', 'Can delete User Widget', '13', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('50', 'Can add log entry', '14', 'add_log');
INSERT INTO `auth_permission` VALUES ('51', 'Can change log entry', '14', 'change_log');
INSERT INTO `auth_permission` VALUES ('52', 'Can delete log entry', '14', 'delete_log');
INSERT INTO `auth_permission` VALUES ('53', 'Can view Bookmark', '11', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('54', 'Can view log entry', '14', 'view_log');
INSERT INTO `auth_permission` VALUES ('55', 'Can view User Setting', '12', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('56', 'Can view User Widget', '13', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('57', 'Can add revision', '15', 'add_revision');
INSERT INTO `auth_permission` VALUES ('58', 'Can change revision', '15', 'change_revision');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete revision', '15', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('60', 'Can add version', '16', 'add_version');
INSERT INTO `auth_permission` VALUES ('61', 'Can change version', '16', 'change_version');
INSERT INTO `auth_permission` VALUES ('62', 'Can delete version', '16', 'delete_version');
INSERT INTO `auth_permission` VALUES ('63', 'Can view revision', '15', 'view_revision');
INSERT INTO `auth_permission` VALUES ('64', 'Can view version', '16', 'view_version');
INSERT INTO `auth_permission` VALUES ('65', 'Can add link', '17', 'add_link');
INSERT INTO `auth_permission` VALUES ('66', 'Can change link', '17', 'change_link');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete link', '17', 'delete_link');
INSERT INTO `auth_permission` VALUES ('68', 'Can view link', '17', 'view_link');
INSERT INTO `auth_permission` VALUES ('69', 'Can add link category', '18', 'add_linkcategory');
INSERT INTO `auth_permission` VALUES ('70', 'Can change link category', '18', 'change_linkcategory');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete link category', '18', 'delete_linkcategory');
INSERT INTO `auth_permission` VALUES ('72', 'Can view link category', '18', 'view_linkcategory');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', 'Django', '2018-06-02 14:39:20.676173', '2018-06-02 14:39:20.677149');
INSERT INTO `category` VALUES ('3', 'css', '2018-06-03 03:03:30.920518', '2018-06-03 03:03:30.920518');
INSERT INTO `category` VALUES ('4', 'MongoDB', '2018-06-03 04:41:35.381887', '2018-06-03 04:41:35.382890');
INSERT INTO `category` VALUES ('5', 'python', '2018-06-04 12:28:12.120893', '2018-06-04 12:28:12.120893');
INSERT INTO `category` VALUES ('6', 'typecho', '2018-06-04 12:28:12.126875', '2018-06-04 12:28:12.126875');
INSERT INTO `category` VALUES ('7', 'linux', '2018-06-04 12:28:12.131895', '2018-06-04 12:28:12.131895');
INSERT INTO `category` VALUES ('8', '小知识', '2018-06-04 12:28:12.135894', '2018-06-04 12:28:12.135894');
INSERT INTO `category` VALUES ('9', 'win10', '2018-06-04 12:28:12.139875', '2018-06-04 12:28:12.140874');
INSERT INTO `category` VALUES ('10', '前端', '2018-06-04 12:28:12.144874', '2018-06-04 12:28:12.144874');
INSERT INTO `category` VALUES ('11', '程序猿', '2018-06-04 12:28:12.149873', '2018-06-04 12:28:12.149873');
INSERT INTO `category` VALUES ('12', 'django', '2018-06-04 12:28:12.154874', '2018-06-04 12:28:12.154874');
INSERT INTO `category` VALUES ('13', 'Bigdata', '2018-06-04 12:28:12.159874', '2018-06-04 12:28:12.159874');
INSERT INTO `category` VALUES ('14', 'Android', '2018-06-04 12:28:12.163875', '2018-06-04 12:28:12.163875');
INSERT INTO `category` VALUES ('15', 'Algorithm', '2018-06-04 12:28:12.167872', '2018-06-04 12:28:12.167872');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `body` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_head` varchar(100) NOT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `pid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_article_id_1de4311c_fk_article_id` (`article_id`),
  KEY `comment_pid_id_31d6bc03_fk_comment_id` (`pid_id`),
  CONSTRAINT `comment_article_id_1de4311c_fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  CONSTRAINT `comment_pid_id_31d6bc03_fk_comment_id` FOREIGN KEY (`pid_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
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

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('6', 'blog', 'article');
INSERT INTO `django_content_type` VALUES ('7', 'blog', 'category');
INSERT INTO `django_content_type` VALUES ('8', 'blog', 'comment');
INSERT INTO `django_content_type` VALUES ('17', 'blog', 'link');
INSERT INTO `django_content_type` VALUES ('18', 'blog', 'linkcategory');
INSERT INTO `django_content_type` VALUES ('9', 'blog', 'tag');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('15', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('16', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('10', 'userprofile', 'userprofile');
INSERT INTO `django_content_type` VALUES ('11', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('14', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('12', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('13', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-06-01 01:31:15.812107');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-06-01 01:31:16.027062');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-06-01 01:31:16.694968');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-06-01 01:31:16.815947');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-06-01 01:31:16.839944');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-06-01 01:31:16.867933');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-06-01 01:31:16.893946');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-06-01 01:31:16.902926');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-06-01 01:31:16.928920');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-06-01 01:31:16.964915');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2018-06-01 01:31:16.990911');
INSERT INTO `django_migrations` VALUES ('12', 'userprofile', '0001_initial', '2018-06-01 01:31:18.081524');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2018-06-01 01:31:18.417470');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2018-06-01 01:31:18.452445');
INSERT INTO `django_migrations` VALUES ('15', 'blog', '0001_initial', '2018-06-01 01:31:19.561220');
INSERT INTO `django_migrations` VALUES ('16', 'reversion', '0001_initial', '2018-06-01 01:31:20.419044');
INSERT INTO `django_migrations` VALUES ('17', 'reversion', '0002_auto_20141216_1509', '2018-06-01 01:31:20.432057');
INSERT INTO `django_migrations` VALUES ('18', 'reversion', '0003_auto_20160601_1600', '2018-06-01 01:31:20.445038');
INSERT INTO `django_migrations` VALUES ('19', 'reversion', '0004_auto_20160611_1202', '2018-06-01 01:31:20.459035');
INSERT INTO `django_migrations` VALUES ('20', 'sessions', '0001_initial', '2018-06-01 01:31:20.591008');
INSERT INTO `django_migrations` VALUES ('21', 'userprofile', '0002_auto_20180531_2218', '2018-06-01 01:31:20.632013');
INSERT INTO `django_migrations` VALUES ('22', 'xadmin', '0001_initial', '2018-06-01 01:31:21.453832');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0002_log', '2018-06-01 01:31:21.871747');
INSERT INTO `django_migrations` VALUES ('24', 'xadmin', '0003_auto_20160715_0100', '2018-06-01 01:31:22.048712');
INSERT INTO `django_migrations` VALUES ('25', 'reversion', '0001_squashed_0004_auto_20160611_1202', '2018-06-01 01:31:22.087702');
INSERT INTO `django_migrations` VALUES ('26', 'blog', '0002_auto_20180602_0950', '2018-06-02 01:51:15.652506');
INSERT INTO `django_migrations` VALUES ('27', 'blog', '0003_auto_20180602_2242', '2018-06-02 14:42:18.407692');
INSERT INTO `django_migrations` VALUES ('28', 'blog', '0004_auto_20180603_1150', '2018-06-03 03:50:22.727620');
INSERT INTO `django_migrations` VALUES ('29', 'blog', '0005_link', '2018-06-03 09:29:12.500341');
INSERT INTO `django_migrations` VALUES ('30', 'blog', '0006_auto_20180603_1728', '2018-06-03 09:29:12.947339');
INSERT INTO `django_migrations` VALUES ('31', 'blog', '0007_auto_20180603_1731', '2018-06-03 09:32:07.233030');
INSERT INTO `django_migrations` VALUES ('32', 'blog', '0008_auto_20180603_1735', '2018-06-03 09:36:08.050835');
INSERT INTO `django_migrations` VALUES ('33', 'blog', '0005_auto_20180603_1749', '2018-06-03 09:49:34.083841');
INSERT INTO `django_migrations` VALUES ('34', 'blog', '0006_auto_20180604_1308', '2018-06-04 05:08:23.341594');
INSERT INTO `django_migrations` VALUES ('35', 'blog', '0007_auto_20180605_1858', '2018-06-05 10:58:59.147256');
INSERT INTO `django_migrations` VALUES ('36', 'blog', '0008_auto_20180605_1924', '2018-06-05 11:24:47.931789');
INSERT INTO `django_migrations` VALUES ('37', 'blog', '0009_auto_20180606_0857', '2018-06-06 00:58:12.479679');
INSERT INTO `django_migrations` VALUES ('38', 'blog', '0010_auto_20180606_0901', '2018-06-06 01:02:03.293252');
INSERT INTO `django_migrations` VALUES ('39', 'blog', '0011_auto_20180606_0927', '2018-06-06 01:27:27.554673');
INSERT INTO `django_migrations` VALUES ('40', 'blog', '0012_auto_20180606_1620', '2018-06-06 08:21:52.256986');
INSERT INTO `django_migrations` VALUES ('41', 'blog', '0013_auto_20180607_0858', '2018-06-07 01:02:46.204992');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('kplnuz2cawlq9rghk72ipsd91vbbnfhr', 'ZmI5NWFkYjAxMTAxZjE0NmI0NDEzNDM0NTVjNTUwMGJiNmQwMTBiMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2VjMDc0NzRhMGYzNTU2YTg4ZTdlZTIxY2M3Zjk0N2NhN2ZmZjk2IiwiTElTVF9RVUVSWSI6W1siYmxvZyIsImFydGljbGUiXSwiIl19', '2018-06-21 01:01:41.990272');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_category_id_efbf5163_fk_linkcategory_id` (`category_id`),
  CONSTRAINT `link_category_id_efbf5163_fk_linkcategory_id` FOREIGN KEY (`category_id`) REFERENCES `linkcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', '电脑爱好者', 'http://www.cfan.com.cn/', '2018-06-03 09:50:23.437856', '2018-06-03 09:50:23.437856', '1');
INSERT INTO `link` VALUES ('2', '十五言', 'http://www.15yan.com/', '2018-06-03 10:01:27.875423', '2018-06-03 10:01:27.875423', '4');
INSERT INTO `link` VALUES ('3', '素锦', 'http://isujin.com/', '2018-06-03 10:01:44.629870', '2018-06-03 10:01:44.629870', '4');
INSERT INTO `link` VALUES ('4', '读写人', 'http://www.duxieren.com/', '2018-06-03 10:01:56.553462', '2018-06-03 10:01:56.553462', '4');
INSERT INTO `link` VALUES ('5', '第九阅览室', 'http://9yls.net/', '2018-06-03 10:02:18.454902', '2018-06-03 10:02:18.454902', '4');
INSERT INTO `link` VALUES ('6', 'One', 'http://wufazhuce.com/', '2018-06-03 10:02:47.889026', '2018-06-03 10:02:47.889026', '4');
INSERT INTO `link` VALUES ('7', '图书馆', 'http://library.gdut.edu.cn/', '2018-06-03 10:06:57.594684', '2018-06-03 10:06:57.594684', '5');
INSERT INTO `link` VALUES ('8', '信息管理系统', 'http://gdut.eswis.cn/', '2018-06-03 10:07:22.226332', '2018-06-03 10:07:22.226332', '5');
INSERT INTO `link` VALUES ('9', '青年之声', 'http://www.12355.net/pc/index.html', '2018-06-03 10:07:41.124297', '2018-06-03 10:07:41.124297', '5');
INSERT INTO `link` VALUES ('10', '全国大学生创业服务网', 'http://cy.ncss.cn/', '2018-06-03 10:08:03.641511', '2018-06-03 10:08:03.642508', '5');
INSERT INTO `link` VALUES ('11', '学信网', 'http://www.chsi.com.cn/', '2018-06-03 10:08:14.522030', '2018-06-03 10:08:14.522030', '5');
INSERT INTO `link` VALUES ('12', '心理服务平台', 'http://psy.gdut.edu.cn/web/user/index', '2018-06-03 10:08:37.950496', '2018-06-03 10:08:37.950496', '5');
INSERT INTO `link` VALUES ('13', '学生邮箱', 'http://mail.mail2.gdut.edu.cn/cgi-bin/loginpage?s=session_timeout&from=&r=b404991bbc4f7b1ffb75b7d08083273d', '2018-06-03 10:09:21.686712', '2018-06-03 10:09:21.687711', '5');
INSERT INTO `link` VALUES ('15', 'Rainy mood', 'http://www.rainymood.com/', '2018-06-04 08:01:52.456936', '2018-06-04 08:01:52.456936', '4');
INSERT INTO `link` VALUES ('16', '菜鸟教程', 'http://www.runoob.com/', '2018-06-04 08:06:07.239889', '2018-06-04 08:06:07.239889', '7');
INSERT INTO `link` VALUES ('17', 'Github', 'https://github.com/', '2018-06-04 08:06:29.921039', '2018-06-04 08:06:29.922060', '7');
INSERT INTO `link` VALUES ('18', 'Udacity', 'https://cn.udacity.com/', '2018-06-04 08:06:54.996278', '2018-06-04 08:06:54.996278', '7');
INSERT INTO `link` VALUES ('19', 'IMooc', 'http://www.imooc.com/', '2018-06-04 08:09:06.362743', '2018-06-04 08:09:06.362743', '7');
INSERT INTO `link` VALUES ('20', '实验楼', 'https://www.shiyanlou.com/courses/', '2018-06-04 08:09:25.817496', '2018-06-04 08:09:25.817496', '7');
INSERT INTO `link` VALUES ('21', 'StackOverflow', 'https://stackoverflow.com/', '2018-06-04 08:09:53.489753', '2018-06-04 08:09:53.489753', '7');
INSERT INTO `link` VALUES ('22', 'Leetcode', 'https://leetcode.com/', '2018-06-04 08:10:09.922275', '2018-06-04 08:10:09.922275', '7');
INSERT INTO `link` VALUES ('23', 'Free Code Camp', 'https://www.freecodecamp.com/', '2018-06-04 08:10:35.998269', '2018-06-04 08:10:35.998269', '7');
INSERT INTO `link` VALUES ('24', 'V2EX', 'https://www.v2ex.com/', '2018-06-04 08:12:16.127920', '2018-06-04 08:12:16.127920', '3');
INSERT INTO `link` VALUES ('25', 'CSDN', 'http://blog.csdn.net/', '2018-06-04 08:12:33.181754', '2018-06-04 08:12:33.181754', '3');
INSERT INTO `link` VALUES ('26', 'SegmentFault', 'https://segmentfault.com/', '2018-06-04 08:12:52.879207', '2018-06-04 08:12:52.879207', '3');
INSERT INTO `link` VALUES ('27', '果壳', 'https://www.guokr.com/', '2018-06-04 08:14:04.953383', '2018-06-04 08:14:04.954404', '3');
INSERT INTO `link` VALUES ('28', '水木社区', 'http://www.newsmth.net/nForum/#!mainpage', '2018-06-04 08:14:19.646703', '2018-06-04 08:14:19.647719', '3');

-- ----------------------------
-- Table structure for linkcategory
-- ----------------------------
DROP TABLE IF EXISTS `linkcategory`;
CREATE TABLE `linkcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linkcategory
-- ----------------------------
INSERT INTO `linkcategory` VALUES ('1', '计算机知识', '2018-06-03 09:50:20.431354', '2018-06-03 09:50:20.431354');
INSERT INTO `linkcategory` VALUES ('2', '个人博客', '2018-06-03 10:00:23.280506', '2018-06-03 10:00:23.281485');
INSERT INTO `linkcategory` VALUES ('3', '论坛', '2018-06-03 10:00:32.857459', '2018-06-03 10:00:32.857459');
INSERT INTO `linkcategory` VALUES ('4', '文艺', '2018-06-03 10:00:37.025376', '2018-06-03 10:00:37.025376');
INSERT INTO `linkcategory` VALUES ('5', '学校', '2018-06-03 10:00:51.112553', '2018-06-03 10:00:51.113550');
INSERT INTO `linkcategory` VALUES ('7', '编程指南', '2018-06-04 08:05:40.527461', '2018-06-04 08:05:40.528476');

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_user_profile_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
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

-- ----------------------------
-- Records of reversion_version
-- ----------------------------

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('2', 'django', '2018-06-02 14:39:26.948447', '2018-06-02 14:39:26.949451');
INSERT INTO `tag` VALUES ('3', 'python', '2018-06-02 14:39:43.470688', '2018-06-02 14:39:43.470688');
INSERT INTO `tag` VALUES ('4', 'xadmin', '2018-06-02 14:44:12.990983', '2018-06-02 14:44:12.990983');
INSERT INTO `tag` VALUES ('5', 'css', '2018-06-03 03:03:37.169921', '2018-06-03 03:03:37.169921');
INSERT INTO `tag` VALUES ('6', 'mongodb', '2018-06-03 04:41:43.897289', '2018-06-03 04:41:43.897289');

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES ('1', 'pbkdf2_sha256$100000$5dvCH4bjdipr$fAgnel+eqKwuzNNqgy6Yo5LAl9zy2ZJHbZgToaWGwnQ=', null, '1', 'pinsily96', '', '', '13160724868@163.com', '1', '1', '2018-06-01 01:32:28.176763', 'avatar/default.jpg', null, null, null, null);
INSERT INTO `user_profile` VALUES ('2', 'pbkdf2_sha256$100000$wqCnpXEcQ1qa$cNGJKDjtvavhS4VjWj13jhZzPWBKdJ3NaWuxI4UJpyM=', '2018-06-01 13:55:52.705011', '1', 'pinsily', '', '', '13160724868@163.com', '1', '1', '2018-06-01 13:55:47.605604', 'avatar/default.jpg', null, null, null, null);

-- ----------------------------
-- Table structure for user_profile_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_profile_groups`;
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

-- ----------------------------
-- Records of user_profile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_profile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_profile_user_permissions`;
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

-- ----------------------------
-- Records of user_profile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
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

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
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

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-06-01 13:57:17.845931', '127.0.0.1', '1', 'test', 'create', '已添加。', '7', '2');
INSERT INTO `xadmin_log` VALUES ('2', '2018-06-01 13:57:25.157838', '127.0.0.1', '1', 'test', 'create', '已添加。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('3', '2018-06-01 13:57:28.077796', '127.0.0.1', '1', 'django -- 自定义数据库表名', 'create', '已添加。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('4', '2018-06-01 14:00:48.431891', '127.0.0.1', '1', 'django -- 自定义数据库表名', 'change', '修改 image', '6', '2');
INSERT INTO `xadmin_log` VALUES ('5', '2018-06-02 14:39:20.697149', '127.0.0.1', '2', 'Django', 'create', '已添加。', '7', '2');
INSERT INTO `xadmin_log` VALUES ('6', '2018-06-02 14:39:26.951447', '127.0.0.1', '2', 'django', 'create', '已添加。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('7', '2018-06-02 14:39:43.473690', '127.0.0.1', '3', 'python', 'create', '已添加。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('8', '2018-06-02 14:44:13.009986', '127.0.0.1', '4', 'xadmin', 'create', '已添加。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('9', '2018-06-02 14:44:15.992154', '127.0.0.1', '2', 'Django -- xadmin 自定义右侧菜单栏', 'create', '已添加。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('10', '2018-06-03 03:03:30.923487', '127.0.0.1', '3', 'css', 'create', '已添加。', '7', '2');
INSERT INTO `xadmin_log` VALUES ('11', '2018-06-03 03:03:37.172925', '127.0.0.1', '5', 'css', 'create', '已添加。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('12', '2018-06-03 03:03:40.332784', '127.0.0.1', '3', 'css -- img 等比例自动缩放', 'create', '已添加。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('13', '2018-06-03 04:41:35.384883', '127.0.0.1', '4', 'MongoDB', 'create', '已添加。', '7', '2');
INSERT INTO `xadmin_log` VALUES ('14', '2018-06-03 04:41:43.899272', '127.0.0.1', '6', 'mongodb', 'create', '已添加。', '9', '2');
INSERT INTO `xadmin_log` VALUES ('15', '2018-06-03 04:41:46.861559', '127.0.0.1', '4', 'mongodb 笔记(1) -- 基本操作', 'create', '已添加。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('16', '2018-06-03 06:47:00.139567', '127.0.0.1', null, '', 'delete', '批量删除 1 个 category', null, '2');
INSERT INTO `xadmin_log` VALUES ('17', '2018-06-03 06:47:08.155347', '127.0.0.1', null, '', 'delete', '批量删除 1 个 tag', null, '2');
INSERT INTO `xadmin_log` VALUES ('18', '2018-06-03 07:29:03.326212', '127.0.0.1', '5', 'django -- ajax 403 错误', 'create', '已添加。', '6', '2');
INSERT INTO `xadmin_log` VALUES ('19', '2018-06-03 09:41:49.147114', '127.0.0.1', '1', 'pinsily', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('20', '2018-06-03 09:42:45.413723', '127.0.0.1', null, '', 'delete', '批量删除 1 个 link', null, '2');
INSERT INTO `xadmin_log` VALUES ('21', '2018-06-03 09:44:07.317960', '127.0.0.1', '2', '电脑爱好者', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('22', '2018-06-03 09:50:20.450350', '127.0.0.1', '1', '计算机知识', 'create', '已添加。', '18', '2');
INSERT INTO `xadmin_log` VALUES ('23', '2018-06-03 09:50:23.451854', '127.0.0.1', '1', '电脑爱好者', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('24', '2018-06-03 10:00:23.283486', '127.0.0.1', '2', '个人博客', 'create', '已添加。', '18', '2');
INSERT INTO `xadmin_log` VALUES ('25', '2018-06-03 10:00:32.876430', '127.0.0.1', '3', '论坛', 'create', '已添加。', '18', '2');
INSERT INTO `xadmin_log` VALUES ('26', '2018-06-03 10:00:37.027374', '127.0.0.1', '4', '文艺', 'create', '已添加。', '18', '2');
INSERT INTO `xadmin_log` VALUES ('27', '2018-06-03 10:00:51.114549', '127.0.0.1', '5', '学校', 'create', '已添加。', '18', '2');
INSERT INTO `xadmin_log` VALUES ('28', '2018-06-03 10:01:27.889405', '127.0.0.1', '2', '十五言', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('29', '2018-06-03 10:01:44.646869', '127.0.0.1', '3', '素锦', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('30', '2018-06-03 10:01:56.556461', '127.0.0.1', '4', '读写人', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('31', '2018-06-03 10:02:18.473906', '127.0.0.1', '5', '第九阅览室', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('32', '2018-06-03 10:02:47.891012', '127.0.0.1', '6', 'One', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('33', '2018-06-03 10:06:57.616686', '127.0.0.1', '7', '图书馆', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('34', '2018-06-03 10:07:22.246328', '127.0.0.1', '8', '信息管理系统', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('35', '2018-06-03 10:07:41.128296', '127.0.0.1', '9', '青年之声', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('36', '2018-06-03 10:08:03.665505', '127.0.0.1', '10', '全国大学生创业服务网', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('37', '2018-06-03 10:08:14.526036', '127.0.0.1', '11', '学信网', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('38', '2018-06-03 10:08:37.952479', '127.0.0.1', '12', '心理服务平台', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('39', '2018-06-03 10:09:21.705710', '127.0.0.1', '13', '学生邮箱', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('40', '2018-06-04 08:00:40.432635', '127.0.0.1', '14', 'One', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('41', '2018-06-04 08:01:52.459936', '127.0.0.1', '15', 'Rainy mood', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('42', '2018-06-04 08:02:38.648995', '127.0.0.1', '6', '知识补给站', 'create', '已添加。', '18', '2');
INSERT INTO `xadmin_log` VALUES ('43', '2018-06-04 08:03:00.746373', '127.0.0.1', null, '', 'delete', '批量删除 1 个 link category', null, '2');
INSERT INTO `xadmin_log` VALUES ('44', '2018-06-04 08:04:59.630824', '127.0.0.1', null, '', 'delete', '批量删除 1 个 link', null, '2');
INSERT INTO `xadmin_log` VALUES ('45', '2018-06-04 08:05:40.530459', '127.0.0.1', '7', '编程指南', 'create', '已添加。', '18', '2');
INSERT INTO `xadmin_log` VALUES ('46', '2018-06-04 08:06:07.242886', '127.0.0.1', '16', '菜鸟教程', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('47', '2018-06-04 08:06:29.924034', '127.0.0.1', '17', 'Github', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('48', '2018-06-04 08:06:54.999278', '127.0.0.1', '18', 'Udacity', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('49', '2018-06-04 08:09:06.365743', '127.0.0.1', '19', 'IMooc', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('50', '2018-06-04 08:09:25.819480', '127.0.0.1', '20', '实验楼', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('51', '2018-06-04 08:09:53.491733', '127.0.0.1', '21', 'StackOverflow', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('52', '2018-06-04 08:10:09.924272', '127.0.0.1', '22', 'Leetcode', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('53', '2018-06-04 08:10:36.001269', '127.0.0.1', '23', 'Free Code Camp', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('54', '2018-06-04 08:12:16.130922', '127.0.0.1', '24', 'V2EX', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('55', '2018-06-04 08:12:33.183751', '127.0.0.1', '25', 'CSDN', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('56', '2018-06-04 08:12:52.881209', '127.0.0.1', '26', 'SegmentFault', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('57', '2018-06-04 08:14:04.956390', '127.0.0.1', '27', '果壳', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('58', '2018-06-04 08:14:19.650700', '127.0.0.1', '28', '水木社区', 'create', '已添加。', '17', '2');
INSERT INTO `xadmin_log` VALUES ('59', '2018-06-06 00:59:25.424441', '127.0.0.1', '3', 'css -- img 等比例自动缩放', 'change', '修改 body，image 和 created_time', '6', '2');
INSERT INTO `xadmin_log` VALUES ('60', '2018-06-06 01:02:48.695267', '127.0.0.1', '3', 'css -- img 等比例自动缩放', 'change', '修改 image', '6', '2');
INSERT INTO `xadmin_log` VALUES ('61', '2018-06-06 01:28:05.968416', '127.0.0.1', '3', 'css -- img 等比例自动缩放', 'change', '修改 image', '6', '2');
INSERT INTO `xadmin_log` VALUES ('62', '2018-06-06 08:23:08.932951', '127.0.0.1', '3', 'css -- img 等比例自动缩放', 'change', '修改 image', '6', '2');
INSERT INTO `xadmin_log` VALUES ('63', '2018-06-06 08:31:52.920769', '127.0.0.1', '2', 'Django -- xadmin 自定义右侧菜单栏', 'change', '修改 body，image 和 created_time', '6', '2');
INSERT INTO `xadmin_log` VALUES ('64', '2018-06-06 08:32:12.708902', '127.0.0.1', '5', 'django -- ajax 403 错误', 'change', '修改 body 和 image', '6', '2');
INSERT INTO `xadmin_log` VALUES ('65', '2018-06-06 08:32:34.330384', '127.0.0.1', null, '', 'delete', '批量删除 1 个 article', null, '2');
INSERT INTO `xadmin_log` VALUES ('66', '2018-06-07 00:59:57.246836', '127.0.0.1', '2', 'Django -- xadmin 自定义右侧菜单栏', 'change', '修改 body', '6', '2');
INSERT INTO `xadmin_log` VALUES ('67', '2018-06-07 01:01:06.967638', '127.0.0.1', '3', 'css -- img 等比例自动缩放', 'change', '修改 body', '6', '2');
INSERT INTO `xadmin_log` VALUES ('68', '2018-06-07 01:01:41.718291', '127.0.0.1', '5', 'django -- ajax 403 错误', 'change', '修改 body', '6', '2');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_user_profile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '2');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
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

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
