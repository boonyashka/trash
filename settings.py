import sys

DEBUG=True
IGNORABLE_404_URLS=[r'^favicon\.ico$']
ROOT_URLCONF=sys.modules[__name__]
TEMPLATES=[{'BACKEND': 'django.template.backends.django.DjangoTemplates', 'DIRS': ['.']}]
SECRET_KEY='A-random-secret-key!'
ROOT_URLCONF='minimal'   