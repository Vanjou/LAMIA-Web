# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-10-16 12:29
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('carto', '0018_bdd'),
    ]

    operations = [
        migrations.RenameField(
            model_name='bdd',
            old_name='BdD',
            new_name='bdd',
        ),
        migrations.AlterModelTable(
            name='bdd',
            table='bdd',
        ),
    ]
