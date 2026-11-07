# PIUTTEC (2.0)

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

La arquitectura prevista usa **Flutter y Dart** para web, Android e iOS, **Django y Django REST Framework** para la API y **PostgreSQL** para los datos. El acceso institucional contempla autenticación con JWT y permisos para estudiantes, docentes y administradores. La versión de este repositorio es un prototipo en HTML, JavaScript y Tailwind CSS.

## Equipo

- Marco Antonio Vázquez López
- Yoshiro Pablo Armando Riaño Ishiuara
- Gabriel Arturo Najera Esparza
- Luis Felipe Ambrosio Velazquez
- Francisco Hernandez Antonio

- Este es un documento para buenas practicas
