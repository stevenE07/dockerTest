from enum import Enum

from django.contrib.auth import get_user_model
from rest_framework.permissions import IsAuthenticated

Loggeable = get_user_model()


class TipoUsuario(str, Enum):
    "Clase enumerada para representar los tipos de usuario."

    loggeable = "loggeable"
    empresa = "empresa"
    estudiante = "estudiante"
    administrador = "administrador"


def get_tipo_usuario(user: Loggeable) -> TipoUsuario:
    "Función que devuelve el tipo de usuario de un usuario."

    tipo_usuario = TipoUsuario.loggeable  # tipo por defecto
    try:
        assert user.empresa.id is not None
        tipo_usuario = TipoUsuario.empresa
    except (AttributeError, AssertionError):
        ...
    try:
        assert user.estudiante.id is not None
        tipo_usuario = TipoUsuario.estudiante
    except (AttributeError, AssertionError):
        ...
    try:
        assert user.administrador.id is not None
        tipo_usuario = TipoUsuario.administrador
    except (AttributeError, AssertionError):
        ...
    return tipo_usuario


# Excepción a snake_case porque es una clase paramétrica
def PermisoTipoUsuario(tipo: TipoUsuario) -> type[IsAuthenticated]:
    """
    Constructor de permisos genéricos en base a un tipo de usuario en particular.

    Además chequea que el usuario esté logueado.
    """

    class EsTipo(IsAuthenticated):
        def has_permission(self, request, view):
            return super().has_permission(request, view) and get_tipo_usuario(request.user) == tipo

        def has_object_permission(self, request, view, obj):
            return False

    return EsTipo
