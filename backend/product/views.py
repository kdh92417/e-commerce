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

    def get_serializer_context(self):
        context = super().get_serializer_context()
        if self.action == "list":
            print("list")
            # context['exclude_fields'] = ['parts']
        return context

    # def list(self, request, *args, **kwargs):
    #     queryset = self.filter_queryset(self.get_queryset())
    #
    #     page = self.paginate_queryset(queryset)
    #     if page is not None:
    #         serializer = self.get_serializer(page, many=True)
    #         return self.get_paginated_response(serializer.data)
    #
    #     serializer = self.get_serializer(queryset, many=True)
    #     return Response(serializer.data)
