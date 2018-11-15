# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-11-10 08:11
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0049_auto_20171110_0910'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tcdesordredescriptionsystem',
            name='id_tcdescriptionsystem',
            field=models.ForeignKey(db_column='id_tcdescriptionsystem', on_delete=django.db.models.deletion.CASCADE, to='carto.Descriptionsystem'),
        ),
        migrations.AlterField(
            model_name='tcdesordredescriptionsystem',
            name='id_tcdesordre',
            field=models.ForeignKey(db_column='id_tcdesordre', on_delete=django.db.models.deletion.CASCADE, to='carto.Desordre'),
        ),
        migrations.AlterField(
            model_name='tcetudetravaux',
            name='id_etudestrategie',
            field=models.ForeignKey(db_column='id_tcetudestrategie', on_delete=django.db.models.deletion.CASCADE, to='carto.Etudestrategie'),
        ),
        migrations.AlterField(
            model_name='tcetudetravaux',
            name='id_travaux',
            field=models.ForeignKey(db_column='id_tctravaux', on_delete=django.db.models.deletion.CASCADE, to='carto.Travaux'),
        ),
        migrations.AlterField(
            model_name='tcobjetintervenant',
            name='id_tcintervenant',
            field=models.ForeignKey(db_column='id_tcintervenant', on_delete=django.db.models.deletion.CASCADE, to='carto.Intervenant'),
        ),
        migrations.AlterField(
            model_name='tctravauxdescriptionsystem',
            name='id_tcdescriptionsystem',
            field=models.ForeignKey(db_column='id_tcdescriptionsystem', on_delete=django.db.models.deletion.CASCADE, to='carto.Descriptionsystem'),
        ),
        migrations.AlterField(
            model_name='tctravauxdescriptionsystem',
            name='id_tctravaux',
            field=models.ForeignKey(db_column='id_tctravaux', on_delete=django.db.models.deletion.CASCADE, to='carto.Travaux'),
        ),
    ]