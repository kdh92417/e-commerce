from django.contrib.auth import get_user_model
from django.db import models

from core.models import TimeStampModel
from product.models import Product


class Order(TimeStampModel):
    """주문 모델"""

    user = models.ForeignKey(
        get_user_model(), on_delete=models.CASCADE, null=False, blank=False
    )
    address = models.CharField(max_length=300)
    postal_code = models.CharField(max_length=45)
    receiver_name = models.CharField(max_length=45)

    class Meta:
        db_table = "orders"


class OrderStatus(models.Model):
    """주문 상태 모델"""

    name = models.CharField(max_length=45)

    class Meta:
        db_table = "order_status"

    def __str__(self):
        return self.name


class OrderDetail(TimeStampModel):
    """주문상세 모델"""

    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=False, blank=False)
    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, null=False, blank=False
    )
    status = models.ForeignKey(
        OrderStatus, on_delete=models.CASCADE, null=False, blank=False
    )
    product_quantity = models.IntegerField(default=1, null=False, blank=False)
    product_price = models.IntegerField(default=0, null=False, blank=False)

    class Meta:
        db_table = "order_details"


class Payment(models.Model):
    """결재 모델"""

    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=False, blank=False)
    payment_method = models.CharField(max_length=45)
    amount = models.IntegerField()
    payment_date = models.DateTimeField()
    payment_status = models.CharField(max_length=45)

    class Meta:
        db_table = "payments"
