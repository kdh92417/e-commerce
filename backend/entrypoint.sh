python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --no-input

gunicorn backend.wsgi:application --bind 0.0.0.0:8000 --reload --log-level "debug"
