# Generated by Django 2.0.6 on 2018-06-07 00:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0012_auto_20180606_1620'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='body',
            field=models.TextField(verbose_name='正文'),
        ),
    ]
