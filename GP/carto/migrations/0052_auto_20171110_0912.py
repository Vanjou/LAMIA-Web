# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-10 08:12
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0051_auto_20171110_0911'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tcobjetintervenant',
            name='id_tcoobjet',
            field=models.ForeignKey(db_column='id_tcobjet', on_delete=django.db.models.deletion.CASCADE, to='carto.Objet'),
        ),
        migrations.AlterField(
            model_name='tcobjetressource',
            name='id_tcoobjet',
            field=models.ForeignKey(db_column='id_tcobjet', on_delete=django.db.models.deletion.CASCADE, to='carto.Objet'),
        ),
    ]