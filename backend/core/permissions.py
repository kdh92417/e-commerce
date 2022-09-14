from rest_framework import permissions


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
