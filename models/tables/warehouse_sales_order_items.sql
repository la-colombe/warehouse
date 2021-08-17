select
sales_order_number,
line_number,
sku,
item_name,
promise_date,
warehouse,
original_quantity,
revised_quantity,
shipped_quantity,
backordered_quantity
from {{ref('so_sales_order_history_detail')}}