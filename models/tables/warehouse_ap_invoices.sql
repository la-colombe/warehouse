select 
md5(i.invoice_number || i.header_sequence_number) as unique_key,
i.division,
i.invoice_number,
i.header_sequence_number,
i.invoice_date, 
i.purchase_order_number,
i.vendor_number, 
i.invoice_amount,
i.shipping_amount,
i.invoice_comment,
i.terms_code,
v.vendor_name,
i.days_before_due,
nvl(ic.amount_paid, 0) as amount_paid,
nvl(i.invoice_amount,0) - nvl(ic.amount_paid,0) as balance,
i.created_at,
i.created_by,
i.updated_at,
i.updated_by
from {{ref('ap_invoice_history_header')}} i
left join {{ref('ap_vendor')}} v on v.division = i.division and v.vendor_number = i.vendor_number
left join {{ref('warehouse_ap_invoice_checks')}} ic on ic.invoice_number = i.invoice_number and ic.invoice_sequence_number = i.header_sequence_number