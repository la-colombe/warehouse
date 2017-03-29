select sku,
recieved_at, 
quantity
from {{ref('purchase_order_receipts')}}