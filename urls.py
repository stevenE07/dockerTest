from django.contrib import admin
from django.urls import include, path

app_name = "core"

urlpatterns = [
    path("admin/", admin.site.urls),
    path("auth/", include("autenticacion.urls")),
    path("backoffice/", include("backoffice.urls")),
    path("oftrabajo/", include("oficina_trabajo.urls")),
    path("cargardatos/", include("cargar_datos.urls")),
]
