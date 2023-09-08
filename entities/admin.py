from django.contrib import admin

from entities.models import (
    Administrador,
    Carrera,
    Empresa,
    Estudiante,
    EstudianteCarrera,
    Etiqueta,
    Idioma,
    Llamado,
    Postulacion,
    PropuestaCambioLLamado,
)

admin.site.register(
    [
        Empresa,
        Idioma,
        Etiqueta,
        Carrera,
        Postulacion,
        Llamado,
        Estudiante,
        Administrador,
        PropuestaCambioLLamado,
        EstudianteCarrera,
    ]
)
