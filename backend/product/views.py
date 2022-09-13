from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, viewsets
from rest_framework.response import Response
from rest_framework.utils import json
from rest_framework.views import APIView

from product.models import Product
from product.serializers import ProductSerializer, ProductImageSerializer


class ProductView(viewsets.ModelViewSet):
    """
    상품 조회, 생성, 수정, 삭제 API
    """

    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ["category"]

    def get_serializer_context(self):
        """불필요한 필드 제거"""
        context = super().get_serializer_context()
        if self.action == "list":
            context["exclude_fields"] = [
                "create_time",
                "update_time",
                "stock",
                "detail",
            ]
        return context
