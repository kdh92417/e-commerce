from django.core.exceptions import ObjectDoesNotExist

from rest_framework.reverse import reverse
from rest_framework import status

from product.models import Product
from tests.test_setup import TestSetUp, generate_photo_file


class ProductViewTest(TestSetUp):
    """상품 API Unit Test"""

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

        response = self.client.post(
            reverse("products:product-list"), new_product, format="multipart"
        )

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Product.objects.count(), 3)

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

        response = self.client.post(
            reverse("products:product-list"), new_product, format="multipart"
        )

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
