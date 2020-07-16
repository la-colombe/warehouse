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
  il.discount_percentage,
  il.extension,
  il.header_number,
  il.line_number,
  il.total_weight,
  il.full_account_number,
  il.gl_account_name,
  i.unique_sales_order_id,
  i.sales_order_number,
  i.invoice_date,
  i.transaction_date, 
  i.customer_code,
  i.bill_to_name,
  i.invoice_type,
  i.invoice,
  i.discount_rate as invoice_discount_rate,
  i.discount_amount as invoice_discount_amount,  
  i.total_extension as total_invoice_extension,
  i.ship_date,
  i.ship_to_code,
  i.ship_to_name,
  i.ship_to_address1,
  i.ship_to_address2,
  i.ship_to_address3,
  i.ship_to_city,
  i.ship_to_state,
  i.ship_to_zip,
  i.ship_to_country,
  i.invoice_sales_tax,
  i.invoice_freight,
  i.comment,
  i.created_at,
  i.created_by,
  i.updated_at,
  i.updated_by,
  i.account_invoice_number,
  i.warehouse_name,
  i.account_paid_coffee_invoice_number

from {{ref('ar_invoice_history_detail')}} il
join {{ref('warehouse_invoices')}} i on i.unique_invoice_id = il.unique_invoice_id
