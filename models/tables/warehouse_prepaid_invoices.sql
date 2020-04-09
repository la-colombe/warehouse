select 
customer_code,
invoice_number,
invoice_type,
invoice_date,
posting_date,
balance,
amount,
comment,
check_number,
created_at,
created_by,
updated_at,
updated_by
from {{ref('ar_open_invoices')}} oi 
where oi.invoice_type = 'PP'