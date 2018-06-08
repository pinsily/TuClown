# -*- coding:utf-8 -*-
import pymysql
import codecs
import time

#from TuClown import urls
# from django.utils import timezone
import models


def get_category():
    db = pymysql.connect(charset='utf8', host='127.0.0.1',
                         port=3306, user='root', passwd='pinsily', db='typecho_db')
    cursor = db.cursor()
    select_sql = "select * from typecho_metas"
    cursor.execute(select_sql)
    results = cursor.fetchall()

    category_list = []

    for r in results:
        rname = r[1]
        rtype = r[3]
        #print(rname, rtype)

        if rtype == 'category':
            models.category_list.append(rname)

    # print(category_list)
    return category_list


def get_typecho():
    db = pymysql.connect(charset='utf8', host='127.0.0.1',
                         port=3306, user='root', passwd='pinsily', db='typecho_db')
    cursor = db.cursor()
    select_sql = "select * from typecho_contents"
    cursor.execute(select_sql)
    results = cursor.fetchall()
    i = 1
    for r in results:
        cid = r[0]
        title = r[1]
        #created = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(r[3]))
        created_time = r[3]
        modified_time = r[4]
        text = r[5]
        body = text[15:]
        types = r[9]

        tag = title.split(' ')[0]
        content = '{0} {1} {2}'.format(
            title, created_time, tag)

        print(content)

    db.close()


def waitr_django_category():
    category_list = get_category()
    for name in category_list:
        Category.object.create(name=name)


def write_django_article():
    db = pymysql.connect(charset='utf8', host='127.0.0.1',
                         port=3306, user='root', passwd='pinsily', db='tuclown')
    cursor = db.cursor()

    # SQL 插入语句
    sql = """INSERT INTO article(title, body, image, created_time, modified_time, status, abstract, author, category)
             VALUES ('python -- 调用 shell 命令', 'hello','http://baidu.com', '1524188510', '1524188510', 'p', 'ddddd', 'pinsily', '2')"""
    # try:
    # 执行sql语句
    cursor.execute(sql)
    # 提交到数据库执行
    db.commit()
    print('charucheng')
    # except:
    # print('something')
    # 如果发生错误则回滚
    # db.rollback()

    # 关闭数据库连接
    db.close()


def write_md(title, content):
    title_one = title + '.md'
    with codecs.open(title_one, 'w', "utf-8-sig") as f:
        f.write(content)
    print("文章 {0}.md 生成".format(title))


# read_text()
# get_category()
# write_django_article()
# waitr_django_category()

if __name__ == '__main__':
    waitr_django_category()
