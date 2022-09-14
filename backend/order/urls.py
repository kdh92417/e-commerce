from django.urls import path, include
from rest_framework import routers

from order.views import OrderView

router = routers.DefaultRouter()
router.register("", OrderView)

urlpatterns = [
    path("", include(router.urls)),
]
