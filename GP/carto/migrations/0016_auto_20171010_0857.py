# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-10 06:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0015_video'),
    ]

    operations = [
        migrations.AddField(
            model_name='projet',
            name='client',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='projet',
            name='contactclient',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
