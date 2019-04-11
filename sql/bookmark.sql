/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : 39.108.166.59:3306
 Source Schema         : tuclown

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 11/04/2019 13:03:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bookmark
-- ----------------------------
DROP TABLE IF EXISTS `bookmark`;
CREATE TABLE `bookmark`  (
  `commonclass_ptr_id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`commonclass_ptr_id`) USING BTREE,
  INDEX `bookmark_cate_id_c8a5bc18_fk_nav_category_commonclass_ptr_id`(`cate_id`) USING BTREE,
  CONSTRAINT `bookmark_cate_id_c8a5bc18_fk_nav_category_commonclass_ptr_id` FOREIGN KEY (`cate_id`) REFERENCES `nav_category` (`commonclass_ptr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bookmark_commonclass_ptr_id_1c88c775_fk_Navigatio` FOREIGN KEY (`commonclass_ptr_id`) REFERENCES `Navigation_commonclass` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookmark
-- ----------------------------
INSERT INTO `bookmark` VALUES (2, 'EagleGet', 'http://www.eagleget.com/', 'bookmark/uploads/eagleget.jpg', '下载器', 1);
INSERT INTO `bookmark` VALUES (4, 'W3School', 'http://www.w3school.com.cn/', 'bookmark/uploads/w3school.jpg', '在 w3school，你可以找到你所需要的所有的网站建设教程', 3);
INSERT INTO `bookmark` VALUES (6, '落网', 'http://www.luoo.net/', 'bookmark/uploads/luowang.jpg', '落网是一个推荐国内外独立音乐的网站', 5);
INSERT INTO `bookmark` VALUES (7, '7-zip', 'https://www.7-zip.org/', 'bookmark/uploads/7-zip.png', '小巧轻便的压缩软件', 1);
INSERT INTO `bookmark` VALUES (8, 'Anaconda', 'https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/', 'bookmark/uploads/anaconda.jpg', 'python机器学习开发集成', 43);
INSERT INTO `bookmark` VALUES (9, '百度网盘', 'http://pan.baidu.com/download', 'bookmark/uploads/baidunet.jpg', '百度网盘客户端', 1);
INSERT INTO `bookmark` VALUES (10, 'Chrome', 'https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=en', 'bookmark/uploads/chrome.jpg', 'Google Chrome is a fast, free web browser', 1);
INSERT INTO `bookmark` VALUES (11, '网易云音乐', 'https://music.163.com/#/download', 'bookmark/uploads/netmusic.png', '动心音乐，时刻与你相伴', 1);
INSERT INTO `bookmark` VALUES (12, 'Clover', 'http://cn.ejie.me/', 'bookmark/uploads/clover.jpg', 'Clover 是 Windows Explorer 资源管理器的一个扩展，为其增加类似谷歌 Chrome 浏览器的多标签页功能', 1);
INSERT INTO `bookmark` VALUES (13, 'DiskGenius', 'http://www.diskgenius.cn/download.php', 'bookmark/uploads/diskgenius.jpg', '数据恢复及分区管理工具', 1);
INSERT INTO `bookmark` VALUES (14, 'Ditto', 'https://ditto-cp.sourceforge.io/', 'bookmark/uploads/ditto.jpg', '剪贴板管理工具', 1);
INSERT INTO `bookmark` VALUES (15, 'Everything', 'https://www.voidtools.com/downloads/', 'bookmark/uploads/everything.png', '速度超快的文件检索工具', 1);
INSERT INTO `bookmark` VALUES (16, 'Flux', 'https://justgetflux.com/', 'bookmark/uploads/flux.jpg', '根据时间自动调节电脑屏幕的亮度', 1);
INSERT INTO `bookmark` VALUES (17, 'Git', 'https://git-scm.com/downloads', 'bookmark/uploads/git.png', '版本控制工具', 43);
INSERT INTO `bookmark` VALUES (18, 'IDEA', 'https://www.jetbrains.com/idea/', 'bookmark/uploads/idea.png', 'Java开发IDE', 43);
INSERT INTO `bookmark` VALUES (19, 'MySQL', 'https://www.mysql.com/downloads/', 'bookmark/uploads/mysql.png', '关系性数据库', 43);
INSERT INTO `bookmark` VALUES (20, 'Navicat', 'https://www.navicat.com/en/download/navicat-for-mysql', 'bookmark/uploads/navicat.jpg', '数据库IDE', 43);
INSERT INTO `bookmark` VALUES (21, '坚果云', 'https://www.jianguoyun.com/s/downloads', 'bookmark/uploads/nut.jpg', '坚果云是一款提供网盘|云盘|云服务的团队协助软件,可随时随地实现共享文件夹', 1);
INSERT INTO `bookmark` VALUES (22, 'PanDownload', 'https://pandownload.com/', 'bookmark/uploads/pandownload.jpg', '百度网盘高速下载器', 1);
INSERT INTO `bookmark` VALUES (23, 'Photoshop', 'https://www.adobe.com/cn/downloads.html?promoid=RL89NGY7&mv=other', 'bookmark/uploads/ps.png', '图片处理工具', 1);
INSERT INTO `bookmark` VALUES (24, 'PotPlayer', 'https://potplayer.daum.net/', 'bookmark/uploads/potplayer.jpg', '多功能视频播放器', 1);
INSERT INTO `bookmark` VALUES (25, 'PyCharm', 'https://www.jetbrains.com/pycharm/download/#section=windows', 'bookmark/uploads/pycharm.png', 'python IDE', 43);
INSERT INTO `bookmark` VALUES (26, 'Seer', 'http://1218.io/', 'bookmark/uploads/seer.png', '空格一键预览文件', 1);
INSERT INTO `bookmark` VALUES (27, 'ShadowSocks', 'https://github.com/shadowsocks/shadowsocks-windows/releases', 'bookmark/uploads/shadowsock.png', 'shadowsocks window客户端', 1);
INSERT INTO `bookmark` VALUES (28, 'Snipaste', 'https://www.snipaste.com/download.html', 'bookmark/uploads/snipaste.png', '多功能截图工具', 1);
INSERT INTO `bookmark` VALUES (29, 'Sublime Text', 'https://www.sublimetext.com/3', 'bookmark/uploads/sublime.jpg', '可插件式编辑器', 43);
INSERT INTO `bookmark` VALUES (30, '火绒', 'https://www.huorong.cn/', 'bookmark/uploads/huuorong.jpg', '安全软件 -- 深度融合反病毒+主动防御+防火墙', 1);
INSERT INTO `bookmark` VALUES (31, 'TIM', 'https://tim.qq.com/download.html', 'bookmark/uploads/TIM.png', 'QQ办公版客户端', 1);
INSERT INTO `bookmark` VALUES (32, 'Telegram', 'https://desktop.telegram.org/', 'bookmark/uploads/telgram.jpg', '全程加密聊天软件', 1);
INSERT INTO `bookmark` VALUES (33, 'Ultraiso', 'https://ultraiso.en.softonic.com/', 'bookmark/uploads/ultraiso.jpg', 'U盘刻录工具', 1);
INSERT INTO `bookmark` VALUES (34, 'Wechat', 'https://pc.weixin.qq.com/?lang=zh', 'bookmark/uploads/wechat.png', '微信聊天客户端', 1);
INSERT INTO `bookmark` VALUES (35, 'YourUninstaller', 'http://www.ursoftware.com/product/uninstaller/download.htm', 'bookmark/uploads/Your_Uninstaller.jpg', '软件卸载工具', 1);
INSERT INTO `bookmark` VALUES (36, '人人影视', 'http://app.zimuzu.io/', 'bookmark/uploads/YYeTs.jpg', '刷外剧神器', 1);
INSERT INTO `bookmark` VALUES (37, 'Tickeys', 'http://www.yingdev.com/projects/tickeys', 'bookmark/uploads/Tickeys.jpg', '模拟键盘敲击声', 1);
INSERT INTO `bookmark` VALUES (38, '小书匠', 'http://soft.xiaoshujiang.com/download/', 'bookmark/uploads/story.png', '支持图床、笔记同步的Markdown编辑器', 1);
INSERT INTO `bookmark` VALUES (39, 'Winscp', 'https://winscp.net/eng/download.php', 'bookmark/uploads/winscp.jpg', '远程连接工具', 43);
INSERT INTO `bookmark` VALUES (40, 'Putty', 'https://www.putty.org/', 'bookmark/uploads/putty.png', 'SSH远程连接工具', 43);
INSERT INTO `bookmark` VALUES (41, 'Listary', 'https://www.listary.com/download', 'bookmark/uploads/listary.jpg', 'Listary是一款用于Windows的文件名定位/搜索辅助软件', 1);
INSERT INTO `bookmark` VALUES (44, '网易云音乐', 'https://music.163.com/', 'bookmark/uploads/netmusic_nqf0Pww.png', '网易云音乐在线版', 5);
INSERT INTO `bookmark` VALUES (45, '虾米音乐', 'https://www.xiami.com/', 'bookmark/uploads/xiami.png', '虾米音乐，听见不同', 5);
INSERT INTO `bookmark` VALUES (46, '酷狗音乐', 'https://www.kugou.com/', 'bookmark/uploads/kugou.jpg', '酷狗音乐，就是歌多', 5);
INSERT INTO `bookmark` VALUES (47, 'Otohibi', 'https://otohibi.com/', 'bookmark/uploads/otohibi.png', '每天，多一点噪音', 5);
INSERT INTO `bookmark` VALUES (48, 'Voicer', 'http://www.voicer.me/', 'bookmark/uploads/voicer.jpg', '分享生活和设计的美学', 5);
INSERT INTO `bookmark` VALUES (49, 'Focusmusic', 'https://focusmusic.fm/', 'bookmark/uploads/focusmusic.jpg', 'beats for work, productivity, flow', 5);
INSERT INTO `bookmark` VALUES (51, '一早一晚', 'https://yizaoyiwan.com/', 'bookmark/uploads/yizaoyiwan.jpg', '只工作，不上班', 50);
INSERT INTO `bookmark` VALUES (52, 'V2EX', 'https://www.v2ex.com/', 'bookmark/uploads/v2ex.jpg', '分享与探索', 50);
INSERT INTO `bookmark` VALUES (53, 'SegmentFault', 'https://segmentfault.com/', 'bookmark/uploads/sf.png', '思否为开发者提供问答、学习与交流编程知识的平台，创造属于开发者的时代！', 50);
INSERT INTO `bookmark` VALUES (54, 'Stackoverflow', 'https://stackoverflow.com/', 'bookmark/uploads/Stackoverflow.png', 'Stack Overflow is a privately held website, the flagship site of the Stack Exchange Network', 50);
INSERT INTO `bookmark` VALUES (55, '水木社区', 'http://www.newsmth.net/nForum/#!mainpage', 'bookmark/uploads/shuimushequ.jpg', '源于清华的高知社群', 50);
INSERT INTO `bookmark` VALUES (56, '知乎', 'https://www.zhihu.com/', 'bookmark/uploads/zhihu.jpg', '有问题，上知乎', 50);
INSERT INTO `bookmark` VALUES (57, 'Quora', 'https://www.quora.com/', 'bookmark/uploads/quora.jpg', '国外版知乎', 50);
INSERT INTO `bookmark` VALUES (58, 'Reddit', 'https://www.reddit.com/', 'bookmark/uploads/reddit.jpg', '国外版贴吧', 50);
INSERT INTO `bookmark` VALUES (59, '豆瓣', 'https://www.douban.com/', 'bookmark/uploads/douban.jpg', '提供图书、电影、音乐唱片的推荐、评论和价格比较，以及城市独特的文化生活', 50);
INSERT INTO `bookmark` VALUES (60, '煎蛋', 'http://jandan.net/', 'bookmark/uploads/jiandan.jpg', '地球上没有新鲜事', 50);
INSERT INTO `bookmark` VALUES (62, 'MAKA', 'http://maka.im/', 'bookmark/uploads/maka.jpg', 'H5动画制作', 61);
INSERT INTO `bookmark` VALUES (63, '百度脑图', 'http://naotu.baidu.com/', 'bookmark/uploads/baidunaotu.png', '便捷的脑图编辑工具', 61);
INSERT INTO `bookmark` VALUES (64, 'Processon', 'https://www.processon.com/', 'bookmark/uploads/processon.jpg', '免费在线作图，实时协作', 61);
INSERT INTO `bookmark` VALUES (65, '正则测试', 'http://tool.oschina.net/regex/', 'bookmark/uploads/zhengze.png', '在线正则表达式测试', 61);
INSERT INTO `bookmark` VALUES (67, '清华镜像', 'https://mirrors.tuna.tsinghua.edu.cn/', 'bookmark/uploads/qinghua.png', '常用发行版 iso 和应用工具安装包直接下载', 66);
INSERT INTO `bookmark` VALUES (69, '小众软件', 'https://www.appinn.com/', 'bookmark/uploads/xiaozhongruanjian.png', '分享免费、小巧、使用、有趣、绿色的软件', 68);
INSERT INTO `bookmark` VALUES (70, '幕布', 'https://mubu.com/', 'bookmark/uploads/mubu.png', '极简大纲笔记 | 一键生成思维导图', 61);
INSERT INTO `bookmark` VALUES (71, '百度统计', 'https://tongji.baidu.com', 'bookmark/uploads/baidutongji.png', '集合网站、APP、线下零售统计，汇聚成全面的数据分析平台', 61);
INSERT INTO `bookmark` VALUES (72, 'DevDocs', 'https://devdocs.io/', 'bookmark/uploads/DevDocs.jpg', '在线技术API文档查询', 61);
INSERT INTO `bookmark` VALUES (73, 'Prezi', 'https://prezi.com/', 'bookmark/uploads/prezi.jpg', '动态PPT制作', 61);
INSERT INTO `bookmark` VALUES (75, 'Easyicon', 'https://www.easyicon.net/', 'bookmark/uploads/Easyicon.jpg', '提供☆超过五十万个☆SVG、PNG、ICO、ICNS格式图标搜索、图标下载服务', 74);
INSERT INTO `bookmark` VALUES (76, 'Quackit', 'https://www.quackit.com/', 'bookmark/uploads/quackit.png', '前端模板下载', 3);
INSERT INTO `bookmark` VALUES (77, 'Codepen', 'https://codepen.io/', 'bookmark/uploads/Codepen.png', 'CodePen is a social development environment for front-end designers and developers', 3);
INSERT INTO `bookmark` VALUES (78, 'Bootstrap', 'https://getbootstrap.com/docs/3.3/getting-started/', 'bookmark/uploads/bootstrap.png', 'Bootstrap 官方开发文档', 3);
INSERT INTO `bookmark` VALUES (80, '二进制包', 'https://www.lfd.uci.edu/~gohlke/pythonlibs/', 'bookmark/uploads/no.png', 'Unofficial Windows Binaries for Python Extension Packages', 79);
INSERT INTO `bookmark` VALUES (81, '百度舆论API', 'https://cloud.baidu.com/product/byapi.html', 'bookmark/uploads/baiduyulun.jpg', '提供实时舆情数据、智能语义分析、百度搜索指数及全网用户画像等数据分析能力', 61);
INSERT INTO `bookmark` VALUES (82, 'Crx4Chrome', 'https://www.crx4chrome.com', 'bookmark/uploads/Crx4Chrome.png', 'Chrome crx 插件下载', 66);
INSERT INTO `bookmark` VALUES (83, 'MSDN', 'https://msdn.itellyou.cn/', 'bookmark/uploads/msdn.png', 'microsoft 原版镜像下载', 66);
INSERT INTO `bookmark` VALUES (84, 'Ping检测', 'http://ping.chinaz.com/', 'bookmark/uploads/chinaz.jpg', '以多个地点Ping服务器以检测服务器响应速度', 61);
INSERT INTO `bookmark` VALUES (85, '经纬度查询', 'http://www.gpsspg.com/maps.htm', 'bookmark/uploads/gpsspg.jpg', '在线经纬度查询', 61);
INSERT INTO `bookmark` VALUES (86, '字由', 'http://www.hellofont.cn/', 'bookmark/uploads/ziyou.jpg', '字体搜罗网站', 3);
INSERT INTO `bookmark` VALUES (87, 'JSRUN', 'http://jsrun.net/', 'bookmark/uploads/jsrun.png', 'js在线编辑器', 3);
INSERT INTO `bookmark` VALUES (88, 'IconFont', 'https://www.iconfont.cn/', 'bookmark/uploads/iconfont.png', '阿里巴巴矢量图标库', 74);
INSERT INTO `bookmark` VALUES (89, 'Uzer', 'https://uzer.me/', 'bookmark/uploads/uzer.jpg', '云端超级应用空间--office', 61);
INSERT INTO `bookmark` VALUES (90, 'TAAG', 'http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something', 'bookmark/uploads/no_bXCDIEe.png', 'Text to ASCII Art Generator', 61);
INSERT INTO `bookmark` VALUES (91, 'LaTeX公式编辑器', 'https://www.codecogs.com/latex/eqneditor.php?lang=zh-cn', 'bookmark/uploads/latex.png', '在线LaTeX公式编辑器', 61);
INSERT INTO `bookmark` VALUES (92, 'Git Game', 'https://learngitbranching.js.org/', 'bookmark/uploads/git_iyxRfiq.png', 'Learn Git Branching', 79);
INSERT INTO `bookmark` VALUES (93, 'Pythonanywhere', 'https://www.pythonanywhere.com/', 'bookmark/uploads/pythonanywhere.png', 'Host, run, and code Python in the cloud', 79);
INSERT INTO `bookmark` VALUES (94, '优品PPT', 'http://www.ypppt.com/', 'bookmark/uploads/youpin.png', '一个有情怀的免费PPT模板下载网站', 66);
INSERT INTO `bookmark` VALUES (95, 'PInterest', 'https://www.pinterest.com/', 'bookmark/uploads/pinterest.jpg', 'Discover recipes, home ideas, style inspiration and other ideas to try', 74);
INSERT INTO `bookmark` VALUES (96, '500px', 'http://blog.pinsily.site', 'bookmark/uploads/500px.png', '最出色的摄影社区', 74);
INSERT INTO `bookmark` VALUES (97, 'UnSplash', 'https://unsplash.com/', 'bookmark/uploads/UnSplash.png', 'Beautiful, free photos.', 74);
INSERT INTO `bookmark` VALUES (98, 'IconFinder', 'https://www.iconfinder.com/', 'bookmark/uploads/iconfinder.jpg', 'Search through 2,995,721 SVG icons', 74);
INSERT INTO `bookmark` VALUES (100, 'WeaveSilk', 'http://weavesilk.com/', 'bookmark/uploads/weavesilk.png', '基于HTML5的在线绘图特效平台', 99);
INSERT INTO `bookmark` VALUES (101, 'wordArt', 'https://wordart.com/', 'bookmark/uploads/wordart.png', '在线词云生成', 61);
INSERT INTO `bookmark` VALUES (102, 'PixelMap', 'https://pixelmap.amcharts.com/', 'bookmark/uploads/PixelMap.png', '可视化地理图表生成器', 61);
INSERT INTO `bookmark` VALUES (103, 'Mosh', 'https://photomosh.com/', 'bookmark/uploads/photomosh.jpg', '一秒在线生成故障风格海报', 99);
INSERT INTO `bookmark` VALUES (104, 'GeekTyper', 'http://geektyper.com/', 'bookmark/uploads/GeekTyper.jpg', '黑客电脑桌面模拟', 99);
INSERT INTO `bookmark` VALUES (105, 'Stars-Emmision', 'https://wangyasai.github.io/Stars-Emmision/', 'bookmark/uploads/star_emission.png', '在线放射性图片生成', 99);

SET FOREIGN_KEY_CHECKS = 1;
