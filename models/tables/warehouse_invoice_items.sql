SELECT 

  ii.invoice_number,
  ii.sku,
  ii.item_name,
  ii.item_type,
  ii.quantity,
  ii.quantity_ordered,
  ii.quantity_backordered,
  ii.unit_price,
  ii.extension,
  ii.header_number,
  ii.line_number,
  ii.warehouse_code,
  ii.transaction_date, 
  ii.customer_code,
  ii.bill_to_name,
  ii.invoice_type,
  ii.invoice,
  ii.ship_to_name,
  ii.ship_to_address1,
  ii.ship_to_address2,
  ii.ship_to_address3,
  ii.ship_to_city,
  ii.ship_to_state,
  ii.ship_to_zip,
  ii.ship_to_country,
  ii.invoice_sales_tax,
  ii.invoice_freight,
  ii.comment,
  /*
  ii.account_name,
  ii.account_division,
  ii.company_code,
  ii.account_min_vol,
  ii.account_tier,
  ii.sales_rep_name,
  ii.primary_account_manager_name,
  ii.secondary_account_manager_name,
  */
  ii.total_weight,
  
  ii.account_invoice_number,

  i.account_paid_coffee_invoice_number
  --i.account_second_paid_coffee_invoice_date

  from {{ref('warehouse_base_invoice_items')}} ii
  join {{ref('warehouse_invoices')}} i on i.invoice_number = ii.invoice_number and i.header_number = ii.header_number