# PIUTTEC (2.0)

<p align="center">
  <img src="docs/assets/piuttec-ii-logo.png" alt="Logo principal de PIUTTEC II" width="820">
</p>

<p align="center">
  <strong>Ícono para Android</strong><br>
  <img src="docs/assets/piuttec-ii-android.png" alt="Ícono de PIUTTEC II para Android" width="240">
</p>

Prototipo web de una plataforma de gestión académica, trámites institucionales y refuerzo del aprendizaje para la Universidad Tecnológica de Tecámac. El proyecto propone ampliar PIUTTEC para que estudiantes, docentes y personal administrativo puedan consultar información académica y gestionar solicitudes desde un mismo lugar.

## Qué incluye el prototipo

- Panel con indicadores académicos, materias inscritas, asistencias y clases del día.
- Agenda de entregas y evaluaciones.
- Simulación de reservas de salones y laboratorios y de préstamos de equipos.
- Gestor de archivos simulado, directorio docente y calculadora de promedio.
- **Refuerzo Académico** con una práctica de tres preguntas sobre fundamentos de redes digitales, puntuación y explicación de cada respuesta.

## Cómo probarlo

Abre [el archivo HTML](portal_de_gesti_n_acad_mica_e_institucional.html) en un navegador. La página carga Tailwind CSS, Font Awesome e Inter desde internet. Usa datos de demostración y guarda los cambios de los módulos existentes en el almacenamiento local del navegador. La práctica de refuerzo se puede reiniciar en cualquier momento.

## Alcance documentado

La propuesta contempla un panel de rendimiento académico, horarios y calendario, comparación del rendimiento del estudiante con el promedio grupal y seguimiento de solicitudes de laboratorios, equipos y justificantes. El módulo de refuerzo contempla ejercicios organizados por carrera, cuatrimestre y parcial, seguimiento del progreso, retos, logros y recordatorios.

La arquitectura prevista usa **Flutter y Dart** para web, Android e iOS, **Django y Django REST Framework** para la API y **PostgreSQL** para los datos. El acceso institucional contempla autenticación con JWT y permisos para estudiantes, docentes y administradores. El repositorio conserva el prototipo HTML e incorpora una primera base local de Flutter y Django.

## Desarrollo local

La demo HTML se abre como antes desde la raíz. La base de la aplicación está en frontend/ y la API en backend/.

La API incluye autenticación JWT con usuario y contraseña, renovación del token, un usuario con campo de rol institucional y un panel de demostración disponible durante el desarrollo. La interfaz inicial incluye el panel y la navegación adaptable. La pantalla de inicio de sesión, la autorización específica de cada módulo y sus operaciones se desarrollarán en las siguientes iteraciones.

### Servidor en Windows

~~~powershell
cd backend
python -m venv .venv
.venv/Scripts/python.exe -m pip install -r requirements.txt
Copy-Item .env.example .env
.venv/Scripts/python.exe manage.py migrate
.venv/Scripts/python.exe manage.py runserver
~~~

El entorno usa SQLite de forma predeterminada para iniciar el desarrollo. Para usar PostgreSQL, crea una base y configura DB_ENGINE=postgres y las variables PG* en backend/.env antes de ejecutar las migraciones. Configura una DJANGO_SECRET_KEY estable en ese archivo si vas a trabajar con sesiones entre reinicios. El archivo .env y la base local quedan excluidos de Git.

Para crear una cuenta local usa .venv/Scripts/python.exe manage.py createsuperuser. El administrador de Django está en http://127.0.0.1:8000/admin/. Los roles institucionales se asignan allí, mientras que los permisos específicos de negocio se incorporarán al implementar los módulos.

### Aplicación en otra terminal

~~~powershell
cd frontend
flutter pub get
flutter run -d chrome --web-port 5173
~~~

El panel consulta http://127.0.0.1:8000/api/demo/dashboard/. Esta ruta entrega exclusivamente datos de ejemplo del HTML y se habilita con DJANGO_DEBUG=1. La API de autenticación está en /api/auth/login/ y /api/auth/refresh/. Las rutas futuras requieren autenticación por defecto.

### Verificación

~~~powershell
cd backend
.venv/Scripts/python.exe manage.py check
.venv/Scripts/python.exe manage.py makemigrations --check --dry-run
cd ../frontend
flutter analyze
flutter build web
~~~

## Equipo

- Marco Antonio Vázquez López
- Yoshiro Pablo Armando Riaño Ishiuara
- Gabriel Arturo Najera Esparza
- Luis Felipe Ambrosio Velazquez
- Francisco Hernandez Antonio

Este es un documento para buenas practicas
