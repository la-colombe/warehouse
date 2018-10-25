select
md5(il.invoice_number || il.header_sequence_number || il.line_number) as unique_key,
md5(il.invoice_number || il.header_sequence_number) as invoice_unique_key,
il.invoice_number,
il.header_sequence_number,
il.line_number,
il.sku,
il.quantity_ordered,
il.quantity_received,
il.quantity_invoiced,
il.extension,
il.item_name,
il.warehouse_name,
il.full_account_number,
i.days_before_due,
i.vendor_name,
i.vendor_number,
i.invoice_comment,
i.invoice_date,
i.created_at,
i.created_by,
i.updated_at,
i.updated_by
from {{ref('ap_invoice_history_detail')}} il
join {{ref('warehouse_ap_invoices')}} i on i.unique_key = md5(il.invoice_number || il.header_sequence_number)