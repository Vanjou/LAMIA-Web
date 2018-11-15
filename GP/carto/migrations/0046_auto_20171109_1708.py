# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-09 16:08
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0045_auto_20171109_1701'),
    ]

    operations = [
        migrations.AddField(
            model_name='bdd',
            name='lk_marche',
            field=models.ForeignKey(blank=True, db_column='id_marche', null=True, on_delete=django.db.models.deletion.CASCADE, to='carto.Marche'),
        ),
        migrations.AddField(
            model_name='modele',
            name='lk_marche',
            field=models.ForeignKey(blank=True, db_column='id_marche', null=True, on_delete=django.db.models.deletion.CASCADE, to='carto.Marche'),
        ),
        migrations.AddField(
            model_name='photo',
            name='lk_marche',
            field=models.ForeignKey(blank=True, db_column='id_marche', null=True, on_delete=django.db.models.deletion.CASCADE, to='carto.Marche'),
        ),
        migrations.AddField(
            model_name='rapport',
            name='lk_marche',
            field=models.ForeignKey(blank=True, db_column='id_marche', null=True, on_delete=django.db.models.deletion.CASCADE, to='carto.Marche'),
        ),
        migrations.AddField(
            model_name='topographie',
            name='lk_marche',
            field=models.ForeignKey(blank=True, db_column='id_marche', null=True, on_delete=django.db.models.deletion.CASCADE, to='carto.Marche'),
        ),
    ]
