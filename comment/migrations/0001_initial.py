# Generated by Django 2.0.6 on 2018-06-28 13:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('blog', '0014_auto_20180628_2136'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_name', models.CharField(max_length=100, verbose_name='评论者名字')),
                ('user_email', models.EmailField(blank=True, max_length=50, null=True, verbose_name='邮箱地址')),
                ('body', models.TextField(verbose_name='评论内容')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('modified_time', models.DateTimeField(auto_now=True, verbose_name='修改时间')),
                ('article', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Article', verbose_name='评论所属文章')),
                ('pid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comment.Comment', verbose_name='父级评论')),
            ],
            options={
                'db_table': 'comment',
            },
        ),
    ]