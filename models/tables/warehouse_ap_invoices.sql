select 
i.division,
i.invoice_number, 
i.header_sequence_number,
i.invoice_date, 
i.vendor_number, 
i.invoice_amount, 
i.invoice_comment,
i.vendor_name,

nvl(ic.amount_paid, 0) as amount_paid,
i.invoice_amount - nvl(ic.amount_paid,0) as balance,
c.check_number, 
c.check_type,
c.check_date, 
c.bank_code,
c.check_comment
from {{ref('warehouse_base_ap_invoices')}} i
left join {{ref('warehouse_ap_invoice_checks')}} ic on ic.invoice_number = i.invoice_number and ic.invoice_sequence_number = i.header_sequence_number
left join {{ref('warehouse_base_ap_checks')}} c on c.invoice_number = i.invoice_number and c.invoice_sequence_number = i.header_sequence_number and row_number = 1
