# Sistema di Gestione Ordini – Tenuta Beltrani

Questo progetto nasce con l'obiettivo di digitalizzare la gestione delle vendite dell’Azienda Agricola Tenuta Beltrani, specializzata nella produzione di prodotti tipici italiani. Attraverso un’applicazione web moderna e intuitiva, il sistema sostituisce le attuali procedure manuali, migliorando l’efficienza operativa e l’esperienza dell’utente. Alla base c’è un database relazionale SQL che gestisce in modo strutturato il catalogo prodotti, gli ordini e le informazioni sugli utenti. Il sistema distingue tra clienti privati e attività commerciali, offrendo funzionalità personalizzate in base al profilo. Ogni ordine viene tracciato lungo tutto il suo ciclo di vita, con la possibilità di consultare lo storico, lasciare recensioni e seguire lo stato della spedizione. Inoltre, il sistema consente di gestire eventi organizzati dall’azienda e ottimizza le consegne grazie a una logica che indirizza ogni ordine al centro distributivo più vicino (tra Puglia e Veneto), in base alla regione di destinazione.

---

## Indice

- [Modello Entità/Relazione](#modello-entitàrelazione)
- [Funzionalità Principali](#funzionalità-principali)
- [Tecnologie Utilizzate](#tecnologie-utilizzate)
- [Installazione](#installazione)
- [Configurazione del Database](#configurazione-del-database)
- [Utilizzo](#utilizzo)
- [Licenza](#licenza)

---

## Modello Entità/Relazione

Il modello Entità-Relazione rappresenta le principali entità del sistema e le loro relazioni, consentendo di gestire utenti, prodotti, ordini, eventi e recensioni in modo strutturato e coerente.

![Modello E/R](https://github.com/user-attachments/assets/460029ed-5917-4996-9155-a9256b0c556e)

---

## Funzionalità Principali

L’applicazione offre una serie di funzionalità pensate per coprire in modo completo le esigenze dell’Azienda Agricola Tenuta Beltrani, sia dal punto di vista operativo che dell’esperienza utente. Tra le principali:

- **Registrazione e Login**: con autenticazione sicura, distinzione tra clienti privati e attività commerciali.
- **Gestione Ordini**: possibilità di creare, inviare e monitorare ordini. Ogni ordine include metodo di pagamento, tipo di consegna, stato (preso in carico, spedito, consegnato) e storico consultabile.
- **Recensioni e Valutazioni**: gli utenti possono lasciare feedback sui prodotti acquistati.
- **Eventi Esperienziali**: gestione della pubblicazione, iscrizione e archivio degli eventi organizzati dall’azienda.
- **Logistica Geolocalizzata**: gli ordini vengono automaticamente assegnati al centro distributivo più vicino (tra Puglia e Veneto) in base alla regione di spedizione.

---

## Tecnologie Utilizzate

- **Python**: linguaggio principale per lo sviluppo dell'applicazione.
- **Django**: framework web utilizzato per gestire backend, routing, autenticazione e ORM.
- **MySQL / MariaDB**: sistema di database relazionale per la persistenza dei dati.
- **mysqlclient**: driver per connettere Django a MySQL/MariaDB.
- **HTML5 / CSS3**: per l'interfaccia utente responsive.
- **Django Templates**: sistema di templating per il rendering dinamico delle pagine.
- **Django Sessions**: gestione del carrello, autenticazione e dati temporanei.
- **Git + GitHub**: versionamento del codice e collaborazione.

---

## Installazione

Per eseguire l'applicazione, è necessario:

1. Disporre di **Python** installato nel proprio ambiente.
2. Avere accesso a un server **MySQL o MariaDB**, preferibilmente con phpMyAdmin per una gestione semplificata.
3. Clonare il progetto:
   ```bash
   git clone https://github.com/Lara848/Progetto_BdD.git
   cd Progetto_BdD
4. Creare e attivare un ambiente virtuale:
   ```
   python -m venv venv
   ```
    # Linux/macOS
   ```
    source venv/bin/activate
   ```  
    # Su Windows: 
   In Powershell:
   ```
   .\.venv\Scripts\Activate.ps1
   ```
   In cmd:
   ```
   .\.venv\Scripts\activate.bat
   ```
 6. Installare le dipendenze
    ```
    pip install -r requirements.txt
    ```
    Se non si dispone di un file requirements.txt, si puo procedere con la seguente installazione manuale:
    ```
    pip install django mysqlclient
    ```

---

## Configurazione del Database

1. Importare il database da dump SQL

   Se disponi di un file `.sql` con il dump del database (ad es. `tenuta_dump.sql`), puoi importarlo nel tuo server MySQL/MariaDB.
   Metodo 1: via phpMyAdmin
   - Accedi a phpMyAdmin
   - Crea un nuovo database (es. tenuta)
   - Clicca su Importa e carica il file tenuta_dump.sql

3. Il file settings.py deve essere modificato per collegare l'applicazione al database MySQL o MariaDB. Nella sezione DATABASES vanno inseriti i dati di connessione, ad esempio:
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'tenuta',
        'USER': 'tuo_utente',
        'PASSWORD': 'tua_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```
È necessario che il database esista e che l’utente abbia i permessi adeguati per l’accesso e la modifica.

---

## Utilizzo
Dopo la configurazione, eseguire i seguenti comandi da terminale per applicare le migrazioni:
```bash
python manage.py makemigrations
python manage.py migrate
```
Una volta completato, si può avviare il server locale con:
```bash
manage.py runserver
```
L'applicazione sarà accessibile all'indirizzo: http://localhost:8000.


**Web application**
  
**Funzionalità utente**:
- Creare un account utente per registrarsi e autenticarsi.

![Login](https://github.com/user-attachments/assets/ea3ba196-ff89-4aab-8510-1b2cb999f673)

- Effettuare ordini con scelta di spedizione, metodo di pagamento e, se previsto, richiesta di fattura.
  
![Menu personale](https://github.com/user-attachments/assets/883724e9-60e9-4a8f-ac59-38129742c7a0)

![Ordine](https://github.com/user-attachments/assets/704a6307-e27b-4758-8d0f-3dddcf13549a)

![Image](https://github.com/user-attachments/assets/25f1f37d-82a0-4673-91b5-780f6b6f98ff)

- Consultare lo storico degli ordini, verificandone lo stato e i dettagli.
  
![Storico ordini](https://github.com/user-attachments/assets/b8d1d846-b2e3-4fb3-82c3-01b2ccc49275)

- Inserire recensioni sui prodotti acquistati.
  
![Inserimento recensione ](https://github.com/user-attachments/assets/e31e4587-653f-4716-9e74-7aa74d7f5f88)


**Funzionalità amministrative**
Gli amministratori accedono a un’area riservata in cui possono gestire esclusivamente gli ordini relativi alla propria area geografica di competenza (Puglia o Veneto). In questa sezione, è possibile visualizzare i dettagli degli ordini e aggiornarne lo stato nel ciclo di gestione (ad esempio da “preso in carico” a “spedito” o “consegnato”), contribuendo all’organizzazione efficiente delle spedizioni.

![Login_admin](https://github.com/user-attachments/assets/b7015c6b-692b-4f50-867b-dfb20cc3fc4e)

![Area amministrativa](https://github.com/user-attachments/assets/745ca683-1e73-40fb-aff8-e45694a829cf)

---

## Licenza

Questo progetto è distribuito con licenza [MIT](LICENSE).  
Puoi usarlo, modificarlo e distribuirlo liberamente, a patto che venga mantenuta la nota di copyright.

