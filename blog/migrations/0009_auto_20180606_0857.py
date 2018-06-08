# Generated by Django 2.0.6 on 2018-06-06 00:57

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0008_auto_20180605_1924'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='body',
            field=ckeditor_uploader.fields.RichTextUploadingField(),
        ),
        migrations.AlterField(
            model_name='article',
            name='image',
            field=models.FileField(upload_to='blog/media/uploads'),
        ),
    ]
