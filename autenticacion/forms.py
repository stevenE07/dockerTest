from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserChangeForm, UserCreationForm


class LoggeableCreationForm(UserCreationForm):
    class Meta:
        model = get_user_model()
        fields = ("email",)


class LoggeableChangeForm(UserChangeForm):
    class Meta:
        model = get_user_model()
        fields = ("email",)
