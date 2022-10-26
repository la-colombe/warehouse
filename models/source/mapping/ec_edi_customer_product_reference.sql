select
  crossreferencelist as edi_customer_name,
  itemcode as sku,
  crossreferencecode as external_product_id
from {{source('sage','ec_itemcrossreference')}}