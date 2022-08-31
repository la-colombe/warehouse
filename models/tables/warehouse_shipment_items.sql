select
  
  si.invoice_number,
  si.package_number,
  si.sku,
  si.item_name,
  si.quantity,

  sp.tracking_id,

  ds.customer_code,
  ds.sales_order_number,
  ds.ship_date,
  ds.shipping_method,
  ds.shipper_id,
  ds.invoice_total

from {{ref('so_shipment_items')}} si
join {{ref('so_shipment_packages')}} sp on si.invoice_number = sp.invoice_number and si.package_number = sp.package_number
join {{ref('so_daily_shipments')}} ds on si.invoice_number = ds.invoice_number 
