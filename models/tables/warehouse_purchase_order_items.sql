select 
purchase_order_id,
purchase_order_date,
invoice_date,
extension,
quantity_ordered,
quantity_invoiced,
sku,
vendor_id
from {{ref('warehouse_base_purchase_order_items')}} h