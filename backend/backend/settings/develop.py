from .base import *

ALLOWED_HOSTS = ["*"]

"""
Docker Container DB Information
"""
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "ecommerce",
        "USER": "root",
        "PASSWORD": "admin",
        "HOST": "mysql",
        "PORT": 3306,
    }
}

print("develop: ", DATABASES)

DEBUG = True
