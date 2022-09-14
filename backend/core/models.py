from django.db import models
from django.utils import timezone


class TimeStampModel(models.Model):
    """타임 추상화 모델"""

    create_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        abstract = True


class ImageModel(models.Model):
    """이미지 추상화 모델"""

    origin_name = models.CharField(max_length=300, null=False)
    file_size = models.IntegerField(default=0, null=False, blank=False)

    class Meta:
        abstract = True
