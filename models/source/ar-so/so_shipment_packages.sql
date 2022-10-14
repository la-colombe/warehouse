select 

  invoiceno as invoice_number, 
  packageno as package_number, 
  trackingid as tracking_id, 
  comment, 
  shipvia as shipping_method, 
  freightamt as freight_amount, 
  weight

from {{source('sage','so_dailyshipmentpackage')}}
