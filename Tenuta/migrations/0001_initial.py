# Generated by Django 5.2.1 on 2025-06-02 13:45

import django.db.models.deletion
import django_mysql.models
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Centro_Distributivo',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('regione', django_mysql.models.EnumField(choices=[('Veneto', 'Veneto'), ('Puglia', 'Puglia')], default='Veneto')),
                ('indirizzo', models.CharField(max_length=255)),
                ('telefono', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('ruolo', django_mysql.models.EnumField(choices=[('Privato', 'Privato'), ('Commerciale', 'Commerciale')], default='Privato')),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('password', models.CharField(max_length=128)),
                ('nome', models.CharField(max_length=50)),
                ('cognome', models.CharField(max_length=50)),
                ('ragione_sociale', models.CharField(max_length=100)),
                ('partita_iva', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Evento',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('titolo', models.CharField(max_length=100)),
                ('data_evento', models.DateField()),
                ('descrizione', models.TextField()),
                ('luogo_evento', models.CharField(max_length=255)),
                ('iscrizione', models.IntegerField(default=True)),
                ('prezzo', models.DecimalField(decimal_places=2, max_digits=8)),
            ],
        ),
        migrations.CreateModel(
            name='Prodotto',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('nome', models.CharField(max_length=100)),
                ('immagine', models.ImageField(upload_to='prodotti/')),
                ('prezzo', models.DecimalField(decimal_places=2, max_digits=10)),
                ('formato', models.CharField(max_length=50)),
                ('descrizione', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Responsabile',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('nome', models.CharField(max_length=100)),
                ('cognome', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('password', models.CharField(max_length=128)),
            ],
        ),
        migrations.CreateModel(
            name='Ordine',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('stato', django_mysql.models.EnumField(choices=[('Attesa', 'Attesa'), ('Spedito', 'Spedito'), ('Consegnato', 'Consegnato'), ('Annullato', 'Annullato')], default='Attesa')),
                ('tipo_consegna', django_mysql.models.EnumField(choices=[('Standard', 'Standard'), ('Espresso', 'Espresso')], default='Standard')),
                ('data_ordine', models.DateField()),
                ('metodo_pagamento', django_mysql.models.EnumField(choices=[('Carta di credito', 'Carta di credito'), ('PayPal', 'PayPal'), ('Bonifico', 'Bonifico')], default='Carta di credito')),
                ('regione_spedizione', models.CharField(max_length=50)),
                ('indirizzo_spedizione', models.CharField(max_length=255)),
                ('totale', models.DecimalField(decimal_places=2, max_digits=10)),
                ('richiesta_fattura', models.BooleanField(default=False)),
                ('centro_distributivo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.centro_distributivo')),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.cliente')),
            ],
        ),
        migrations.CreateModel(
            name='Partecipazione_evento',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('stato', django_mysql.models.EnumField(choices=[('confermato', 'Confermato'), ('annullato', 'Annullato'), ('attesa', 'Attesa')], default='confermato')),
                ('numero_partecipanti', models.PositiveIntegerField()),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.cliente')),
                ('evento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.evento')),
            ],
        ),
        migrations.CreateModel(
            name='Dettaglio_ordine',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('quantita', models.PositiveIntegerField()),
                ('prezzo_total', models.DecimalField(decimal_places=2, max_digits=10)),
                ('ordine', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.ordine')),
                ('prodotto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.prodotto')),
            ],
        ),
        migrations.CreateModel(
            name='Deposito',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('quantita', models.PositiveIntegerField()),
                ('centro_distributivo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.centro_distributivo')),
                ('prodotto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.prodotto')),
            ],
        ),
        migrations.CreateModel(
            name='Recensione',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('testo', models.TextField()),
                ('valutazione', models.PositiveIntegerField()),
                ('cliente', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.cliente')),
                ('evento', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Tenuta.evento')),
                ('prodotto', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Tenuta.prodotto')),
            ],
        ),
        migrations.AddField(
            model_name='centro_distributivo',
            name='responsabile',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Tenuta.responsabile'),
        ),
    ]
