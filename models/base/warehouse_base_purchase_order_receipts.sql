select 
receipt_type,
receipt_number,
line_number,
purchase_order_number,
warehouse,
sku,
recieved_at, 
quantity
from {{ref('purchase_order_history_receipts')}}
