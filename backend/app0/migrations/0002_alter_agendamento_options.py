# Generated by Django 4.0.3 on 2022-03-27 19:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app0', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='agendamento',
            options={'ordering': ['dia', 'hora']},
        ),
    ]
