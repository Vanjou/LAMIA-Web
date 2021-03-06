# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-04 07:05
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tcdesordredescriptionsystem',
            fields=[
                ('id_tcdesordredescriptionsystem', models.AutoField(primary_key=True, serialize=False)),
                ('id_tcdescriptionsystem', models.ForeignKey(db_column='id_descriptionsystem', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Descriptionsystem')),
            ],
            options={
                'db_table': 'tcdesordredescriptionsystem',
            },
        ),
        migrations.CreateModel(
            name='Tcetudetravaux',
            fields=[
                ('id_tcetudetravaux', models.AutoField(primary_key=True, serialize=False)),
                ('dateprogrammation', models.DateField()),
                ('id_etudestrategie', models.ForeignKey(db_column='id_etudestrategie', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Etudestrategie')),
            ],
            options={
                'db_table': 'tcetudetravaux',
            },
        ),
        migrations.CreateModel(
            name='Tcobjetgestionnaire',
            fields=[
                ('id_tcobjetgestionnaire', models.AutoField(primary_key=True, serialize=False)),
                ('gestionnaireouproprietaireouprestataire', models.IntegerField()),
                ('id_tcgestionnaire', models.ForeignKey(db_column='id_gestionnaire', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Gestionnaire')),
            ],
            options={
                'db_table': 'tcobjetgestionnaire',
            },
        ),
        migrations.CreateModel(
            name='Tcobjetressource',
            fields=[
                ('id_tcobjetressource', models.AutoField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'tcobjetressource',
            },
        ),
        migrations.CreateModel(
            name='Tcobjetzonegeo',
            fields=[
                ('id_tcobjetzonegeo', models.AutoField(primary_key=True, serialize=False)),
                ('zonetraversee', models.BooleanField()),
                ('zonemenacee', models.BooleanField()),
            ],
            options={
                'db_table': 'tcobjetzonegeo',
            },
        ),
        migrations.CreateModel(
            name='Tctravauxdescriptionsystem',
            fields=[
                ('id_tctravauxdescriptionsystem', models.AutoField(primary_key=True, serialize=False)),
                ('id_tcdescriptionsystem', models.ForeignKey(db_column='id_descriptionsystem', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Descriptionsystem')),
            ],
            options={
                'db_table': 'tctravauxdescriptionsystem',
            },
        ),
        migrations.RenameField(
            model_name='desordre',
            old_name='id_evenement',
            new_name='lk_evenement',
        ),
        migrations.RenameField(
            model_name='environnement',
            old_name='id_lineaire',
            new_name='lk_lineaire',
        ),
        migrations.RenameField(
            model_name='environnement',
            old_name='id_noeud',
            new_name='lk_noeud',
        ),
        migrations.RenameField(
            model_name='equipement',
            old_name='id_lineaire',
            new_name='lk_lineaire',
        ),
        migrations.RenameField(
            model_name='equipement',
            old_name='id_noeud',
            new_name='lk_noeud',
        ),
        migrations.RenameField(
            model_name='objet',
            old_name='id_projet',
            new_name='lk_projet',
        ),
        migrations.RenameField(
            model_name='objet',
            old_name='id_utilisateur',
            new_name='lk_utilisateur',
        ),
        migrations.RenameField(
            model_name='observation',
            old_name='id_desordre',
            new_name='lk_desordre',
        ),
        migrations.RenameField(
            model_name='travaux',
            old_name='id_observation',
            new_name='lk_observation',
        ),
        migrations.RenameField(
            model_name='utilisateur',
            old_name='id_projet',
            new_name='lk_projet',
        ),
        migrations.AddField(
            model_name='tctravauxdescriptionsystem',
            name='id_tctravaux',
            field=models.ForeignKey(db_column='id_travaux', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Travaux'),
        ),
        migrations.AddField(
            model_name='tcobjetzonegeo',
            name='id_objet',
            field=models.ForeignKey(db_column='id_objet', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Objet'),
        ),
        migrations.AddField(
            model_name='tcobjetzonegeo',
            name='id_zonegeo',
            field=models.ForeignKey(db_column='id_zonegeo', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Zonegeo'),
        ),
        migrations.AddField(
            model_name='tcobjetressource',
            name='id_tcoobjet',
            field=models.ForeignKey(db_column='id_oobjet', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Objet'),
        ),
        migrations.AddField(
            model_name='tcobjetressource',
            name='id_tcressource',
            field=models.ForeignKey(db_column='id_ressource', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Ressource'),
        ),
        migrations.AddField(
            model_name='tcobjetgestionnaire',
            name='id_tcoobjet',
            field=models.ForeignKey(db_column='id_oobjet', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Objet'),
        ),
        migrations.AddField(
            model_name='tcetudetravaux',
            name='id_travaux',
            field=models.ForeignKey(db_column='id_travaux', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Travaux'),
        ),
        migrations.AddField(
            model_name='tcdesordredescriptionsystem',
            name='id_tcdesordre',
            field=models.ForeignKey(db_column='id_desordre', on_delete=django.db.models.deletion.DO_NOTHING, to='carto.Desordre'),
        ),
    ]
