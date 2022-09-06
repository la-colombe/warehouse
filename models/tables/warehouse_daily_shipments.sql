select 
  
  invoice_number,
  ar_division_number,
  customer_code,
  sales_order_number,
  ship_date,
  shipping_method,
  shipper_id,
  freight_amount,
  invoice_total,
  date_updated,
  time_updated,
  user_updated_key

from {{ref('so_daily_shipments')}}
