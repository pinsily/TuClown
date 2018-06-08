

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, verbose_name='标题')),
                ('body', models.TextField(verbose_name='正文')),
                ('image', models.FileField(upload_to='')),
                ('created_time', models.DateTimeField(verbose_name='创建时间')),

                ('modified_time', models.DateTimeField(
                    auto_now=True, verbose_name='修改时间')),
                ('status', models.CharField(choices=[
                 ('d', 'draft'), ('p', 'publish')], max_length=1, verbose_name='文章状态')),
                ('abstract', models.CharField(blank=True,
                                              max_length=54, null=True, verbose_name='摘要')),
                ('views', models.PositiveIntegerField(
                    default=0, verbose_name='浏览量')),
                ('likes', models.PositiveIntegerField(
                    default=0, verbose_name='点赞数')),
                ('topped', models.BooleanField(default=False, verbose_name='置顶')),
                ('author', models.CharField(default='pinsily',
                                            max_length=100, verbose_name='作者')),
            ],
            options={
                'db_table': 'article',
                'ordering': ['-created_time'],
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='类名')),
                ('created_time', models.DateTimeField(
                    auto_now_add=True, verbose_name='创建时间')),
                ('modified_time', models.DateTimeField(
                    auto_now=True, verbose_name='修改时间')),
            ],
            options={
                'db_table': 'category',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('user_name', models.CharField(max_length=100, verbose_name='评论者名字')),
                ('user_email', models.EmailField(blank=True,
                                                 max_length=50, null=True, verbose_name='邮箱地址')),
                ('body', models.TextField(verbose_name='评论内容')),
                ('created_time', models.DateTimeField(
                    auto_now_add=True, verbose_name='评论发表时间')),
                ('user_head', models.ImageField(default='head_imgs/default.jpg',
                                                upload_to='head_imgs', verbose_name='用户头像')),
                ('user_url', models.URLField(blank=True,
                                             max_length=100, null=True, verbose_name='个人网页地址')),
                ('article', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE, to='blog.Article', verbose_name='评论所属文章')),
                ('pid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE,
                                          to='blog.Comment', verbose_name='父级评论')),
            ],
            options={
                'db_table': 'comment',
            },
        ),
        migrations.CreateModel(
            name='Link',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, verbose_name='链接名')),
                ('url', models.URLField(blank=True,
                                        default='http://blog.pinsily.site', verbose_name='链接地址')),
                ('created_time', models.DateTimeField(
                    auto_now_add=True, verbose_name='创建时间')),
                ('modified_time', models.DateTimeField(
                    auto_now=True, verbose_name='修改时间')),
            ],
            options={
                'db_table': 'link',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='LinkCategory',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='类名')),
                ('created_time', models.DateTimeField(
                    auto_now_add=True, verbose_name='创建时间')),
                ('modified_time', models.DateTimeField(
                    auto_now=True, verbose_name='修改时间')),
            ],
            options={
                'db_table': 'linkcategory',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(

            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='标签名')),
                ('created_time', models.DateTimeField(
                    auto_now_add=True, verbose_name='创建时间')),
                ('modified_time', models.DateTimeField(
                    auto_now=True, verbose_name='修改时间')),
            ],
            options={
                'db_table': 'tag',
                'ordering': ['name'],
            },
        ),
        migrations.AddField(
            model_name='link',
            name='category',
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE, to='blog.LinkCategory', verbose_name='链接分类'),
        ),
        migrations.AddField(

            model_name='article',
            name='category',
            field=models.ForeignKey(
                null=True, on_delete=django.db.models.deletion.SET_NULL, to='blog.Category', verbose_name='分类'),
        ),
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.ManyToManyField(
                blank=True, to='blog.Tag', verbose_name='标签集'),

        ),
    ]
