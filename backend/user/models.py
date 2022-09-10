from django.contrib.auth.models import PermissionsMixin, UserManager
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.db import models
from django.contrib.auth.base_user import AbstractBaseUser
from django.utils.translation import gettext_lazy as _

from backend.core.models import TimeStampModel


class User(AbstractBaseUser, PermissionsMixin, TimeStampModel):
    """유저 모델"""
    username_validator = UnicodeUsernameValidator()

    username = models.CharField(_("username"), max_length=45, validators=[username_validator], null=True)
    email = models.EmailField(_("email_address"), unique=True)
    is_staff = models.BooleanField(_("Is staff"), default=False)

    object = UserManager()
    USERNAME_FIELD = "email"
    EMAIL_FIELD = "email"
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = _("user")
        verbose_name_plural = _("users")
        db_table = "users"

    def clean(self):
        super().clean()
        self.email = self.__class__.objects.normalize_email(self.email)

