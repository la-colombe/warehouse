select
  invoiceno as invoice_number,
  packageno as package_number,
  trackingid as tracking_id,
  shipvia as shipping_service
from {{source('sage','so_dailyshipmentpackage')}}