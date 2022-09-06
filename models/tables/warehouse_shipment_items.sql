select
  
  invoice_number, 
  package_number, 
  sku, 
  item_type, 
  item_name, 
  alias_item_number, 
  quantity

from {{ref('so_shipment_items')}}
