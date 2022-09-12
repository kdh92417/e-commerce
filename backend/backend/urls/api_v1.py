from django.urls import path, include

urlpatterns = [
    path('users/', include('user.urls')),
    path("product/", include("product.urls")),
]