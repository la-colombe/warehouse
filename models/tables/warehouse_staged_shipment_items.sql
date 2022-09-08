select 

  invoice_number,
  line_key,
  sku,
  item_name,
  item_type,
  warehouse_code,
  promise_date,
  quantity_ordered,
  quantity_shipped,
  quantity_backordered

from {{ref('so_staged_shipment_items')}}