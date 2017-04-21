select 
purchase_order_id,
purchase_order_date,
invoice_date,
extension,
quantity_ordered,
quantity_invoiced,
quantity_received,
sku,
vendor_id,
comment
from {{ref('purchase_order_detail')}} h