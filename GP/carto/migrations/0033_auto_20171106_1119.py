# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-06 10:19
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0032_auto_20171106_1115'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tcobjetzonegeo',
            name='zonemenacee',
        ),
        migrations.RemoveField(
            model_name='tcobjetzonegeo',
            name='zonetraversee',
        ),
        migrations.AddField(
            model_name='tcobjetzonegeo',
            name='zoneTraverseeOuMenacee',
            field=models.CharField(default='0', max_length=255),
        ),
    ]
