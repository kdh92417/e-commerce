from django.contrib.auth.models import PermissionsMixin, UserManager
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.db import models
from django.contrib.auth.base_user import AbstractBaseUser
from django.utils.translation import gettext_lazy as _

from core.models import TimeStampModel
from product.models import Product


class User(AbstractBaseUser, PermissionsMixin, TimeStampModel):
    """유저 모델"""

    username_validator = UnicodeUsernameValidator()

    username = models.CharField(
        _("username"), max_length=45, validators=[username_validator], null=True
    )
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
