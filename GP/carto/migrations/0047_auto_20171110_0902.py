# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-10 08:02
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0046_auto_20171109_1708'),
    ]

    operations = [
        migrations.AddField(
            model_name='infralineaire',
            name='lk_noeud1',
            field=models.ForeignKey(blank=True, db_column='id_noeud1', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='lk_noeud1', to='carto.Noeud'),
        ),
        migrations.AddField(
            model_name='infralineaire',
            name='lk_noeud2',
            field=models.ForeignKey(blank=True, db_column='id_noeud2', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='lk_noeud2', to='carto.Noeud'),
        ),
    ]
