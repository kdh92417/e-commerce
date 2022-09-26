from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from core.permissions import IsAdminOrSameUser
from order.models import Order
from order.serializers import OrderSerializer


class OrderView(viewsets.ModelViewSet):
    """주문 생성, 리스트 조회, 상세조회, 삭제, 수정 API"""

    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = [IsAuthenticated & IsAdminOrSameUser]

    def get_serializer_context(self):
        """불필요한 필드 제거"""
        context = super().get_serializer_context()
        if self.action == "create":
            context["exclude_fields"] = [
                "order",
            ]

        return context

    def get_queryset(self):
        """
        권한에 따른 주문조호 필터링
        - 관리자 : 모든 주문 조회
        - 일반회원 : 자신이 등록한 주문만 조회
        :return:
        """
        queryset = super(OrderView, self).get_queryset()
        if self.action == "list" and not self.request.user.is_staff:
            queryset = Order.objects.filter(user=self.request.user.id)

        return queryset
