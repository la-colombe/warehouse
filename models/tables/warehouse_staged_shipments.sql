select

  invoice_number,
  invoice_date,
  invoice_type,
  sales_order_number,
  order_type,
  order_status,
  order_date,
  customer_po_number,
  ar_division_number,
  customer_code,
  ship_to_code,
  ship_date,
  ship_via,
  warehouse_code,
  shipper_id,
  ship_status,
  created_at,
  updated_at,
  user_created_key,
  user_updated_key

from {{ref('so_staged_shipments')}}