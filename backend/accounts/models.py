from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    class Role(models.TextChoices):
        STUDENT = "student", "Estudiante"
        TEACHER = "teacher", "Docente"
        ADMINISTRATOR = "administrator", "Administrador"

    role = models.CharField(max_length=20, choices=Role.choices, default=Role.STUDENT)
