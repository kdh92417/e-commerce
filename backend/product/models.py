from django.contrib.auth import get_user_model
from django.db import models

from core.models import TimeStampModel, ImageModel


class Category(models.Model):
    """상품 카테고리 모델"""

    name = models.CharField(max_length=45)

    def __str__(self):
        return self.name


class Product(TimeStampModel):
    """상품 모델"""

    name = models.CharField(max_length=100)
    price = models.IntegerField(default=0)
    stock = models.IntegerField(default=1)
    description = models.TextField(null=True)
    like_count = models.IntegerField(default=0)
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)

    class Meta:
        db_table = "products"

    def __str__(self):
        return self.name


class ProductReply(TimeStampModel):
    """상품 리뷰 모델"""

    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, null=False, blank=False
    )
    user = models.ForeignKey(
        get_user_model(), on_delete=models.CASCADE, null=False, blank=False
    )
    content = models.TextField()
    ref_reply = models.IntegerField(default=None, null=True)
    type = models.CharField(max_length=45)
    order = models.IntegerField(default=1, null=False, blank=False)
    depth = models.IntegerField(default=1, null=False, blank=False)

    class Meta:
        db_table = "product_replies"


class ProductImage(ImageModel, TimeStampModel):
    """상품 이미지 모델"""

    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, null=False, blank=False
    )
    is_thumbnail = models.BooleanField(default=False)

    class Meta:
        db_table = "product_images"

    def __str__(self):
        return self.origin_name


class ProductReplyImage(ImageModel, TimeStampModel):
    """상품 리뷰 이미지 모델"""

    product_reply = models.ForeignKey(
        ProductReply, on_delete=models.CASCADE, null=False, blank=False
    )

    class Meta:
        db_table = "product_reply_images"

    def __str__(self):
        return self.origin_name


class Like(models.Model):
    """상품 좋아요 모델"""

    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, null=False, blank=False
    )
    user = models.ForeignKey(
        get_user_model(), on_delete=models.CASCADE, null=False, blank=False
    )

    class Meta:
        db_table = "likes"
