from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated, IsAdminUser

from order.models import Order
from order.serializers import OrderSerializer


class OrderView(viewsets.ModelViewSet):
    """주문 생성, 리스트 조회, 상세조회, 삭제, 수정 API"""

    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [IsAuthenticated]

    def get_serializer_context(self):
        """불필요한 필드 제거"""
        context = super().get_serializer_context()
        if self.action == "create":
            context["exclude_fields"] = [
                "order",
            ]
        return context
