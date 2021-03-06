# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-19 08:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0024_auto_20171017_1019'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dataressource',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='datasysteme',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='datasysteme',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='desordre',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='desordre',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='environnement',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='environnement',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='equipement',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='equipement',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='etudestrategie',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='etudestrategie',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='evenement',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='evenement',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='gestionnaire',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='gestionnaire',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='infralineaire',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='infralineaire',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='modele',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='modele',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='observation',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='observation',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='photo',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='photo',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='rapport',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='rapport',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='topo',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='topo',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='travaux',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='travaux',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='video',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='video',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
        migrations.AlterField(
            model_name='zonegeo',
            name='commentaire',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='zonegeo',
            name='libelle',
            field=models.CharField(max_length=255),
        ),
    ]
