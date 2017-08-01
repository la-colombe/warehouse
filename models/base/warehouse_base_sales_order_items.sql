select
sales_order_number,
line_number,
sku,
item_name,
warehouse_name as warehouse,
original_quantity,
revised_quantity,
shipped_quantity,
backordered_quantity
from {{ref('sales_order_history_detail')}} so
left join {{ref('im_warehouse')}} w on w.warehouse_code = so.warehouse_code