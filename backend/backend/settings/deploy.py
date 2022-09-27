from .base import *

ALLOWED_HOSTS = ["*"]
DEBUG = False

"""
Docker Container DB Information
"""
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": os.environ.get("DB_NAME"),
        "PASSWORD": os.environ.get("DB_ROOT_PASSWORD"),
        "HOST": os.environ.get("DB_HOST"),
        "PORT": os.environ.get("DB_PORT"),
    }
}

print("deploy: ", DATABASES)
