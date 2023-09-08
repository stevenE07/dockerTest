from rest_framework import status
from rest_framework.test import APITestCase

from entities.models import Administrador, Empresa

from .helpers import TipoUsuario, get_tipo_usuario
from .models import Loggeable


class AutenticacionTestCase(APITestCase):
    usuarios = {
        "admin": {
            "email": "admin@mail.com",
            "password": "admin1234",
        },
        "empresa": {
            "email": "empresa@mail.com",
            "password": "empresa1234",
            "nombre": "Empresa test",
        },
    }

    def setUp(self):
        "Se crean los usuarios de prueba."

        loggeable_emp = Loggeable(email=self.usuarios["empresa"]["email"])
        loggeable_emp.set_password(self.usuarios["empresa"]["password"])
        Loggeable.save(loggeable_emp)
        emp = Empresa(loggeable=loggeable_emp, nombre=self.usuarios["empresa"]["nombre"])
        emp.save()

        loggeable_admin = Loggeable(email=self.usuarios["admin"]["email"])
        loggeable_admin.set_password(self.usuarios["admin"]["password"])
        Loggeable.save(loggeable_admin)
        admin = Administrador(loggeable=loggeable_admin)
        admin.save()

    def test_create_empresa(self):
        "Se testea que se creó correctamente una empresa y su loggeable asociado."

        email = self.usuarios["empresa"]["email"]

        loggeable = Loggeable.objects.get(email=email)

        self.assertEqual(Empresa.objects.filter(loggeable__email=email).count(), 1)
        self.assertEqual(get_tipo_usuario(loggeable), TipoUsuario.empresa)

    def test_create_administrador(self):
        "Se testea que se creó correctamente un administrador y su loggeable asociado."

        email = self.usuarios["admin"]["email"]

        loggeable = Loggeable.objects.get(email=email)

        self.assertEqual(Administrador.objects.filter(loggeable__email=email).count(), 1)
        self.assertEqual(get_tipo_usuario(loggeable), TipoUsuario.administrador)

    def test_login_empresa(self):
        "Se testea que el login de una empresa sea correcto."

        client = self.client

        json_login_emp = {
            "email": self.usuarios["empresa"]["email"],
            "password": self.usuarios["empresa"]["password"],
        }
        response = client.post("/auth/login/", json_login_emp, format="json")

        assert response.status_code == status.HTTP_200_OK
        assert response.data["tipo_usuario"] == "empresa"
        assert response.data["token"] is None

    def test_login_admin(self):
        "Se testea que el login de un administrador sea correcto."

        client = self.client

        json_login_admin = {
            "email": self.usuarios["admin"]["email"],
            "password": self.usuarios["admin"]["password"],
        }
        response = client.post("/auth/login/", json_login_admin, format="json")

        assert response.status_code == status.HTTP_200_OK
        assert response.data["tipo_usuario"] == "administrador"
        assert response.data["token"] is not None

    def test_logout(self):
        "Se testea que el logout borre el token del usuario."

        client = self.client

        json_login_admin = {
            "email": self.usuarios["admin"]["email"],
            "password": self.usuarios["admin"]["password"],
        }
        response_login = client.post("/auth/login/", json_login_admin, format="json")

        client.credentials(HTTP_AUTHORIZATION=f'Token {response_login.data["token"]}')
        response_logout = client.post("/auth/logout/")

        assert response_logout.status_code == status.HTTP_204_NO_CONTENT

        # Test que el token ya no es válido
        response_logout_2 = client.post("/auth/logout/")
        assert response_logout_2.status_code == status.HTTP_401_UNAUTHORIZED

    def test_logout_all(self):
        "Se testea que el logoutAll borre todos los tokens del usuario, y no de otros usuarios."

        client_emp_1 = self.client_class()
        client_emp_2 = self.client_class()
        client_admin = self.client_class()

        json_login_admin = {
            "email": self.usuarios["admin"]["email"],
            "password": self.usuarios["admin"]["password"],
        }
        json_login_emp = {
            "email": self.usuarios["empresa"]["email"],
            "password": self.usuarios["empresa"]["password"],
        }
        # Login dos veces con la misma empresa y una vez con el admin
        response_login_1 = client_emp_1.post("/auth/login/", json_login_emp, format="json")
        response_login_2 = client_emp_2.post("/auth/login/", json_login_emp, format="json")
        response_login_admin = client_admin.post("/auth/login/", json_login_admin, format="json")

        # logoutAll de la empresa
        client_emp_1.credentials(HTTP_AUTHORIZATION=f'Token {response_login_1.data["token"]}')
        client_emp_1.post("/auth/logoutAll/")

        # Test que el token (segundo login) ya no es válido
        client_emp_2.credentials(HTTP_AUTHORIZATION=f'Token {response_login_2.data["token"]}')
        response_logout_2 = client_emp_2.post("/auth/logout/", format="json")
        assert response_logout_2.status_code == status.HTTP_401_UNAUTHORIZED

        # Test que el token del admin sigue siendo válido
        client_admin.credentials(HTTP_AUTHORIZATION=f'Token {response_login_admin.data["token"]}')
        response_logout_admin = client_admin.post("/auth/logout/", format="json")
        assert response_logout_admin.status_code == status.HTTP_204_NO_CONTENT
