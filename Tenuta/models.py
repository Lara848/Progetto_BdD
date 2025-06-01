from django.db import models
from django_mysql.models import EnumField
# Create your models here.

class Responsabile(models.Model):
    id = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=100)
    cognome = models.CharField(max_length=100)
    email = models.EmailField(max_length=254, unique=True)  # emailfield verifica tutti i requisiti di un indirizzo email
    # unique serve per non avere indirizzo email duplicati
    password = models.CharField(max_length=128)

class Centro_Distributivo(models.Model):
    id = models.AutoField(primary_key=True)

    #classe interna
    class Regione(models.TextChoices):
        VENETO = 'Veneto'
        PUGLIA = 'Puglia'

    regione = EnumField(choices=Regione.choices, default=Regione.VENETO)
    indirizzo = models.CharField(max_length=255)
    telefono = models.CharField(max_length=20)
    responsabile = models.ForeignKey(Responsabile, on_delete=models.CASCADE)


class Cliente(models.Model):
    id = models.AutoField(primary_key=True)

    class Ruolo(models.TextChoices):
        PRIVATO = 'Privato'
        COMMERCIALE = 'Commerciale'

    ruolo = EnumField(choices=Ruolo.choices, default=Ruolo.PRIVATO)
    email = models.EmailField(max_length=254, unique=True)  # emailfield verifica tutti i requisiti di un indirizzo email
    # unique serve per non avere indirizzo email duplicati
    password = models.CharField(max_length=128)
    nome = models.CharField(max_length=50)
    cognome = models.CharField(max_length=50)
    ragione_sociale = models.CharField(max_length=100)
    partita_iva = models.CharField(max_length=20)

class Prodotto(models.Model):
    id = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=100)
    immagine = models.ImageField(upload_to='prodotti/')
    prezzo = models.DecimalField(max_digits=10, decimal_places=2)
    quantita_disponibile = models.IntegerField()
    formato = models.CharField(max_length=50)
    descrizione = models.TextField()

class Ordine(models.Model):
    id = models.AutoField(primary_key=True)

    class Stato(models.TextChoices):
        ATTESA = 'Attesa'
        SPEDITO = 'Spedito'
        CONSEGNATO = 'Consegnato'
        ANNULLATO = 'Annullato'

    stato = EnumField(choices=Stato.choices, default=Stato.ATTESA)

    class Tipo_consegna(models.TextChoices):
        STANDART = 'Standard'
        ESPRESSO = 'Espresso'

    class Metodo_Pagamento(models.TextChoices):
        CARTA_CREDITO = 'Carta di credito'
        PAYPAL = 'PayPal'
        BONIFICO = 'Bonifico'

    tipo_consegna = EnumField(choices=Tipo_consegna, default=Tipo_consegna.STANDART)
    data_ordine = models.DateField()
    metodo_pagamento = EnumField(choices=Metodo_Pagamento, default=Metodo_Pagamento.CARTA_CREDITO)
    regione_spedizione = models.CharField(max_length=50)
    indirizzo_spedizione = models.CharField(max_length=255)
    totale = models.DecimalField(max_digits=10, decimal_places=2)
    richiesta_fattura = models.BooleanField(default=False)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    centro_distributivo = models.ForeignKey(Centro_Distributivo, on_delete=models.CASCADE)

class Dettaglio_ordine(models.Model):
    ordine = models.ForeignKey(Ordine, on_delete=models.CASCADE)
    prodotto = models.ForeignKey(Prodotto, on_delete=models.CASCADE)
    quantita = models.PositiveIntegerField()
    prezzo_total = models.DecimalField(max_digits=10, decimal_places=2)

class Gestione(models.Model):
    ordine = models.ForeignKey(Ordine, on_delete=models.CASCADE)
    centro_distributivo = models.ForeignKey(Centro_Distributivo, on_delete=models.CASCADE)

    class Meta:
        unique_together = (('ordine', 'centro_distributivo'),)
    #Questo impone che la coppia (ordine, centro_distributivo) sia univoca, che è l'equivalente pratico di una chiave
    #primaria composta, anche se Django continuerà a usare il campo id come chiave primaria interna.

class Registrazione(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    centro_distributivo = models.ForeignKey(Centro_Distributivo, on_delete=models.CASCADE)

class Esecuzione(models.Model):
    ordine = models.ForeignKey(Ordine, on_delete=models.CASCADE)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)

class Evento(models.Model):
    id = models.AutoField(primary_key=True)
    titolo = models.CharField(max_length=100)
    data_evento = models.DateField()
    descrizione = models.TextField()
    luogo_evento = models.CharField(max_length=255)
    iscrizione = models.BooleanField(default=True)
    prezzo = models.DecimalField(max_digits=8, decimal_places=2)

class Partecipazione_evento(models.Model):

    class Stato(models.TextChoices):
        CONFERMATO = 'confermato'
        ANNULLATO = 'annullato'
        ATTESA = 'attesa'
    stato = EnumField(choices=Stato.choices, default=Stato.CONFERMATO)
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    numero_partecipanti = models.PositiveIntegerField()

class Recensione(models.Model):
    id = models.AutoField(primary_key=True)
    testo = models.TextField()
    valutazione = models.PositiveIntegerField()  # ad es. da 1 a 5
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    prodotto = models.ForeignKey(Prodotto, on_delete=models.CASCADE)
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE)




