select 
sales_order_number, 
line_number,
order_date, 
order_type,
ship_date,
customer_code,
w.warehouse_name as warehouse,
invoice_number,
sku,
item_name,
quantity_ordered,
extension,
weight
from {{ref('so_sales_orders')}} so
left join {{ref('im_warehouse')}} w on w.warehouse_code = so.warehouse_code