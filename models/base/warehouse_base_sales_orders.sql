select
unique_sales_order_id,
sales_order_number,
order_date,
order_status,
customer_code,
created_at,
created_by,
updated_at,
updated_by,
rank() over (partition by customer_code order by order_date, sales_order_number ASC) AS account_order_number

from {{ref('sales_order_history_header')}}