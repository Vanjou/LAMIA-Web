# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-09 15:24
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0039_auto_20171109_1616'),
    ]

    operations = [
        migrations.CreateModel(
            name='PointTopo',
            fields=[
                ('id_pointTopo', models.AutoField(primary_key=True, serialize=False)),
                ('x', models.DecimalField(blank=True, decimal_places=500, max_digits=999, null=True)),
                ('y', models.DecimalField(blank=True, decimal_places=500, max_digits=999, null=True)),
                ('precision', models.CharField(blank=True, max_length=255, null=True)),
                ('data_type', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'point_topo',
            },
        ),
        migrations.CreateModel(
            name='Topographie',
            fields=[
                ('id_topographie', models.AutoField(primary_key=True, serialize=False)),
                ('datecreation', models.DateField()),
                ('datedestruction', models.DateField(blank=True)),
                ('commentaire', models.CharField(blank=True, max_length=255)),
                ('libelle', models.CharField(max_length=255)),
                ('source', models.CharField(blank=True, max_length=255)),
                ('contactadresse', models.CharField(blank=True, max_length=255, null=True)),
                ('contactnom', models.CharField(blank=True, max_length=255, null=True)),
                ('contactmail', models.CharField(blank=True, max_length=255, null=True)),
                ('contacttel1', models.CharField(blank=True, max_length=255, null=True)),
                ('contacttel2', models.CharField(blank=True, max_length=255, null=True)),
                ('description', models.CharField(blank=True, max_length=255, null=True)),
                ('geometry', models.BinaryField()),
            ],
            options={
                'db_table': 'topographie',
            },
        ),
        migrations.AddField(
            model_name='pointtopo',
            name='Topogragphie',
            field=models.ForeignKey(db_column='id_topographie', on_delete=django.db.models.deletion.CASCADE, to='carto.Topographie'),
        ),
    ]
