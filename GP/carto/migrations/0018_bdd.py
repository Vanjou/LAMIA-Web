# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-16 12:29
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0017_projet_localisation'),
    ]

    operations = [
        migrations.CreateModel(
            name='BdD',
            fields=[
                ('datecreation', models.DateField()),
                ('libelle', models.CharField(blank=True, max_length=255)),
                ('source', models.CharField(max_length=255)),
                ('id_bdd', models.AutoField(primary_key=True, serialize=False)),
                ('BdD', models.FileField(upload_to='')),
                ('id_objet', models.ForeignKey(db_column='id_objet', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Objet')),
                ('id_ressource', models.ForeignKey(db_column='id_ressource', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Ressource')),
            ],
            options={
                'db_table': 'BdD',
            },
        ),
    ]
