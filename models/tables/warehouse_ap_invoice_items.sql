select
il.invoice_number,
il.header_sequence_number,
il.sku,
il.quantity_ordered,
il.quantity_received,
il.quantity_invoiced,
il.extension,
il.invoice_comment,
il.invoice_date,
il.item_name,
il.warehouse_name

from {{ref('warehouse_base_ap_invoice_items')}} il