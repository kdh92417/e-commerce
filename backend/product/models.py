from django.contrib.auth import get_user_model
from django.db import models

from core.image import image_upload_path
from core.models import TimeStampModel, ImageModel


class Tag(models.Model):
    """
    태그 모델
    """

    name = models.CharField(max_length=45)

    class Meta:
        db_table = "tags"

    def __str__(self):
        return self.name


class Category(models.Model):
    """
    카테고리 모델
    """

    name = models.CharField(max_length=45)

    class Meta:
        db_table = "categories"

    def __str__(self):
        return self.name


class Product(TimeStampModel):
    """상품 모델"""

    name = models.CharField(max_length=100)
    price = models.IntegerField(default=0)
    discounted_price = models.IntegerField(blank=True, null=True)
    stock = models.IntegerField(default=1)
    description = models.TextField(null=True)
    like_count = models.IntegerField(default=0)
    category = models.ForeignKey(
        Category, on_delete=models.CASCADE, null=False, blank=False
    )

    class Meta:
        db_table = "products"

    def __str__(self):
        return self.name


class ProductOption(models.Model):
    """상품옵션 모델"""

    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        null=False,
        blank=False,
        related_name="option",
    )
    name = models.CharField(max_length=100)
    extra_option_price = models.IntegerField()
    create_at = models.DateTimeField(
        auto_now_add=True, null=True, blank=True
    )  # TODO: default value error
    update_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    class Meta:
        db_table = "product_options"

    def __str__(self):
        return self.name


class ProductTag(models.Model):
    """상품태그 모델"""

    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, null=False, blank=False
    )
    tag = models.ForeignKey(Tag, on_delete=models.CASCADE, null=False, blank=False)

    class Meta:
        db_table = "product_tags"


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
        Product, on_delete=models.CASCADE, null=False, blank=False, related_name="image"
    )
    is_thumbnail = models.BooleanField(default=False)
    image = models.ImageField(upload_to=image_upload_path)

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
