select 
purchase_order_number,
purchase_order_date,
line_number,
invoice_date,
extension,
quantity_ordered,
quantity_invoiced,
quantity_received,
sku,
vendor_id,
comment
from {{ref('warehouse_base_purchase_order_items')}} h