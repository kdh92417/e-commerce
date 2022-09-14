from django.urls import path, include
from rest_framework import routers

from payment.views import PaymentView

router = routers.DefaultRouter()
router.register("", PaymentView)

urlpatterns = [
    path("", include(router.urls)),
]
