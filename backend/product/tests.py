import io

from PIL import Image
from django.core.files import File

from rest_framework.reverse import reverse
from rest_framework import status
from rest_framework.test import APITestCase, APIRequestFactory

from product.models import (
    Product,
    ProductImage,
    Tag,
    Category,
    ProductOption,
    ProductTag,
)


def generate_photo_file():
    file = io.BytesIO()
    image = Image.new("RGBA", size=(100, 100), color=(155, 0, 0))
    image.save(file, "png")
    file.name = "test_photo.png"
    file.seek(0)

    return File(file)


class ProductViewTest(APITestCase):

    def setUp(self) -> None:
        self.factory = APIRequestFactory()
        Tag.objects.bulk_create(
            [Tag(name="BEST"), Tag(name="SOLD_OUT"), Tag(name="MD")]
        )

        Category.objects.bulk_create([Category(name="store"), Category(name="play")])

        Product.objects.bulk_create(
            [
                Product(
                    name="구기자",
                    category=Category.objects.get(id=1),
                    description="설명이 필요 없는 구기자",
                ),
                Product(
                    name="사과",
                    category=Category.objects.get(id=1),
                    description="설명이 필요 없는 사과",
                )
            ]
        )
        product_1 = Product.objects.get(id=1)
        image = generate_photo_file()

        ProductImage.objects.bulk_create(
            [
                ProductImage(
                    product=product_1,
                    is_thumbnail=True,
                    image=image,
                    origin_name=image.name,
                    file_size=image.size,
                ),
                ProductImage(
                    product=product_1,
                    is_thumbnail=False,
                    image=image,
                    origin_name=image.name,
                    file_size=image.size,
                ),
            ]
        )

        ProductTag.objects.bulk_create(
            [
                ProductTag(product=product_1, tag=Tag.objects.get(id=1)),
                ProductTag(product=product_1, tag=Tag.objects.get(id=2)),
            ]
        )

        ProductOption.objects.bulk_create(
            [
                ProductOption(product=product_1, name="소", extra_option_price=0),
                ProductOption(product=product_1, name="중", extra_option_price=5000),
                ProductOption(product=product_1, name="대", extra_option_price=10000),
            ]
        )

    def tearDown(self):
        ProductOption.objects.all().delete()
        ProductTag.objects.all().delete()
        Product.objects.all().delete()
        Category.objects.all().delete()
        Tag.objects.all().delete()
        ProductImage.objects.all().delete()

    def test_get_product_list(self):
        response = self.client.get(reverse("products:product-list"))

        self.assertEqual(response.status_code, status.HTTP_200_OK)
