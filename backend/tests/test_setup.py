import io

from PIL import Image
from django.core.files import File

from rest_framework.test import APITestCase

from order.models import Order, OrderProduct, OrderStatus
from payment.models import Payment
from product.models import (
    Product,
    ProductImage,
    Tag,
    Category,
    ProductOption,
    ProductTag,
)
from user.models import User


def generate_photo_file():
    """테스트 이미지 파일 반환"""
    file = io.BytesIO()
    image = Image.new("RGBA", size=(100, 100), color=(155, 0, 0))
    image.save(file, "png")
    file.name = "test_photo.png"
    file.seek(0)

    return File(file)


class TestSetUp(APITestCase):
    """상품 API Unit Test"""

    def setUp(self) -> None:
        self.username = "adam"
        self.email = "adam@test.com"
        self.password = "adam"
        self.user = User.objects.create_user(self.email, self.password)  # 일반 유저 생성
        self.admin_email = "admin@admin.com"
        self.admin_password = "admin"
        self.super_user = User.objects.create_superuser(
            self.admin_email, self.admin_password
        )  # 관리자 생성
        self.api_authentication(self.email, self.password)  # 유저인증

        Tag.objects.bulk_create(
            [Tag(id=1, name="BEST"), Tag(id=2, name="SOLD_OUT"), Tag(id=3, name="MD")]
        )

        Category.objects.bulk_create(
            [Category(id=1, name="store"), Category(id=2, name="")]
        )

        Product.objects.bulk_create(
            [
                Product(
                    id=1,
                    name="구기자",
                    category=Category.objects.get(id=1),
                    description="설명이 필요 없는 구기자",
                    price=100000,
                    discounted_price=70000,
                    stock=100,
                ),
                Product(
                    id=2,
                    name="사과",
                    category=Category.objects.get(id=1),
                    description="설명이 필요 없는 사과",
                    price=150000,
                    discounted_price=125000,
                    stock=100,
                ),
            ]
        )
        product_1 = Product.objects.get(id=1)
        image = generate_photo_file()

        ProductImage.objects.bulk_create(
            [
                ProductImage(
                    product=product_1,
                    is_thumbnail=True,
                    image=image,
                    origin_name=image.name,
                    file_size=image.size,
                ),
                ProductImage(
                    product=product_1,
                    is_thumbnail=False,
                    image=image,
                    origin_name=image.name,
                    file_size=image.size,
                ),
            ]
        )

        ProductTag.objects.bulk_create(
            [
                ProductTag(
                    product=Product.objects.get(id=1), tag=Tag.objects.get(id=1)
                ),
                ProductTag(
                    product=Product.objects.get(id=1), tag=Tag.objects.get(id=2)
                ),
            ]
        )

        ProductOption.objects.bulk_create(
            [
                ProductOption(id=1, product=product_1, name="소", extra_option_price=0),
                ProductOption(
                    id=2, product=product_1, name="중", extra_option_price=5000
                ),
                ProductOption(
                    id=3, product=product_1, name="대", extra_option_price=10000
                ),
            ]
        )

        OrderStatus.objects.bulk_create(
            [
                OrderStatus(id=1, name="주문완료"),
                OrderStatus(id=2, name="결제완료"),
                OrderStatus(id=3, name="배송중"),
            ]
        )

        Order.objects.bulk_create(
            [
                Order(
                    id=1,
                    user=User.objects.get(email="adam@test.com"),
                    address="송파구",
                    postal_code="123456",
                    receiver_name="홍길동",
                ),
                Order(
                    id=2,
                    user=User.objects.get(email="admin@admin.com"),
                    address="종로구",
                    postal_code="124421",
                    receiver_name="나폴레옹",
                ),
                Order(
                    id=3,
                    user=User.objects.get(email="admin@admin.com"),
                    address="행신동",
                    postal_code="999999",
                    receiver_name="이순신",
                ),
            ]
        )

        product_option_1 = ProductOption.objects.get(id=1)
        product_option_2 = ProductOption.objects.get(id=2)
        product_option_3 = ProductOption.objects.get(id=3)

        order_1 = Order.objects.get(id=1)
        order_2 = Order.objects.get(id=2)
        order_3 = Order.objects.get(id=3)

        OrderProduct.objects.bulk_create(
            [
                OrderProduct(
                    order=order_1,
                    product_option=product_option_1,
                    order_status=OrderStatus.objects.get(id=1),
                    product_quantity=3,
                    delivery_fee=3000,
                    order_product_price=product_option_1.extra_option_price
                    + product_option_1.product.discounted_price,
                ),
                OrderProduct(
                    order=order_1,
                    product_option=product_option_2,
                    order_status=OrderStatus.objects.get(id=1),
                    product_quantity=1,
                    delivery_fee=4000,
                    order_product_price=product_option_2.extra_option_price
                    + product_option_2.product.discounted_price,
                ),
                OrderProduct(
                    order=order_2,
                    product_option=product_option_3,
                    order_status=OrderStatus.objects.get(id=1),
                    product_quantity=5,
                    delivery_fee=5000,
                    order_product_price=product_option_3.extra_option_price
                    + product_option_3.product.discounted_price,
                ),
                OrderProduct(
                    order=order_3,
                    product_option=product_option_3,
                    order_status=OrderStatus.objects.get(id=1),
                    product_quantity=5,
                    delivery_fee=5000,
                    order_product_price=product_option_3.extra_option_price
                    + product_option_3.product.discounted_price,
                ),
            ]
        )

        # 상품을 주문한 총 금액 계산
        for op in order_1.order_products.all():
            op.order_product_price = (
                op.product_option.extra_option_price
                + op.product_option.product.discounted_price
            )
            op.save()
            order_1.total_amount += (
                op.order_product_price * op.product_quantity
            ) + op.delivery_fee
            order_1.save()

        for op in order_2.order_products.all():
            op.order_product_price = (
                op.product_option.extra_option_price
                + op.product_option.product.discounted_price
            )
            op.save()
            order_2.total_amount += (
                op.order_product_price * op.product_quantity
            ) + op.delivery_fee
            order_2.save()

        for op in order_3.order_products.all():
            op.order_product_price = (
                op.product_option.extra_option_price
                + op.product_option.product.discounted_price
            )
            op.save()
            order_3.total_amount += (
                op.order_product_price * op.product_quantity
            ) + op.delivery_fee
            order_3.save()

        Payment.objects.create(
            id=1,
            order=Order.objects.get(id=1),
            payment_method="CC",
            payment_total_amount=292000,
            payment_status="PC",
        )

        Payment.objects.create(
            id=2,
            order=Order.objects.get(id=3),
            payment_method="CC",
            payment_total_amount=292000,
            payment_status="PC",
        )

        return super().setUp()

    def api_authentication(self, email, password):
        """
        유저 인증
        :param email:
        :param password:
        :return:
        """
        res = self.client.post(
            "/api/v1/users/login/",
            {"email": email, "password": password},
        )
        self.client.credentials(
            HTTP_AUTHORIZATION="Bearer " + res.data.get("access_token")
        )

    def tearDown(self):
        ProductOption.objects.all().delete()
        ProductTag.objects.all().delete()
        Product.objects.all().delete()
        Category.objects.all().delete()
        Tag.objects.all().delete()
        ProductImage.objects.all().delete()
        OrderStatus.objects.all().delete()
        OrderProduct.objects.all().delete()
        Order.objects.all().delete()
        Payment.objects.all().delete()

        return super().tearDown()
