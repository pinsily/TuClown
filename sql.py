# -*- coding: utf-8 -*-
"""
-------------------------------------------------
   Filename：      sql
   Author :        pinsily
   date：          18.12.11 20:38
   Description :
-------------------------------------------------
"""
import pymysql
import re


def get_connection():
    """
    获取数据库连接

    :return: db connection
    """
    conn_info = {
        "host": "localhost",
        "user": "root",
        "password": "pinsily",
        "db": "tuclown",
        "charset": "utf8",
        "port": 3306
    }
    try:
        return pymysql.connect(**conn_info)
    except ConnectionAbortedError:
        print("database connect fail!")

    except ConnectionRefusedError:
        print("database connect refused")


def close_connection(db, cursor):
    """close connection

    :param db: db connection
    :param cursor: db cursor
    :return: Null
    """
    cursor.close()
    db.close()


def update_qiniuyun_link():
    """更新七牛云测试外链，换成自定义域名

    2018.12.11

    django:
    http://p9w6udf2c.bkt.clouddn.com --> http://csn.pinsily.site

    story:
    http://owgxfd8jv.bkt.clouddn.com --> http://cdn.pinsily.site

    :return: Null
    """
    db = get_connection()
    cursor = db.cursor()

    cursor.execute("select * from article")

    data = cursor.fetchall()

    for d in data:
        text = d[2]
        id = d[0]
        if "http://owgxfd8jv.bkt.clouddn.com" in text:
            text = str(text.replace("http://owgxfd8jv.bkt.clouddn.com", "http://cdn.pinsily.site"))
            update_sql = """update article set body="{0}" where id={1}""".format(text, id)
            cursor.execute(update_sql)
            # article = models.Article.objects.get(id=id)
            # article.body = text
            # article.save()
        if "http://p9w6udf2c.bkt.clouddn.com" in text:
            text = str(text.replace("http://p9w6udf2c.bkt.clouddn.com", "http://csn.pinsily.site"))
            update_sql = """update article set body="{0}" where id={1}""".format(text, id)
            cursor.execute(update_sql)

    close_connection(db, cursor)


update_qiniuyun_link()
