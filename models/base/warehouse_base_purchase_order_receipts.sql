select 
receipt_type,
receipt_number,
purchase_order_line_number,
purchase_order_number,
warehouse_name as warehouse,
sku,
recieved_at, 
quantity,
created_at,
created_by,
updated_at,
updated_by
from {{ref('purchase_order_history_receipts')}} po
left join {{ref('im_warehouse')}} w on w.warehouse_code = po.warehouse_code