import io

from PIL import Image
from django.core.exceptions import ObjectDoesNotExist
from django.core.files import File

from rest_framework.reverse import reverse
from rest_framework import status
from rest_framework.test import APITestCase, APIRequestFactory

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


class ProductViewTest(APITestCase):
    """상품 API Unit Test"""

    def setUp(self) -> None:
        self.factory = APIRequestFactory()
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
                    stock=100,
                ),
                Product(
                    id=2,
                    name="사과",
                    category=Category.objects.get(id=1),
                    description="설명이 필요 없는 사과",
                    price=150000,
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

    def test_get_product_list(self):
        """상품 리스트 조회 테스트"""
        response = self.client.get(reverse("products:product-list"), format="json")

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 2)
        self.assertEqual(response.data[0]["name"], "구기자")
        self.assertEqual(response.data[1]["name"], "사과")

    def test_retrieve_product_correctly(self):
        """상품 상세 조회 테스트"""
        response = self.client.get(reverse("products:product-detail", args=[1]))

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data.get("name"), "구기자")

    def test_retrieve_product_does_not_exists(self):
        """존재하지 않는 상품 상세 조회 Error 테스트"""
        response = self.client.get(reverse("products:product-detail", args=[5]))

        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_create_product_correctly(self):
        """상품 생성 테스트"""
        # 관리자 인증
        self.api_authentication(self.admin_email, self.admin_password)

        new_product = {
            "mainImage": generate_photo_file(),
            "name": "test",
            "tag": 1,
            "category": 1,
            "description": "test desc",
            "price": 100000,
            "discounted_price": 75000,
            "stock": 100,
        }

        response = self.client.post(reverse("products:product-list"), new_product)

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(len(Product.objects.all()), 3)

    def test_permission_error_create_product(self):
        """상품 생성 권한 테스트"""
        new_product = {
            "mainImage": generate_photo_file(),
            "name": "test",
            "tag": 1,
            "category": 1,
            "description": "test desc",
            "price": 100000,
            "discounted_price": 75000,
            "stock": 100,
        }

        response = self.client.post(reverse("products:product-list"), new_product)

        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

    def test_product_partial_update(self):
        """상품 정보 변경 테스트"""
        # 관리자 인증
        self.api_authentication(self.admin_email, self.admin_password)

        update_product = {"name": "update name", "price": 1000, "stock": 99}
        response = self.client.patch(
            reverse("products:product-detail", args=[1]), update_product
        )

        product_id_1 = Product.objects.get(id=1)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(product_id_1.name, "update name")
        self.assertEqual(product_id_1.price, 1000)
        self.assertEqual(product_id_1.stock, 99)

    def test_permission_error_product_partial_update(self):
        """상품 정보 변경 권한 에러 테스트"""

        update_product = {"name": "update name"}
        response = self.client.patch(
            reverse("products:product-detail", args=[1]), update_product
        )

        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

    def test_delete_product(self):
        """상품삭제 테스트"""
        # 관리자 인증
        self.api_authentication(self.admin_email, self.admin_password)

        response = self.client.delete(reverse("products:product-detail", args=[1]))

        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        with self.assertRaises(ObjectDoesNotExist):  # 상품이 지워졌는지 확인
            Product.objects.get(id=1)
