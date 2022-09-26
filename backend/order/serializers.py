from django.db import transaction
from rest_framework import serializers
from rest_framework.exceptions import ValidationError

from order.models import Order, OrderProduct
from user.serializers import UserSerializer

# TODO: 주문할경우 stock 감소


class OrderProductSerializer(serializers.ModelSerializer):
    """주문상품 Serializer"""

    class Meta:
        model = OrderProduct
        fields = "__all__"

    def get_fields(self):
        """필드 제외 기능 추가"""
        fields = super().get_fields()

        exclude_fields = self.context.get("exclude_fields", [])
        for field in exclude_fields:
            fields.pop(field, default=None)

        return fields


class OrderSerializer(serializers.ModelSerializer):
    """주문 Serializer"""

    user = serializers.SerializerMethodField()
    order_products = OrderProductSerializer(many=True)

    class Meta:
        model = Order
        fields = "__all__"

    def get_user(self, obj):
        return UserSerializer(instance=obj.user, many=False, context=self.context).data

    def get_fields(self):
        """필드 제외 기능 추가"""
        fields = super().get_fields()
        exclude_fields = self.context.get("exclude_fields", [])
        for field in exclude_fields:
            fields.pop(field, default=None)

        return fields

    @transaction.atomic
    def create(self, validated_data):
        """주문 및 주문 상품 생성"""
        try:
            order_products = validated_data.pop("order_products")  # 주문상품
            user = self.context["request"].user  # 유저

            # 주문 생성
            order = Order.objects.create(user=user, **validated_data)

            # 주문한 상품 정보리스트 저장, 주문 테이블과 역참조
            for order_product in order_products:
                obj = OrderProduct(order=order, **order_product)
                obj.order_product_price = (
                    obj.product_option.extra_option_price
                    + obj.product_option.product.discounted_price
                )
                obj.save()
                order.total_amount += (
                    obj.order_product_price * obj.product_quantity
                ) + obj.delivery_fee
                order.save()

            return order

        except Exception as e:
            transaction.set_rollback(rollback=True)
            return ValidationError(str(e))

    def update(self, instance, validated_data):
        """주문수정 유저와 주문생성 유저 유효성검사"""
        is_staff = self.context["request"].user.is_staff
        is_user_equal = True if instance.user == self.context["request"].user else False
        if not is_staff and not is_user_equal:
            raise ValidationError("주문한 유저가 아닙니다.")

        return super().update(instance, validated_data)
