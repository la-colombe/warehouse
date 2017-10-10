SELECT 
  il.unique_invoice_id,
  il.unique_invoice_item_id,
  il.invoice_number,
  il.sku,
  il.item_name,
  il.item_type,
  il.quantity,
  il.quantity_ordered,
  il.quantity_backordered,
  il.unit_price,
  il.extension,
  il.header_number,
  il.line_number,
  i.unique_sales_order_id,
  i.sales_order_number,
  i.invoice_date,
  i.transaction_date, 
  i.customer_code,
  i.bill_to_name,
  i.invoice_type,
  i.invoice,
  i.ship_date,
  i.ship_to_name,
  i.ship_to_address1,
  i.ship_to_address2,
  i.ship_to_address3,
  i.ship_to_city,
  i.ship_to_state,
  i.ship_to_zip,
  i.ship_to_country,
  i.sales_tax as invoice_sales_tax,
  i.freight as invoice_freight,
  i.comment,
  
  i.account_invoice_number,
  GREATEST(i.updated_at, p.updated_at) as updated_at,
 il.quantity * p.weight as total_weight,
 w.warehouse_name

from {{ref('invoice_history_detail')}} il
join {{ref('warehouse_base_invoices')}} i on i.unique_invoice_id = il.unique_invoice_id
left join {{ref('warehouse_base_products')}} p on p.sku = il.sku
left join {{ref('im_warehouse')}} w on w.warehouse_code = il.warehouse_code