# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-05 07:48
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0009_layer_id_objet'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rapport',
            name='file',
        ),
    ]
