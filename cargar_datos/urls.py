from django.urls import include, path

from .views import DataLoad

app_name = "cargar_datos"

urlpatterns = [
    path("cargar-datos/", DataLoad.as_view(), name="datos-create"),
]
