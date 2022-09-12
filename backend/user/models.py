from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.db import models
from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.utils.translation import gettext_lazy as _

from core.models import TimeStampModel
from product.models import Product


class UserManager(BaseUserManager):
    """유저매니저 재정의"""

    def create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError(_('The Email must be set'))
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        # extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True.'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True.'))
        return self.create_user(email, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin, TimeStampModel):
    """유저 모델"""

    username_validator = UnicodeUsernameValidator()

    username = models.CharField(
        _("username"), max_length=45, validators=[username_validator], null=True
    )
    email = models.EmailField(_("email_address"), unique=True)
    is_staff = models.BooleanField(_("Is staff"), default=False)

    objects = UserManager()
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


class Cart(models.Model):
    """장바구니 모델"""

    user = models.ForeignKey(User, on_delete=models.CASCADE, null=False, blank=False)
    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, null=False, blank=False
    )
    quantity = models.IntegerField(default=1, null=False, blank=False)
    product_price = models.IntegerField(default=0, null=False, blank=False)

    class Meta:
        db_table = "carts"
