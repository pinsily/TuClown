# Generated by Django 2.0.2 on 2018-06-03 09:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_auto_20180603_1150'),
    ]

    operations = [
        migrations.CreateModel(
            name='Link',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, verbose_name='链接名')),
                ('url', models.URLField(blank=True, default='http://blog.pinsily.site', verbose_name='链接地址')),
                ('image', models.URLField(blank=True, default='http://owgxfd8jv.bkt.clouddn.com/HollowRock.jpg', null=True, verbose_name='链接图片')),
                ('qrcode', models.ImageField(blank=True, default='head_imgs/default.jpg', null=True, upload_to='qrcode', verbose_name='链接二维码')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('modified_time', models.DateTimeField(auto_now=True, verbose_name='修改时间')),
            ],
            options={
                'db_table': 'link',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='LinkCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='类名')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('modified_time', models.DateTimeField(auto_now=True, verbose_name='修改时间')),
            ],
            options={
                'db_table': 'linkcategory',
                'ordering': ['name'],
            },
        ),
        migrations.AlterField(
            model_name='article',
            name='tags',
            field=models.ManyToManyField(blank=True, to='blog.Tag', verbose_name='标签集'),
        ),
        migrations.AddField(
            model_name='link',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.LinkCategory', verbose_name='链接分类'),
        ),
    ]
