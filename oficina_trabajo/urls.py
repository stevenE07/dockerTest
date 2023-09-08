from django.urls import include, path

from .views import LlamadoCreate, LlamadoList

app_name = "oficina_trabajo"

urlpatterns = [
    path("crear-llamado/", LlamadoCreate.as_view(), name="llamados-create"),
    path("ver-llamados/", LlamadoList.as_view(), name="llamados-list"),
]
