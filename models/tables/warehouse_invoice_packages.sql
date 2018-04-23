select
  invoice_number,
  package_number,
  tracking_id,
  shipping_service
from {{ref('so_invoice_packages')}}