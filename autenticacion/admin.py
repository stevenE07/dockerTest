from django.contrib import admin
from django.contrib.auth import get_user_model
from django.contrib.auth.admin import UserAdmin

from .forms import LoggeableChangeForm, LoggeableCreationForm

# Register your models here.
Loggeable = get_user_model()


class CustomUserAdmin(UserAdmin):
    add_form = LoggeableCreationForm
    form = LoggeableChangeForm
    model = Loggeable
    list_display = (
        "email",
        "is_staff",
        "is_active",
    )
    list_filter = (
        "email",
        "is_staff",
        "is_active",
    )
    fieldsets = (
        (None, {"fields": ("email", "password")}),
        ("Permissions", {"fields": ("is_staff", "is_active", "groups", "user_permissions")}),
    )
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": ("email", "password1", "password2", "is_staff", "is_active", "groups", "user_permissions"),
            },
        ),
    )
    search_fields = ("email",)
    ordering = ("email",)


admin.site.register(Loggeable, CustomUserAdmin)
