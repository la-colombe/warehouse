select 
i.division,
i.invoice_number, 
i.header_sequence_number,
i.invoice_date, 
i.vendor_number, 
ia.extension as invoice_amount, 
i.invoice_comment,
i.vendor_name,
i.purchase_order_number,
i.days_before_due,
nvl(ic.amount_paid, 0) as amount_paid,
nvl(ia.extension,0) - nvl(ic.amount_paid,0) as balance,
i.created_at,
i.created_by,
i.updated_at,
i.updated_by
from {{ref('warehouse_base_ap_invoices')}} i
left join {{ref('warehouse_ap_invoice_checks')}} ic on ic.invoice_number = i.invoice_number and ic.invoice_sequence_number = i.header_sequence_number
left join {{ref('warehouse_ap_invoice_aggregates')}} ia on ia.invoice_number = i.invoice_number and ia.header_sequence_number = i.header_sequence_number