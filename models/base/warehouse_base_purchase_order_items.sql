select 
purchase_order_number,
purchase_order_date,
line_number,
invoice_date,
completion_date,
last_receipt_date,
extension,
quantity_ordered,
quantity_invoiced,
quantity_received,
sku,
vendor_id,
comment
from {{ref('purchase_order_detail')}} h