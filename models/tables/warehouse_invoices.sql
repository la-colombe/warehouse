SELECT 
  
  i.unique_invoice_id,
  i.transaction_date, 
  i.customer_code,
  i.bill_to_name,
  i.header_number,
  i.invoice_number,
  i.unique_sales_order_id,
  i.sales_order_number,
  i.customer_po_number,
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

  i.posting_date,
  i.balance,
  
  i.account_invoice_number,

  ia.total_quantity,
  ia.total_quantity_ordered,
  ia.total_quantity_backordered,
  ia.total_extension,
  ia.total_weight,
  pci.account_paid_coffee_invoice_number,
  i.created_at,
  i.created_by,
  i.updated_at,
  i.updated_by,


  datediff(second, ppci.ship_date, i.ship_date) as time_since_previous_paid_coffee_invoice

  from {{ref('warehouse_base_invoices')}} i
  left join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
  left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.unique_invoice_id = i.unique_invoice_id
  left join {{ref('warehouse_paid_coffee_invoice_ranking')}} ppci on ppci.customer_code = i.customer_code and ppci.account_paid_coffee_invoice_number = pci.account_paid_coffee_invoice_number - 1


