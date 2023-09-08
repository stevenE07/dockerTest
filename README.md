# pre-commit

Herramienta para ejecutar comandos antes de hacer un commit.

Lo usaremos para estandarización de código y análisis estático.

Docs: https://pre-commit.com/
## Instalación

```bash
$ pip install pre-commit
$ pre-commit install
```
## Uso

```bash
$ pre-commit run
```

## Evadir pre-commit
Sólo usar en casos puntuales, no abusar.
```bash
$ git commit --no-verify -m "commit message"
```


# Docker + django

1. Descargar docker hub
2. Inicializar docker:
	Iniciar docker en wsl2:
	    sudo service docker start
	En Windows:
		Abrir docker Desktop
3. Desde pis-grupo2-2023-backend, ejecutar:
	docker build -t django .
	docker-compose up

Si la base de datos da error:
- docker-compose exec web python manage.py makemigrations
- docker-compose exec web python manage.py migrate

Las carpetas que quedaron fueron generadas por este tutorial de django
https://docs.djangoproject.com/en/4.2/intro/tutorial01/#creating-a-project
## Guardar la base de datos:
docker-compose exec db pg_dump -h db -U postgres postgres > backupDB.sql
# Acceso
Ya deberían de poder acceder a las rutas:
	Listar llamados: http://localhost:8000/oftrabajo/ver-llamados/
	Cargar datos: http://localhost:8000/cargardatos/cargar-datos/
	Listar Empresas: http://localhost:8000/backoffice/ver-empresas/
	Listar Etiquetas: http://localhost:8000/backoffice/ver-etiquetas/
	Crear Llamado: http://localhost:8000/oftrabajo/crear-llamado/

Se recomienda cargar los datos previamente (segundo link). No utilizar dos veces,
únicamente para testeo y desarrollo

# Testeo
Django permite acceder directamente a la base de datos mediante un menú de administrador.
1. Ejecutar desde la terminal docker:
	python manage.py createsuperuser
	Seguir las instrucciones para crear un super usuario
2. Desde http://localhost:8000/admin, se puede acceder a un menú con estas credenciales que permite ver si las modificaciones a la base de datos son correctas.
