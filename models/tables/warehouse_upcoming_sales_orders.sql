select 
sales_order_number, 
line_number,
order_date, 
order_type,
ship_date,
customer_code,
warehouse,
invoice_number,
sku,
item_name,
quantity_ordered,
extension,
weight
from {{ref('warehouse_base_upcoming_sales_orders')}} so
