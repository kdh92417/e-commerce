from django.urls import path, include
from rest_framework import routers

from order.views import OrderView

router = routers.DefaultRouter()
router.register("", OrderView, basename="order")

app_name = "orders"

urlpatterns = [
    path("", include(router.urls)),
]
