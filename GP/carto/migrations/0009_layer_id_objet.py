# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-04 12:34
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0008_auto_20171004_1135'),
    ]

    operations = [
        migrations.AddField(
            model_name='layer',
            name='id_objet',
            field=models.ForeignKey(db_column='id_objet', default=10, on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Objet'),
            preserve_default=False,
        ),
    ]
