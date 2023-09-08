from django.urls import path

from .views import EmpresaList, EtiquetaList

app_name = "backoffice"


urlpatterns = [
    path("ver-empresas/", EmpresaList.as_view(), name="ver-empresas"),
    path("ver-etiquetas/", EtiquetaList.as_view(), name="ver-etiquetas"),
]
