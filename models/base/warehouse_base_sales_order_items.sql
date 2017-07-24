select
sales_order_number,
line_number,
sku,
item_name,
warehouse,
original_quantity,
revised_quantity,
shipped_quantity,
backordered_quantity
from {{ref('sales_order_history_detail')}}