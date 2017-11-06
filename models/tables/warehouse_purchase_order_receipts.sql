select 
receipt_type,
receipt_number,
purchase_order_line_number,
purchase_order_number,
warehouse,
sku,
recieved_at, 
quantity,
created_at,
created_by,
updated_at,
updated_by
from {{ref('warehouse_base_purchase_order_receipts')}}