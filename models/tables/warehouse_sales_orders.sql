select
so.unique_sales_order_id,
so.sales_order_number,
so.order_date,
so.order_status,
so.customer_code,
so.account_order_number,
datediff(day, pso.order_date, so.order_date) as days_since_previous_order


from {{ref('warehouse_base_sales_orders')}} so
left join {{ref('warehouse_base_sales_orders')}} pso on pso.customer_code = so.customer_code and pso.account_order_number = so.account_order_number - 1