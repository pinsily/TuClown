<<<<<<< HEAD
# -*- coding:utf-8 -*-
import pymysql
import codecs
import time

import os
import re

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "TuClown.settings")

from TuClown import urls
# from django.utils import timezone
from blog.models import Category


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
            category_list.append(rname)

    # print(category_list)
    return category_list


def get_typecho_article():
    db = pymysql.connect(charset='utf8', host='127.0.0.1',
                         port=3306, user='root', passwd='pinsily', db='typecho_db')
    cursor = db.cursor()
    select_sql = "select * from typecho_contents"
    cursor.execute(select_sql)
    results = cursor.fetchall()
    article_list = []
    for r in results:
        article = []
        title = r[1]
        #created = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(r[3]))
        created_time = r[3]
        modified_time = r[4]
        text = r[5]
        body = text[15:]
        types = r[9]

        #text = text.replace("\r|\n|\\s", "")
        try:
            pattern = re.compile(r'\[1\]: (.*)')
            image_url = pattern.findall(body)[0]
            if image_url.find('\r') != -1:
                image_url = image_url[:-1]

            print(image_url)

        except Exception as e:
            print(e)
            continue

        status = 'p'
        abstract = ''
        pattern_2 = re.compile(r'<center><p>(.*)</p></center>')
        abstract = pattern_2.findall(body)
        print(abstract)
        author = 'pinsily'
        category = ""

        tag = title.split(' ')[0]
        content = '{0} {1} {2}'.format(
            title, created_time, tag)

        # print(content)

    db.close()


def waitr_django_category():
    category_list = get_category()
    for name in category_list:
        Category.objects.create(name=name)


def write_django_article():
    pass


if __name__ == '__main__':
    # waitr_django_category()
    get_typecho_article()
=======
# -*- coding:utf-8 -*-
import pymysql
import codecs
import time

import os
import re

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "TuClown.settings")

from TuClown import urls
# from django.utils import timezone
from blog.models import Category


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
            category_list.append(rname)

    # print(category_list)
    return category_list


def get_typecho_article():
    db = pymysql.connect(charset='utf8', host='127.0.0.1',
                         port=3306, user='root', passwd='pinsily', db='typecho_db')
    cursor = db.cursor()
    select_sql = "select * from typecho_contents"
    cursor.execute(select_sql)
    results = cursor.fetchall()
    article_list = []
    for r in results:
        article = []
        title = r[1]
        #created = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(r[3]))
        created_time = r[3]
        modified_time = r[4]
        text = r[5]
        body = text[15:]
        types = r[9]

        #text = text.replace("\r|\n|\\s", "")
        try:
            pattern = re.compile(r'\[1\]: (.*)')
            image_url = pattern.findall(body)[0]
            if image_url.find('\r') != -1:
                image_url = image_url[:-1]

            print(image_url)

        except Exception as e:
            print(e)
            continue

        status = 'p'
        abstract = ''
        pattern_2 = re.compile(r'<center><p>(.*)</p></center>')
        abstract = pattern_2.findall(body)
        print(abstract)
        author = 'pinsily'
        category = ""

        tag = title.split(' ')[0]
        content = '{0} {1} {2}'.format(
            title, created_time, tag)

        # print(content)

    db.close()


def waitr_django_category():
    category_list = get_category()
    for name in category_list:
        Category.objects.create(name=name)


def write_django_article():
    pass


if __name__ == '__main__':
    # waitr_django_category()
    get_typecho_article()
>>>>>>> dfa1be1e8bf6ee4f8a52e2b475c89765527bcad1
