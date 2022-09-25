from rest_framework import permissions

# TODO: permission 고도화
# REF: https://github.com/HyeonWooJo/ecommerce/blob/feature/payment/backend/orders/permissions.py


class IsAdminOrReadOnly(permissions.BasePermission):
    """
    일반유저 : Only Read
    관리자 : CRUD
    """

    def has_permission(self, request, view):
        # Get method 는 허용
        if request.method in permissions.SAFE_METHODS:
            return True

        return request.user.is_staff

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True

        return request.user.is_staff


class IsAdminOrSameUser(permissions.BasePermission):
    """
    관리자 : CRUD
    일반유저 : 본인이 등록한 주문에한해서만 CRUD
    """

    message = "일반유저는 본인의 주문에대해서만 수정/삭제/조회 할 수 있습니다."

    def has_object_permission(self, request, view, obj):
        if request.user.is_staff:
            return True

        if view.action in ["retrieve", "destroy", "update", "partial_update"]:
            return obj.user.id == request.user.id
        return True
