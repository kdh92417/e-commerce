from django.db import transaction
from rest_framework import serializers, status
from rest_framework.exceptions import ValidationError
from rest_framework.response import Response

from product.models import Product, ProductImage, ProductReply, Tag, ProductTag


# Todo: Make Abstract Serializer
# Todo: Update Product images


class TagSerializer(serializers.ModelSerializer):
    """태그 Serializer"""

    class Meta:
        model = Tag
        fields = "__all__"


# class ProductTagSerializer(serializers.ModelSerializer):
#     """프로덕트 태그 Serializer"""


class ProductImageSerializer(serializers.ModelSerializer):
    """상품 이미지 Serializer"""

    image = serializers.ImageField(use_url=True)

    class Meta:
        model = ProductImage
        fields = "__all__"

    def get_fields(self):
        """필드 제외 기능 추가"""
        fields = super().get_fields()

        exclude_fields = self.context.get("exclude_fields", [])
        for field in exclude_fields:
            fields.pop(field, default=None)

        return fields


class ProductReplySerializer(serializers.ModelSerializer):
    """상품 리뷰 Serializer"""

    class Meta:
        model = ProductReply
        fields = "__all__"


class ProductSerializer(serializers.ModelSerializer):
    """상품 Serializer"""

    image = serializers.SerializerMethodField()
    reply = ProductReplySerializer(many=True, read_only=True)
    tag = TagSerializer(many=True, read_only=True)

    class Meta:
        model = Product
        fields = "__all__"

    def get_image(self, obj):
        unnecessary_image = self.context.get("exclude_fields", None)
        if unnecessary_image and "detail" in unnecessary_image:
            image = obj.image.filter(is_thumbnail=True)
        else:
            image = obj.image.all()
        return ProductImageSerializer(
            instance=image, many=True, context=self.context
        ).data

    def get_fields(self):
        """필드 제외 기능 추가"""
        fields = super().get_fields()

        exclude_fields = self.context.get("exclude_fields", [])
        for field in exclude_fields:
            fields.pop(field, default=None)

        return fields

    @transaction.atomic
    def create(self, validated_data):
        """제품 생성"""
        images = self.context["request"].FILES
        params = self.context["request"].data

        # 제품 저장
        product = Product.objects.create(**validated_data)

        try:
            # 제품 썸네일 저장
            for thumbnail in images.getlist("mainImage"):
                ProductImage.objects.create(
                    product=product,
                    image=thumbnail,
                    origin_name=thumbnail.name,
                    file_size=thumbnail.size,
                    is_thumbnail=True,
                )

            # 제품 상세 이미지 저장
            for image in images.getlist("image"):
                ProductImage.objects.create(
                    product=product,
                    image=image,
                    origin_name=image.name,
                    file_size=image.size,
                )

            # 제품태그 저장
            for tag in params.getlist("tag"):
                ProductTag.objects.create(
                    product=product, tag=Tag.objects.get(id=int(tag))
                )

            return product

        except KeyError as e:
            transaction.set_rollback(rollback=True)
            raise ValidationError(str(e))

        except Tag.DoesNotExist as e:
            transaction.set_rollback(rollback=True)
            raise ValidationError(str(e))

    def update(self, instance, validated_data):
        """
        이미지 수정 오버라이딩
        :param instance:
        :param validated_data:
        :return:
        """
        images = self.context["request"].FILES
        return super().update(instance, validated_data)
