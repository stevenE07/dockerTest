# Create your models here.
from django.conf import settings
from django.contrib.postgres.fields import ArrayField
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models

Loggeable = settings.AUTH_USER_MODEL

CHAR_LENGTH_TINY_DESCRIPTION = 50
CHAR_LENGTH_SHORT_DESCRIPTION = 150
CHAR_LENGTH_LONG_DESCRIPTION = 500


class Empresa(models.Model):
    """
    Empresas que crean los llamados a los que los estudiantes pueden postularse.
    """

    loggeable = models.OneToOneField(
        Loggeable,
        on_delete=models.CASCADE,
        unique=True,
    )
    nombre = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)

    def get_full_name(self):
        return f"Emp. nombre: {self.nombre} - email: {self.email}"

    def get_short_name(self):
        return self.nombre


class Idioma(models.Model):
    """
    Idiomas definidos por un estudiante, se agrega un campo descripción para definir distintos niveles de dominio
    """

    nombre = models.CharField(max_length=CHAR_LENGTH_TINY_DESCRIPTION, unique=True)
    # Relación con Estudiante en esa definición


class Etiqueta(models.Model):
    """
    Estiquetas definidas por los admin.
    Los estudiantes presentan un interes y las empresas pueden agregarlas a sus llamados.
    """

    nombre = models.CharField(max_length=CHAR_LENGTH_TINY_DESCRIPTION, unique=True)
    # Relación con Llamado y Estudiante en esa definición


class Carrera(models.Model):
    """
    Carreras definidas por el administrador dentro del sistema.

    """

    nombre = models.CharField(max_length=CHAR_LENGTH_TINY_DESCRIPTION, unique=True)
    # Relación con Llamado y Estudiante en esa definición


class AbstractLlamado(models.Model):
    """
    Clase abstracta que contiene los atributos de los llamados y sus propuestas de cambio
    """

    class Meta:
        abstract = True

    carga_horaria = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    titulo = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    salario_rango_max = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    salario_text = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    salario_exacto = models.DecimalField(max_digits=10, decimal_places=2)
    requisitos_excluyentes = models.CharField(max_length=CHAR_LENGTH_LONG_DESCRIPTION)
    requisitos_no_excluyentes = models.CharField(max_length=CHAR_LENGTH_LONG_DESCRIPTION)
    anio_en_curso = models.IntegerField()
    creditos_minimos = models.IntegerField()
    tipo_de_contrato = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    tareas_a_desarrollar = models.CharField(max_length=CHAR_LENGTH_LONG_DESCRIPTION)
    horario = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    observaciones = models.CharField(max_length=CHAR_LENGTH_LONG_DESCRIPTION)
    departamento = models.CharField(max_length=CHAR_LENGTH_LONG_DESCRIPTION)
    PRESENCIAL = 0
    HIBRIDO = 1
    REMOTO = 2
    MODALIDAD = (
        (PRESENCIAL, "Presencial"),
        (HIBRIDO, "Hibrido"),
        (REMOTO, "Remoto"),
    )
    modalidad = models.IntegerField(choices=MODALIDAD, default=PRESENCIAL)


class Llamado(AbstractLlamado):
    """
    Llamados a los que los estudiantes pueden postularse y que crean las empresas.
    """

    PENDIENTE = 0
    RECHAZADO = 1
    APROBADO = 2
    PENDIENTE_MODIFICACION = 3
    ESTADOS = (
        (PENDIENTE, "Pendiente"),
        (RECHAZADO, "Rechazado"),
        (APROBADO, "Aprobado"),
        (PENDIENTE_MODIFICACION, "Pendiente modificacion"),
    )
    estado = models.IntegerField(choices=ESTADOS, default=PENDIENTE)

    fecha_finalizacion = models.DateField()

    empresa = models.ForeignKey(
        Empresa, on_delete=models.CASCADE, default=None
    )  # TODO: default=None es un parche para el protitpo
    carreras = models.ManyToManyField(Carrera, through="LLamadoCarrera")
    etiquetas = models.ManyToManyField(Etiqueta)


class LLamadoCarrera(models.Model):
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE)
    llamado = models.ForeignKey(Llamado, on_delete=models.CASCADE)

    creditosObtenidos = models.IntegerField
    ultimoAnioAprobado = models.IntegerField


class Estudiante(models.Model):
    """
    Estudiantes que buscaran encontrar trabajo mediante el sitio web.
    """

    loggeable = models.OneToOneField(
        Loggeable,
        on_delete=models.CASCADE,
        unique=True,
    )

    idiomas = models.ManyToManyField(Idioma)
    etiquetas = models.ManyToManyField(Etiqueta, blank=True)

    postulaciones = models.ManyToManyField(Llamado, through="Postulacion", blank=True)
    carreras = models.ManyToManyField(Carrera, through="EstudianteCarrera")

    telefonos = ArrayField(models.CharField(max_length=CHAR_LENGTH_TINY_DESCRIPTION))
    nombres = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    apellidos = models.CharField(max_length=CHAR_LENGTH_SHORT_DESCRIPTION)
    habilidades_tecnicas = models.CharField(max_length=CHAR_LENGTH_LONG_DESCRIPTION)
    presentacion_gral = models.CharField(max_length=CHAR_LENGTH_LONG_DESCRIPTION)
    imagen = models.FileField(upload_to="estudiantes/imagenes", blank=True)
    escolaridad = models.FileField(upload_to="estudiantes/escolaridades", blank=True)
    cv = models.FileField(upload_to="estudiantes/cv", blank=True)


class Administrador(models.Model):
    """
    Administradores que pueden aprobar o rechazar llamados y propuestas de cambio.
    """

    loggeable = models.OneToOneField(Loggeable, on_delete=models.CASCADE, unique=True)


class PropuestaCambioLLamado(AbstractLlamado):
    """
    Propuesta de cambios a realizar en los datos de un llamado.
    """

    PENDIENTE = 0
    RECHAZADO = 1
    APROBADO = 2
    ESTADOS = (
        (PENDIENTE, "Pendiente"),
        (RECHAZADO, "Rechazado"),
        (APROBADO, "Aprobado"),
    )
    estado = models.IntegerField(choices=ESTADOS, default=PENDIENTE)

    llamado = models.OneToOneField(Llamado, on_delete=models.CASCADE)


class EstudianteCarrera(models.Model):
    """
    Modelo que relaciona un estudiante y las carreras que cursa.
    """

    suscrito_notificaciones = models.BooleanField()
    creditos_obtenidos = models.IntegerField(validators=[MaxValueValidator(450), MinValueValidator(0)])
    ultimo_anio_aprobado = models.IntegerField

    estudiante = models.ForeignKey(Estudiante, on_delete=models.CASCADE)
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE)


class Postulacion(models.Model):
    """
    Objetos relacionales entre Estudiantes y Postulaciones
    """

    escolaridad = models.FileField(upload_to="postulaciones/escolaridades")
    cv = models.FileField(upload_to="postulaciones/cv")

    llamado = models.ForeignKey(Llamado, on_delete=models.CASCADE)
    estudiante = models.ForeignKey(Estudiante, on_delete=models.CASCADE)
