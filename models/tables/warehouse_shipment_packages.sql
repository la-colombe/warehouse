select 

  invoice_number, 
  package_number, 
  tracking_id, 
  comment, 
  shipping_method, 
  freight_amount, 
  weight

from {{ref('so_shipment_packages')}}
