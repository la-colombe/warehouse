select 
purchase_order_id,
purchase_order_date,
invoice_date,
extension,
quantity_ordered,
quantity_invoiced,
sku,
vendor_id
from {{ref('purchase_order_detail')}} h