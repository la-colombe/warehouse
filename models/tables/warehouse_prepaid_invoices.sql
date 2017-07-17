select 
customer_code,
invoice_number,
invoice_type,
invoice_date,
posting_date,
balance,
comment,
check_number
from {{ref('warehouse_base_prepaid_invoices')}} oi 