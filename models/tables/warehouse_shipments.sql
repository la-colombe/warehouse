select
  sales_order_number,
  invoice_number,
  po_number,
  delivery_charge,
  delivery_description,
  customer_code,
  shipper,
  total_weight,
  processed_at,
  tracking_link,
  number_of_packages
from {{ref('starship_shipments')}}
