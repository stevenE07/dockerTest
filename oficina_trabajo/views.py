from rest_framework import generics, status
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView

from entities.models import Llamado

from .serializers import LlamadoSerializer


class LlamadoList(generics.ListCreateAPIView):
    queryset = Llamado.objects.all()
    serializer_class = LlamadoSerializer
    permission_classes = [AllowAny]


class LlamadoCreate(APIView):
    permission_classes = [AllowAny]
    queryset = Llamado.objects.all()
    serializer_class = LlamadoSerializer

    def post(self, request, format=None):
        serializer = LlamadoSerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
