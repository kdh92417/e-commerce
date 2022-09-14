from django.db import transaction
from rest_framework import serializers
from rest_framework.exceptions import ValidationError

from order.models import Order, OrderStatus
from payment.models import Payment


class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = "__all__"

    def validate_payment_total_amount(self, payment_total_amount: str):
        """
        결제금액 유효성 검사
            - 결제금액이 주문금액과 동일해야됨
        :param payment_total_amount:
        :return:
        """
        try:
            order_id = self.context["request"].data.get("order", None)
            payment_order = Order.objects.get(id=order_id)

            if payment_total_amount < payment_order.total_amount:
                raise ValidationError("결제금액이 주문하신 금액에 모자랍니다.")
            elif payment_total_amount > payment_order.total_amount:
                raise ValidationError("결제금액이 주문하신 금액보다 초과하여 결제하셨습니다.")

            return payment_total_amount

        except Order.DoesNotExist as e:
            raise ValidationError("존재하지 않는 주문 입니다.")

    def update(self, instance, validated_data):
        """결제수정 요청한 유저와 결제한 유저 유효성검사"""
        is_staff = self.context["request"].user.is_staff
        is_user_equal = True if instance.order.user == self.context["request"].user else False
        if not is_staff and not is_user_equal:
            raise ValidationError("결제한 유저가 아닙니다.")

        return super().update(instance, validated_data)

    @transaction.atomic()
    def create(self, validated_data):
        """결제 정보 저장 및 주문한상품의 상태 결제완료로 변경"""
        try:
            order = validated_data.pop("order", None)
            if Payment.objects.filter(order=order).exists():
                raise ValidationError("이미 결제한 주문입니다.")

            payment = Payment.objects.create(order=order, **validated_data)

            for op in order.order_products.all():
                op.order_status = OrderStatus.objects.get(id=2)
                op.save()

            return payment

        except Exception as e:
            transaction.set_rollback(rollback=True)
            raise ValidationError(str(e))

