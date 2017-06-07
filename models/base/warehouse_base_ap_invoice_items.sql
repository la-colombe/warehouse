select
il.invoice_number,
il.header_sequence_number,
il.line_number,
il.sku,
il.quantity_ordered,
il.quantity_received,
il.quantity_invoiced,
il.extension,

i.invoice_comment,
i.invoice_date,
p.name as item_name,
w.warehouse_name,
a.full_account_number
from {{ref('ap_invoice_history_detail')}} il
join {{ref('warehouse_base_ap_invoices')}} i on i.invoice_number = il.invoice_number and i.header_sequence_number = il.header_sequence_number
left join {{ref('warehouse_base_products')}} p on p.sku = il.sku
left join {{ref('im_warehouse')}} w on w.warehouse_code = il.warehouse_code
left join {{ref('gl_account')}} a on a.id = il.gl_account_key