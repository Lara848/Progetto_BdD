import hashlib
from audioop import reverse

from django.contrib.auth.decorators import login_required
from django.db.models import Prefetch
from django.shortcuts import render, get_object_or_404

from Tenuta.models import Cliente, Responsabile, Prodotto, Ordine, Dettaglio_ordine, Centro_Distributivo, Gestione, \
    Esecuzione
from decimal import Decimal
from django.utils.timezone import now

# Create your views here.

def index(request):
    return render(request, 'index.html', {})

def authenticated(email, password):
    return Cliente.objects.filter(email=email, password=password)

def authenticated_responsabile(email, password):
    return Responsabile.objects.filter(email=email, password=password).exists()

from Tenuta.models import Cliente

def login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        hashed_password = hashlib.md5(password.encode()).hexdigest()

        if authenticated(email, hashed_password):
            cliente = Cliente.objects.get(email=email)

            # Salva email nella sessione (opzionale ma utile per successive richieste)
            request.session['email'] = email

            return render(request, 'menu_personale.html', {
                'cliente': cliente
            })
        else:
            return render(request, 'personale.html', {'error_message': "Credenziali non valide, riprova"})
    else:
        return render(request, 'personale.html', {'error_message': "Metodo non valido"})

import hashlib
from django.shortcuts import render, redirect
from .models import Cliente

def registration(request):
    if request.method == "POST":
        ruolo = request.POST.get("ruolo")
        email = request.POST.get("email", "").strip()
        password = request.POST.get("password", "").strip()
        nome = request.POST.get("nome", "").strip()
        cognome = request.POST.get("cognome", "").strip()
        ragione_sociale = request.POST.get("ragione_sociale", "").strip()
        partita_iva = request.POST.get("partita_iva", "").strip()

        # Hash della password
        hashed_password = hashlib.md5(password.encode()).hexdigest()

        # Verifica se esiste già un utente con quella email
        if Cliente.objects.filter(email=email).exists():
            return render(request, 'registrazione.html', {
                'error_message': "Email già registrata",
                'email': email,
                'ruolo': ruolo,
                'nome': nome,
                'cognome': cognome,
                'ragione_sociale': ragione_sociale,
                'partita_iva': partita_iva
            })

        # Verifica campi obbligatori in base al ruolo
        if ruolo == "Privato":
            if not nome or not cognome:
                return render(request, 'registrazione.html', {
                    'error_message': "Nome e cognome sono obbligatori per i Privati.",
                    'email': email,
                    'ruolo': ruolo
                })
            ragione_sociale = ""
            partita_iva = ""
        elif ruolo == "Commerciale":
            if not ragione_sociale or not partita_iva:
                return render(request, 'registrazione.html', {
                    'error_message': "Ragione sociale e Partita IVA sono obbligatorie per i Commerciali.",
                    'email': email,
                    'ruolo': ruolo
                })
            nome = ""
            cognome = ""
        else:
            return render(request, 'registrazione.html', {
                'error_message': "Ruolo non valido.",
                'email': email
            })

        # Creazione cliente
        Cliente.objects.create(
            ruolo=ruolo,
            email=email,
            password=hashed_password,
            nome=nome,
            cognome=cognome,
            ragione_sociale=ragione_sociale,
            partita_iva=partita_iva
        )

        return render(request, 'personale.html', {
            'success_message': "Registrazione avvenuta con successo"
        })

    else:
        return render(request, 'registrazione.html', {
            'error_message': "Metodo non valido"
        })
def registration_page(request):
    return render(request, 'registrazione.html', {})

def personale(request):
    return render(request, 'personale.html', {})
@login_required
def menu_personale(request):
    email = request.session.get('email')
    cliente = Cliente.objects.filter(email=email).first()

    if not cliente:
        return redirect('personale')  # Oppure mostra errore

    return render(request, 'menu_personale.html', {
        'cliente': cliente
    })

def ordine(request):
    email = request.session.get('email')
    cliente = Cliente.objects.filter(email=email).first()

    if not cliente:
        return redirect('personale')  # Oppure mostra errore

    prodotti = Prodotto.objects.all()
    return render(request, 'ordine.html', {
        'prodotti': prodotti,
        'range_10': range(1, 11)
    })


def ordina_multipli(request):
    email = request.session.get('email')
    cliente = Cliente.objects.filter(email=email).first()

    if not cliente:
        return redirect('personale')  # Oppure mostra errore

    if request.method == 'POST':
        carrello = {}    #dizionario vuoto per il carrello, che mi contiene tutti i prodotti che voglio comprare
        for prodotto in Prodotto.objects.all():
            key = f"quantita_{prodotto.id}"  #prende id e lo mette nella chiave quantita_id
            quantita = request.POST.get(key) #qui prende la quantità
            if quantita and quantita.isdigit() and int(quantita) > 0:
                carrello[prodotto.id] = int(quantita)
                #verifica che la quantità ** sia presente ** - sia un numero   - sia ** maggiore di zero **

        if carrello:
            request.session['carrello'] = carrello
            return redirect('pagamento')  # o una pagina di conferma
        else:
            return redirect('ordine')

    return redirect('ordine')


