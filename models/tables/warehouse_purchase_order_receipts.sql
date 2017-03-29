select sku,
recieved_at, 
quantity
from {{ref('warehouse_base_purchase_order_receipts')}}