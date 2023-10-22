from django.test import TestCase
from .models import Client, Domain

# Create your tests here.

tenant = Client(schema_name='public', name='Public')
tenant.save()

domain = Domain(domain='localhost', tenant=tenant, is_primary=True)
domain.save()


# initial
tenant = Client(schema_name='fatins_co', name='FatinsCo')
tenant.save()

domain = Domain(domain='fatin.localhost', tenant_id=2, is_primary=True)
domain.save()