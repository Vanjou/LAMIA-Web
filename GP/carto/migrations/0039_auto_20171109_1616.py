# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-09 15:16
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0038_auto_20171109_1611'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='video',
            name='id_objet',
        ),
        migrations.RemoveField(
            model_name='video',
            name='id_ressource',
        ),
        migrations.DeleteModel(
            name='Video',
        ),
    ]
