import hashlib

from django.contrib.auth.decorators import login_required
from django.shortcuts import render

from Tenuta.models import Cliente, Responsabile


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

@login_required
def menu_personale(request):
    email = request.session.get('email')
    cliente = Cliente.objects.filter(email=email).first()

    if not cliente:
        return redirect('personale')  # Oppure mostra errore

    return render(request, 'menu_personale.html', {
        'cliente': cliente
    })

def registration_page(request):
    return render(request, 'registrazione.html', {})


def amministrazione(request):
    return render(request, 'amministrazione.html', {})

def login_responsabile(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        hashed_password = hashlib.md5(password.encode()).hexdigest()

        if authenticated_responsabile(email, hashed_password):
            return render(request, 'menu_amministrazione.html', {'email': email})  # o 'menu_responsabile.html'
        else:
            return render(request, 'amministrazione.html', {'error_message': "Credenziali non valide, riprova"})
    else:
        return render(request, 'amministrazione.html', {'error_message': "Metodo non valido"})

def personale(request):
    return render(request, 'personale.html', {})