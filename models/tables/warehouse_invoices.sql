SELECT 
  
  i.unique_invoice_id,
  i.transaction_date, 
  i.customer_code,
  i.bill_to_name,
  i.header_number,
  i.invoice_number,
  i.unique_sales_order_id,
  i.sales_order_number,
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
  
  i.account_name,
  i.account_division,
  i.company_code,
  i.account_min_vol,
  i.account_tier,
  i.sales_rep_name,
  i.primary_account_manager_name,
  i.secondary_account_manager_name,

  i.account_invoice_number,

  a.total_invoices as account_total_invoices,
  a.total_paid_coffee_invoices as account_total_paid_coffee_invoices,
  a.second_paid_coffee_invoice_date as account_second_paid_coffee_invoice_date,
  a.total_quantity as account_total_quantity,
  a.total_extension as account_total_extension,
  a.total_weight as account_total_weight,

  ia.total_quantity,
  ia.total_quantity_ordered,
  ia.total_quantity_backordered,
  ia.total_extension,
  ia.total_weight,
  pci.account_paid_coffee_invoice_number,

  datediff(second, ppci.transaction_date, i.transaction_date) as time_since_previous_paid_coffee_invoice

  from {{ref('warehouse_base_invoices')}} i
  left join {{ref('warehouse_accounts')}} a on a.customer_code = i.customer_code
  left join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
  left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.unique_invoice_id = i.unique_invoice_id
  left join {{ref('warehouse_paid_coffee_invoice_ranking')}} ppci on ppci.customer_code = i.customer_code and ppci.account_paid_coffee_invoice_number = pci.account_paid_coffee_invoice_number - 1


