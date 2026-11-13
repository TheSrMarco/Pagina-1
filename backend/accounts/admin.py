from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User


@admin.register(User)
class InstitutionalUserAdmin(UserAdmin):
    fieldsets = UserAdmin.fieldsets + (("Rol institucional", {"fields": ("role",)}),)
    add_fieldsets = UserAdmin.add_fieldsets + (("Rol institucional", {"fields": ("role",)}),)
    list_display = (*UserAdmin.list_display, "role")
