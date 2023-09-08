from django.urls import path
from knox.views import LogoutAllView as KnoxLogoutAllView
from knox.views import LogoutView as KnoxLogoutView

from .views import LoginView

app_name = "autenticacion"

urlpatterns = [
    path(r"login/", LoginView.as_view()),
    path(r"logout/", KnoxLogoutView.as_view()),  # cerrar sesión actual: borra el token con el que se hizo la petición
    path(r"logoutAll/", KnoxLogoutAllView.as_view()),  # cerrar todas las sesiones: borra todos los tokens del usuario
]
