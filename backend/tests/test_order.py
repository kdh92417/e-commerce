from django.core.exceptions import ObjectDoesNotExist
from rest_framework import status
from rest_framework.reverse import reverse

from order.models import Order
from tests.test_setup import TestSetUp


class OrderViewTest(TestSetUp):
    """주문 API Unit Test"""

    def test_get_order_list_from_admin(self):
        """관리자 주문 리스트 조회 Test : 모든 주문이 조회"""
        self.api_authentication(self.admin_email, self.admin_password)
        response = self.client.get(reverse("orders:order-list"), format="json")

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 2)

    def test_get_order_list_from_user(self):
        """일반 회원 주문 리스트 조회 Test : 자신이 등록한 주문만 조회"""
        response = self.client.get(reverse("orders:order-list"), format="json")

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_create_order_correctly(self):
        """주문 생성 Test"""
        new_order = {
            "address": "강서구 강서로 19아길",
            "postal_code": "33821",
            "receiver_name": "홍길동",
            "order_products": [
                {
                    "product_option": 1,
                    "order_status": 1,
                    "product_quantity": 7,
                    "delivery_fee": 4500,
                },
                {
                    "product_option": 2,
                    "order_status": 1,
                    "product_quantity": 30,
                    "delivery_fee": 7000,
                },
                {
                    "product_option": 3,
                    "order_status": 1,
                    "product_quantity": 100,
                    "delivery_fee": 10000,
                },
            ],
        }

        response = self.client.post(
            reverse("orders:order-list"), new_order, format="json"
        )
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Order.objects.count(), 3)

    def test_retrieve_order(self):
        """주문 상세 조회"""
        response = self.client.get(
            reverse("orders:order-detail", args=[1]), format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_failed_retrieve_order_due_to_does_not_exists(self):
        """존재 하지 않는 상세주문 조회 에러 Test"""
        response = self.client.get(
            reverse("orders:order-detail", args=[4]), format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_failed_retrieve_order_due_to_permission_error(self):
        """관리자가 아닌 일반유저가 다른 주문을 조회시 에러 Test"""
        response = self.client.get(
            reverse("orders:order-detail", args=[2]), format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN)

    def test_success_update_order(self):
        """주문 수정 Test"""
        update_order = {
            "address": "수정 주소",
            "postal_code": "141414",
            "receiver_name": "김수정",
        }

        response = self.client.patch(
            reverse("orders:order-detail", args=[1]), update_order, format="json"
        )

        updated_order = Order.objects.get(id=1)

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(updated_order.address, update_order["address"])
        self.assertEqual(updated_order.postal_code, update_order["postal_code"])
        self.assertEqual(updated_order.receiver_name, update_order["receiver_name"])

    def test_success_delete_order(self):
        """주문 삭제 Test"""
        response = self.client.delete(
            reverse("orders:order-detail", args=[1]), format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Order.objects.count(), 1)
        with self.assertRaises(ObjectDoesNotExist):
            Order.objects.get(id=1)
