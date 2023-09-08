from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView

from entities.models import *
from oficina_trabajo.serializers import (
    CarreraSerializer,
    EmpresaSerializer,
    EtiquetaSerializer,
    LlamadoSerializer,
    LoggeableSerializer,
)

# Crear una empresa, etiquetas, carreras con sentido
# Levantar el docker y correr python carga_data_inicial.py


# Definir la app como un endpoint más -> Acceder a un endpoint y este carga los modelos


class DataLoad(APIView):
    permission_classes = [AllowAny]
    # queryset = Carrera.objects.all()
    serializer_class = CarreraSerializer

    def post(self, request, format=None):
        ##########################################################################
        # 1 - OBJETOS NO LOGUEABLES
        ##########################################################################
        serializer1 = CarreraSerializer(data={"nombre": "Computación"})
        computacion = None
        if serializer1.is_valid():
            print("save hecho")
            computacion = serializer1.save()

        serializer2 = CarreraSerializer(data={"nombre": "Agrimensura"})
        agrimensura = None
        if serializer2.is_valid():
            print("save hecho")
            agrimensura = serializer2.save()

        serializer3 = EtiquetaSerializer(data={"nombre": "Angular"})
        angular = None
        if serializer3.is_valid():
            print("save hecho")
            angular = serializer3.save()

        serializer4 = EtiquetaSerializer(data={"nombre": "Django"})
        djangoo = None
        if serializer4.is_valid():
            print("save hecho")
            djangoo = serializer4.save()

        ##########################################################################
        # 2 - OBJETOS LOGUEABLES

        # Para empresas:
        # 1 -- Definís el LoggeableSerializer
        # 2 -- Hacés save del Serializer logueable en un objeto x
        # 3 -- Definís el Serializer empresa usando la pk (llave primaria) del objeto x
        # 4 -- Hacés save de la empresa en un objeto

        ##########################################################################

        loggeable_serializer1 = LoggeableSerializer(
            data={"username": "Fing", "email": "fing@edu.uy", "password": "admin"}
        )
        loggeable_serializer2 = LoggeableSerializer(
            data={"username": "Imm", "email": "imm@gub.uy", "password": "admin"}
        )

        fing = None
        if loggeable_serializer1.is_valid():
            print("save hecho")
            loggeable1 = loggeable_serializer1.save()
            serializer5 = EmpresaSerializer(data={"nombre": "FING", "loggeable": loggeable1.pk})
            if serializer5.is_valid():
                fing = serializer5.save()
            else:
                print(serializer5.errors)

        if loggeable_serializer2.is_valid():
            print("save hecho")
            loggeable2 = loggeable_serializer2.save()
            serializer6 = EmpresaSerializer(data={"nombre": "IMM", "loggeable": loggeable2.pk})
            if serializer6.is_valid():
                serializer6.save()
            else:
                print(serializer6.errors)

        ##########################################################################
        # 3 - LLAMADOS
        ##########################################################################

        serializer7 = LlamadoSerializer(
            data={
                "titulo": "Llamado laboral 00-000",
                "salario_rango_max": "2000 USD",
                "salario_text": "Flexible, a definir",
                "salario_exacto": "1948.55",
                "requisitos_excluyentes": "Cuarto año aprobado",
                "requisitos_no_excluyentes": "React, Python, Java. Compromiso, curiosidad, responsabilidad",
                "anio_en_curso": "3",
                "creditos_minimos": "270",
                "tipo_de_contrato": "Pasantía",
                "tareas_a_desarrollar": "Integrar un equipo de desarrollo profesional",
                "horario": "9 am a 10 pm",
                "observaciones": "Observaciones de prueba á  é í ó ú ? ¿? ! ¡¡!! ´´´ññññ ",
                "departamento": "Montevideo",
                "empresa": fing.pk,
                "carreras": [agrimensura.pk, computacion.pk],
                "etiquetas": [angular.pk, djangoo.pk],
            }
        )
        if serializer7.is_valid():
            serializer7.save()
        else:
            print("error Llamado: " + str(serializer1.errors))

        return Response("Datos creados!", status=status.HTTP_201_CREATED)
