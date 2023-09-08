from django.contrib.auth import authenticate, get_user_model
from rest_framework import serializers

Loggeable = get_user_model()


class LoggeableAuthSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField(style={"input_type": "password"}, trim_whitespace=False)

    def validate(self, attrs):
        email = attrs.get("email").lower()
        password = attrs.get("password")

        if not Loggeable.objects.filter(email=email).exists():
            raise serializers.ValidationError(
                {
                    "email": "No existe un usuario con este email",
                },
                code="authorization",
            )

        user = authenticate(request=self.context.get("request"), email=email, password=password)
        if not user:
            raise serializers.ValidationError(
                {
                    "password": "La combinación de email y contraseña no es válida.",
                },
                code="authorization",
            )

        attrs["user"] = user
        return attrs
