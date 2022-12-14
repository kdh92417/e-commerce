from django.db import models

from order.models import Order


# 주문결제 상태
PAYMENT_STATUS_CHOICES = [
    ("PC", "결재완료"),
    ("PE", "결재오류"),
    ("PW", "결재대기"),
]

# 결제수단
PAYMENT_METHODS_CHOICES = [
    ("CC", "신용카드"),
    ("DB", "무통장입금"),
]


class Payment(models.Model):
    """결재 모델"""

    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=False, blank=False)
    payment_method = models.CharField(max_length=2, choices=PAYMENT_METHODS_CHOICES)
    payment_total_amount = models.IntegerField()
    payment_date = models.DateTimeField(auto_now_add=True)
    payment_status = models.CharField(
        max_length=2,
        choices=PAYMENT_STATUS_CHOICES,
        default="PC",
        null=True,
        blank=True,
    )

    class Meta:
        db_table = "payments"