def pagamento(request, regione=None):
    # recupero il cliente loggato tramite email
    email = request.session.get('email')
    cliente = Cliente.objects.filter(email=email).first()

    if not cliente:
        return redirect('personale')  # Oppure mostra errore


    if request.method == 'POST':
        indirizzo_spedizione = request.POST.get('indirizzo_spedizione')
        regione_spedizione = request.POST.get('regione_spedizione')
        tipo_consegna = request.POST.get('tipo_consegna')
        metodo_pagamento = request.POST.get('metodo_pagamento')
        richiesta_fattura = bool(request.POST.get('richiesta_fattura'))

        # Disabilito richiesta fattura per clienti privati
        if cliente.ruolo == Cliente.Ruolo.PRIVATO:
            richiesta_fattura = False

        #dizionario delle regioni per determinare il centro distributivo
        regioni_nord = [
            'Lazio', 'Abruzzo', 'Marche', 'Umbria', 'Toscana', 'Emilia Romagna',
            'Liguria', 'Veneto', 'Friuli Venezia Giulia', 'Trentino-Alto Adige',
            'Lombardia', 'Piemonte', 'Valle d\'Aosta'
        ]

        if regione_spedizione in regioni_nord:
            centro_distributivo = Centro_Distributivo.objects.get(regione='Veneto')
        else:
            centro_distributivo = Centro_Distributivo.objects.get(regione='Puglia')

        # Recupero carrello dalla sessione
        carrello = request.session.get('carrello', {})

        totale = Decimal('0.00')

        for prodotto_id, quantita in carrello.items():
            try:
                prodotto = Prodotto.objects.get(id=prodotto_id)
                totale += prodotto.prezzo * quantita
            except Prodotto.DoesNotExist:
                continue  # ignora prodotti non trovati

        ordine = Ordine.objects.create(
            indirizzo_spedizione=indirizzo_spedizione,
            regione_spedizione=regione_spedizione,
            tipo_consegna=tipo_consegna,
            metodo_pagamento=metodo_pagamento,
            richiesta_fattura=richiesta_fattura,
            data_ordine=now().date(),
            cliente=cliente,
            centro_distributivo=centro_distributivo,
            totale=totale
        )

        # Crea i dettagli dell'ordine per ogni prodotto nel carrello
        for prodotto_id, quantita in carrello.items():
            try:
                prodotto = Prodotto.objects.get(id=prodotto_id)
                prezzo_totale = prodotto.prezzo * quantita
                Dettaglio_ordine.objects.create(
                    ordine=ordine,
                    prodotto=prodotto,
                    quantita=quantita,
                    prezzo_total=prezzo_totale
                )

                # Aggiorna la quantità disponibile del prodotto
                prodotto.quantita_disponibile -= quantita
                prodotto.save()

            except Prodotto.DoesNotExist:
                continue

        # Popola Gestione
        Gestione.objects.create(
            ordine=ordine,
            centro_distributivo=centro_distributivo
        )

        # Popola Esecuzione
        Esecuzione.objects.create(
            ordine=ordine,
            cliente=cliente
        )

        # Opzionale: cancella il carrello dalla sessione
        if 'carrello' in request.session:
            del request.session['carrello']

        return redirect('conferma_ordine')  # pagina di conferma

    return render(request, 'pagamento.html')

def conferma_ordine(request):
    # recupero il cliente loggato tramite email
    email = request.session.get('email')
    cliente = Cliente.objects.filter(email=email).first()

    if not cliente:
        return redirect('personale')  # Oppure mostra errore

    return render(request, 'conferma_ordine.html')

def amministrazione(request):
    return render(request, 'amministrazione.html', {})


def login_responsabile(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        hashed_password = hashlib.md5(password.encode()).hexdigest()

        if authenticated_responsabile(email, hashed_password):
            # Salva nella sessione che l'admin è loggato (opzionale)
            request.session['admin_email'] = email
            return redirect('menu_amministrazione')  # o 'menu_responsabile.html'
        else:
            return render(request, 'amministrazione.html', {'error_message': "Credenziali non valide, riprova"})
    else:
        return render(request, 'amministrazione.html', {'error_message': "Metodo non valido"})

def menu_amministrazione(request):
    admin_email = request.session.get('admin_email')
    responsabile = Responsabile.objects.filter(email=admin_email).first()
    if not responsabile:
        return redirect('amministrazione')

    centro = Centro_Distributivo.objects.filter(responsabile=responsabile).first()
    if not centro:
        return render(request, 'menu_amministrazione.html', {
            'ordini': [],
            'scelte_stato': Ordine.Stato.choices
        })

    if request.method == "POST":
        ordine_id = request.POST.get('ordine_id')
        nuovo_stato = request.POST.get('stato')
        ordine = get_object_or_404(Ordine, id=ordine_id, centro_distributivo=centro)
        ordine.stato = nuovo_stato
        ordine.save()
        return redirect('menu_amministrazione')

    # Carica ordini con cliente e dettagli ordine con prodotto
    ordini = Ordine.objects.filter(centro_distributivo=centro).select_related('cliente').prefetch_related(
            Prefetch('dettaglio_ordine_set', queryset=Dettaglio_ordine.objects.select_related('prodotto'))
    ).order_by('-data_ordine')

    return render(request, 'menu_amministrazione.html', {
        'ordini': ordini,
        'scelte_stato': Ordine.Stato.choices
    })

def logout_admin(request):
    request.session.flush()  # Rimuove tutta la sessione (oppure: del request.session['admin_email'])
    return redirect('amministrazione')