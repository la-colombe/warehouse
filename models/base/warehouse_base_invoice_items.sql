SELECT 

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
  il.warehouse_code,

  i.transaction_date, 
  i.customer_code,
  i.bill_to_name,
  i.invoice_type,
  i.invoice,
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

  i.account_name,
  i.account_division,
  i.company_code,
  i.account_min_vol,
  i.account_tier,
  i.sales_rep_name,
  i.primary_account_manager_name,
  i.secondary_account_manager_name,

  i.account_invoice_number,

  il.quantity * p.ship_weight as total_weight

from {{ref('invoice_history_detail')}} il
join {{ref('warehouse_base_invoices')}} i on i.header_number = il.header_number and i.invoice_number = il.invoice_number
left join {{ref('slx_product')}} p on p.item_code = il.sku