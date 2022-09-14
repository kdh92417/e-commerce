from django.contrib.auth import get_user_model
from django.db import models

from core.models import TimeStampModel
from product.models import ProductOption


class Order(TimeStampModel):
    """주문 모델"""

    user = models.ForeignKey(
        get_user_model(), on_delete=models.CASCADE, null=False, blank=False
    )
    address = models.CharField(max_length=300)
    postal_code = models.CharField(max_length=45)
    receiver_name = models.CharField(max_length=45)
    total_amount = models.IntegerField(default=0)
    order_date = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "orders"


class OrderStatus(models.Model):
    """주문 상태 모델"""

    name = models.CharField(max_length=45)

    class Meta:
        db_table = "order_status"

    def __str__(self):
        return self.name


class OrderProduct(TimeStampModel):
    """주문상세 모델"""

    order = models.ForeignKey(
        Order,
        on_delete=models.CASCADE,
        null=False,
        blank=False,
        related_name="order_products",
    )
    product_option = models.ForeignKey(
        ProductOption, on_delete=models.CASCADE, null=False, blank=False
    )
    order_status = models.ForeignKey(
        OrderStatus, on_delete=models.CASCADE, null=True, blank=True
    )
    product_quantity = models.IntegerField(default=1, null=False, blank=False)
    order_product_price = models.IntegerField(default=0, null=False, blank=False)
    delivery_fee = models.IntegerField(default=0, null=False, blank=False)

    class Meta:
        db_table = "order_products"
