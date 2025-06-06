"""
URL configuration for Tenuta_beltrani project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

# from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from Tenuta.views import index, personale, amministrazione, login, registration, registration_page, menu_personale, \
    login_responsabile, menu_amministrazione, ordina_multipli, ordine, pagamento, conferma_ordine, logout_admin, \
    ins_recensione, conferma_recensione, recensioni, storico, logout_cliente, login_vulnerabile

urlpatterns = [
    #    path('admin/', admin.site.urls),
    path('', index, name="index"),
    path('personale', personale, name="personale"),

    path('login', login, name="login"),

    #path('personale_vulnerabile', login_vulnerabile, name="personale_vulnerabile"),

    path('registration_client', registration, name="registration_client"),

    path('registration_page', registration_page, name="registration_page"),

    path('menu_personale', menu_personale, name="menu_personale"),

    path('ordine', ordine, name="ordine" ),

    path('ordina_multipli', ordina_multipli, name="ordina_multipli"),

    path('pagamento', pagamento, name="pagamento"),

    path('conferma_ordine', conferma_ordine, name="conferma_ordine"),

    path('ins_recensione', ins_recensione, name="ins_recensione"),

    path('conferma_recensione', conferma_recensione, name="conferma_recensione"),

    path('storico', storico, name="storico"),

    path('logout_cliente', logout_cliente, name="logout_cliente"),

    path('amministrazione', amministrazione, name="amministrazione"),

    path('login_admin', login_responsabile, name="login_admin"),
    path('menu_amministrazione', menu_amministrazione, name="menu_amministrazione"),

    path('logout_admin', logout_admin, name="logout_admin"),

    path('recensioni', recensioni, name="recensioni")

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)