# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-17 08:12
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0019_auto_20171016_1429'),
    ]

    operations = [
        migrations.AddField(
            model_name='objet',
            name='lk_ZoneGeo',
            field=models.ManyToManyField(null=True, through='carto.Tcobjetzonegeo', to='carto.Zonegeo'),
        ),
    ]