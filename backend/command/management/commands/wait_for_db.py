from django.core.management.base import BaseCommand
from django.db import connections
from django.db.utils import OperationalError
import time


class Command(BaseCommand):
    """Django command to pause execution until database is available"""

    def handle(self, *args, **kwargs):
        self.stdout.write("waiting for db ...")
        # time.sleep(10)
        db_up = False
        while db_up is False:
            try:
                # get the database with keyword 'default' from settings.py
                self.check(databases=["default"])
                db_up = True
            except OperationalError:
                self.stdout.write("Database unavailable, waiting 3 second ...")
                time.sleep(3)

        self.stdout.write(self.style.SUCCESS("db available"))
