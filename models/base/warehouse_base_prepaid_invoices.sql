select 
customer_code,
invoice_number,
invoice_type,
invoice_date,
posting_date,
balance,
comment,
check_number
from {{ref('ar_open_invoices')}} oi 
where oi.invoice_type = 'PP'