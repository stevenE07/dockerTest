from datetime import datetime

from django.contrib.auth import get_user_model
from rest_framework import serializers

from entities.models import Carrera, Empresa, Etiqueta, Llamado

Loggeable = get_user_model()

DEFAULT_NULL_TEXT = "AA"
DEFAULT_NULL_NUMBER = 0
DEFAULT_NULL_DATE = datetime.now()
ID_EMPRESA_HARDCODEADA = 1

CHAR_LENGTH_TINY_DESCRIPTION = 50
CHAR_LENGTH_SHORT_DESCRIPTION = 150
CHAR_LENGTH_LONG_DESCRIPTION = 500


class LlamadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Llamado
        fields = [
            "titulo",
            "salario_rango_max",
            "salario_text",
            "salario_exacto",
            "requisitos_excluyentes",
            "requisitos_no_excluyentes",
            "anio_en_curso",
            "creditos_minimos",
            "tipo_de_contrato",
            "tareas_a_desarrollar",
            "horario",
            "observaciones",
            "empresa",
            "carreras",
            "etiquetas",
        ]

    def create(self, validated_data):
        """
        Crea y devuelve una nueva instancia de Llamado utilizando los datos validados.
        """

        campos_string = [
            "titulo",
            "salario_rango_max",
            "salario_text",
            "requisitos_excluyentes",
            "requisitos_no_excluyentes",
            "tipo_de_contrato",
            "tareas_a_desarrollar",
            "horario",
            "observaciones",
            "departamento",
        ]
        campos_numericos = ["salario_exacto", "anio_en_curso", "creditos_minimos", "modalidad", "estado"]

        for elemento in campos_string:
            validated_data.setdefault(elemento, DEFAULT_NULL_TEXT)
        for elemento in campos_numericos:
            validated_data.setdefault(elemento, DEFAULT_NULL_NUMBER)

        validated_data.setdefault("fecha_finalizacion", DEFAULT_NULL_DATE)

        emp = Empresa.objects.get(nombre="FING")
        validated_data.setdefault("empresa", emp)
        carrera1 = Carrera.objects.get(nombre="Computación")
        validated_data.setdefault("carreras", [carrera1])
        etiqueta = Etiqueta.objects.get(nombre="Angular")
        validated_data.setdefault("etiquetas", [etiqueta])

        return super().create(validated_data)


class CarreraSerializer(serializers.ModelSerializer):
    class Meta:
        model = Carrera
        fields = "__all__"

    def create(self, validated_data):
        validated_data.setdefault("nombre", "Ingeniería_por_defecto")
        return super().create(validated_data)


class EtiquetaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Etiqueta
        fields = "__all__"


class EmpresaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Empresa
        fields = "__all__"


class LoggeableSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loggeable
        fields = "__all__"


# class EstudianteSerializer(serializers.ModelSerializer):
#    class Meta:
#        model = Estudiante
#        fields = '__all__'
