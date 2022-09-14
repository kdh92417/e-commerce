from django.urls import path, include

urlpatterns = [
    path("users/", include("user.urls")),
    path("products/", include("product.urls")),
    path("orders/", include("order.urls")),
    path("payments/", include("payment.urls")),
]
