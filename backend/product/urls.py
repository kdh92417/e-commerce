from django.urls import path, include
from rest_framework import routers

from product.views import ProductView

app_name = "products"

router = routers.DefaultRouter()
router.register("", ProductView, basename="product")

urlpatterns = [
    path("", include(router.urls)),
]
