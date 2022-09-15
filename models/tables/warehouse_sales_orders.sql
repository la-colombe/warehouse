select

  so.unique_sales_order_id,
  so.sales_order_number,
  so.order_date,
  so.requested_delivery_date,
  so.last_invoice_date,
  so.order_status,
  so.customer_code,
  so.web_order_number,
  so.account_order_number,
  so.bill_to_name,
  so.bill_to_address,
  so.bill_to_city,
  so.bill_to_state,
  so.bill_to_zip,
  so.bill_to_country,
  so.ship_to_code,
  so.ship_to_name,
  so.ship_to_address,
  so.ship_to_city,
  so.ship_to_state,
  so.ship_to_zip,
  so.ship_to_country,
  so.ship_via,
  so.customer_purchase_order_number,
  so.email_address,
  so.order_subtotal,
  so.sales_tax,
  so.freight,
  datediff(day, pso.order_date, so.order_date) as days_since_previous_order,
  so.created_at,
  so.created_by,
  so.updated_at,
  so.updated_by,
  so.warehouse_code

from {{ref('so_sales_order_history_header')}} so
left join {{ref('so_sales_order_history_header')}} pso on pso.customer_code = so.customer_code and pso.account_order_number = so.account_order_number - 1