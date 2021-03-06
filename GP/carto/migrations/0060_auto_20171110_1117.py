# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-10 10:17
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0059_auto_20171110_1107'),
    ]

    operations = [
        migrations.RenameField(
            model_name='observation',
            old_name='avis',
            new_name='commentaires',
        ),
        migrations.RenameField(
            model_name='observation',
            old_name='progression',
            new_name='evolution',
        ),
        migrations.RemoveField(
            model_name='observation',
            name='travauxnecessaires',
        ),
        migrations.AddField(
            model_name='observation',
            name='date',
            field=models.DateField(blank=True, default=datetime.datetime.now),
        ),
        migrations.AddField(
            model_name='observation',
            name='lk_marche',
            field=models.ForeignKey(blank=True, db_column='lk_marche', null=True, on_delete=django.db.models.deletion.CASCADE, to='carto.Marche'),
        ),
        migrations.AddField(
            model_name='observation',
            name='nombre',
            field=models.IntegerField(blank=True, default=1),
        ),
        migrations.AddField(
            model_name='observation',
            name='source',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='observation',
            name='suite',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='observation',
            name='urgence',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
