select 
purchase_order_number,
purchase_order_date,
line_number,
invoice_date,
completion_date,
required_date,
last_receipt_date,
extension,
quantity_ordered,
quantity_invoiced,
quantity_received,
original_unit_cost,
invoiced_unit_cost,
item_name,
sku,
division,
vendor_id,
comment,
created_at,
created_by,
updated_at,
updated_by
from {{ref('po_purchase_order_detail')}}