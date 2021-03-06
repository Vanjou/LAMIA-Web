# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-09 11:18
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0012_remove_messagetiers_question_text'),
    ]

    operations = [
        migrations.CreateModel(
            name='Video',
            fields=[
                ('datecreation', models.DateField()),
                ('datedestruction', models.DateField(blank=True)),
                ('commentaire', models.CharField(max_length=255)),
                ('libelle', models.CharField(blank=True, max_length=255)),
                ('source', models.CharField(max_length=255)),
                ('contactadresse', models.CharField(blank=True, max_length=255, null=True)),
                ('contactnom', models.CharField(blank=True, max_length=255, null=True)),
                ('contactmail', models.CharField(blank=True, max_length=255, null=True)),
                ('contacttel1', models.CharField(blank=True, max_length=255, null=True)),
                ('contacttel2', models.CharField(blank=True, max_length=255, null=True)),
                ('description', models.CharField(blank=True, max_length=255, null=True)),
                ('geometry', models.BinaryField()),
                ('id_video', models.AutoField(primary_key=True, serialize=False)),
                ('video', models.FileField(upload_to='')),
                ('nom', models.CharField(max_length=200)),
                ('id_objet', models.ForeignKey(db_column='id_objet', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Objet')),
                ('id_ressource', models.ForeignKey(db_column='id_ressource', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Ressource')),
            ],
            options={
                'db_table': 'video',
            },
        ),
    ]
