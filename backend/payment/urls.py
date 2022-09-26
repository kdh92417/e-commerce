from django.urls import path, include
from rest_framework import routers

from payment.views import PaymentView

app_name = "payments"

router = routers.DefaultRouter()
router.register("", PaymentView, basename="payment")

urlpatterns = [
    path("", include(router.urls)),
]
