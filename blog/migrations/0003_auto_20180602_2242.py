# Generated by Django 2.0.2 on 2018-06-02 14:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0002_auto_20180602_0950'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='article',
            name='tags',
        ),
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.ManyToManyField(blank=True, null=True, to='blog.Tag', verbose_name='标签集'),
        ),
    ]
