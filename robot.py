from werobot import WeRoBot
import re
from werobot.replies import ImageReply, TextReply
import glob
import random
import json
import requests
import pymysql

robot = WeRoBot(
    enable_session=False,
    token="peng",
    APP_ID="wxa0a58116dcf4cd55",
    APP_SECRET="959ea02a534775fadf5c62709134b74f"
)

client = robot.client


@robot.text
def hello(message):
    content = message.content
    if content == '1':
        send_image = client.upload_media(media_type='image', media_file=open(get_image(), 'rb'))
        return ImageReply(message=message, media_id=send_image['media_id'])
    elif content == '2':
        return TextReply(message=message, content=get_sentence())
    elif content == "3":
        return TextReply(message=message, content=get_duanzi())
    else:
        return TextReply(message=message, content='继续翻')


def get_image():
    return random.choice(glob.glob("stickers/*"))


@robot.filter(re.compile(".*?bb.*?"))
def b():
    return "正文中含有 bb "


def get_sentence():
    data = json.loads(requests.get("https://api.lwl12.com/hitokoto/v1?encode=realjson").text)

    author = data['author']
    text = data['text']
    source = data['source']

    if author or source:
        return "{0} -- 《{1}》 {2}".format(text, source, author)

    return text


@robot.subscribe
def subscribe(message):
    return "a clown with tulip\n【1】表情包\n【2】句子迷\n【3】段子"


def get_duanzi():
    connection = pymysql.connect(host='localhost', user='root', password='pinsily', db='duanzi')
    with connection.cursor() as cursor:
        sql = "select content from duanzi order by rand() limit 1"
        cursor.execute(sql)
        result = cursor.fetchone()
        return result[0]

    connection.close()
