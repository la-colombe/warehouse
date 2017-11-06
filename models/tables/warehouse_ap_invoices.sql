select 
i.division,
i.invoice_number, 
i.header_sequence_number,
i.invoice_date, 
i.vendor_number, 
ia.extension as invoice_amount, 
i.invoice_comment,
i.vendor_name,

nvl(ic.amount_paid, 0) as amount_paid,
nvl(ia.extension,0) - nvl(ic.amount_paid,0) as balance,
c.check_number, 
c.check_type,
c.check_date, 
c.bank_code,
c.check_comment,
i.created_at,
i.created_by,
i.updated_at,
i.updated_by
from {{ref('warehouse_base_ap_invoices')}} i
left join {{ref('warehouse_ap_invoice_checks')}} ic on ic.invoice_number = i.invoice_number and ic.invoice_sequence_number = i.header_sequence_number
left join {{ref('warehouse_base_ap_checks')}} c on c.invoice_number = i.invoice_number and c.vendor_number = i.vendor_number and c.division = i.division and row_number = 1
left join {{ref('warehouse_ap_invoice_aggregates')}} ia on ia.invoice_number = i.invoice_number and ia.header_sequence_number = i.header_sequence_number