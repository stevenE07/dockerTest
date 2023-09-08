from rest_framework import generics
from rest_framework.permissions import AllowAny

from entities.models import Empresa, Etiqueta
from oficina_trabajo.serializers import EmpresaSerializer, EtiquetaSerializer

# Create your views here.


class EmpresaList(generics.ListCreateAPIView):
    queryset = Empresa.objects.all()
    serializer_class = EmpresaSerializer
    permission_classes = [AllowAny]


class EtiquetaList(generics.ListCreateAPIView):
    queryset = Etiqueta.objects.all()
    serializer_class = EtiquetaSerializer
    permission_classes = [AllowAny]
