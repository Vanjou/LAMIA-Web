# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-04 09:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0004_auto_20171004_1125'),
    ]

    operations = [
        migrations.AlterField(
            model_name='data',
            name='datedestruction',
            field=models.DateField(blank=True),
        ),
    ]
