from django.contrib.auth import login
from knox.views import LoginView as KnoxLoginView
from rest_framework import permissions, status
from rest_framework.response import Response

from .helpers import get_tipo_usuario
from .serializers import LoggeableAuthSerializer


class LoginView(KnoxLoginView):
    permission_classes = (permissions.AllowAny,)
    serializer_class = LoggeableAuthSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data)
        if not serializer.is_valid(raise_exception=False):
            return Response({"errors": serializer.errors}, status=status.HTTP_400_BAD_REQUEST)

        user = serializer.validated_data["user"]
        login(request, user)

        response = super().post(request, *args, **kwargs)

        response.data["tipo_usuario"] = get_tipo_usuario(user)

        return Response(response.data, status=status.HTTP_200_OK)
