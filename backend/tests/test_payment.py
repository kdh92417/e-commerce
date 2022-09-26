from django.core.exceptions import ObjectDoesNotExist
from rest_framework import status
from rest_framework.reverse import reverse

from payment.models import Payment
from tests.test_setup import TestSetUp


class PaymentViewTest(TestSetUp):
    """결제 API Test"""

    def test_success_get_payment_list(self):
        """결제 리스트 조회 Test"""
        response = self.client.get(reverse("payments:payment-list"), format="json")

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 2)

    def test_success_create_payment(self):
        """결제 생성 Test"""
        payment_data = {
            "order": 2,
            "payment_method": "CC",
            "payment_total_amount": 405000,
        }
        response = self.client.post(
            reverse("payments:payment-list"), payment_data, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data.get("payment_status"), "PC")

    def test_failed_create_payment_does_not_exists_order(self):
        """존재 하지 않는 주문에대한 결제 오류 Test"""
        payment_data = {
            "order": 9,
            "payment_method": "CC",
            "payment_total_amount": 405000,
        }
        response = self.client.post(
            reverse("payments:payment-list"), payment_data, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_failed_create_payment_not_enough_payment(self):
        """결제한 금액에대한 오류 Test"""
        payment_data = {
            "order": 2,
            "payment_method": "CC",
            "payment_total_amount": 400000,
        }
        response = self.client.post(
            reverse("payments:payment-list"), payment_data, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(
            response.json()["payment_total_amount"], ["결제금액이 주문하신 금액에 모자랍니다."]
        )

    def test_success_retrieve_payment(self):
        """결제 상세조회 Test"""
        response = self.client.get(
            reverse("payments:payment-detail", args=[1]), format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data.get("id"), 1)

    def test_failed_retrieve_payment_not_exists_order(self):
        """존재하지 않는 결제애대한 오류 Test"""
        response = self.client.get(
            reverse("payments:payment-detail", args=[3]), format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)

    def test_success_update_payment(self):
        """결제 수정 Test"""
        update_payment = {"payment_method": "DB"}

        response = self.client.patch(
            reverse("payments:payment-detail", args=[1]), update_payment, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data.get("payment_method"), "DB")

    def test_failed_update_payment_permission_error(self):
        """일반유저의 다른유저의 주문에대한 결제 오류 Test"""
        update_payment = {"payment_method": "DB"}

        response = self.client.patch(
            reverse("payments:payment-detail", args=[2]), update_payment, format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.json(), ["결제한 유저가 아닙니다."])

    def test_success_delete_payment(self):
        """결제정보 삭제 Test"""
        response = self.client.delete(
            reverse("payments:payment-detail", args=[1]), format="json"
        )

        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(Payment.objects.count(), 1)
        with self.assertRaises(ObjectDoesNotExist):
            Payment.objects.get(id=1)
