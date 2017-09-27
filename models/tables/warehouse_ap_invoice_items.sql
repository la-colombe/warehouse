select
md5(invoice_number || header_sequence_number || line_number) as unique_key,
md5(invoice_number || header_sequence_number) as invoice_unique_key,
il.invoice_number,
il.header_sequence_number,
il.line_number,
il.sku,
il.quantity_ordered,
il.quantity_received,
il.quantity_invoiced,
il.extension,
il.invoice_comment,
il.invoice_date,
il.item_name,
il.warehouse_name,
il.full_account_number
from {{ref('warehouse_base_ap_invoice_items')}} il