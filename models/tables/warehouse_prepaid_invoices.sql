select 
customer_code,
invoice_number,
invoice_type,
invoice_date,
posting_date,
balance,
comment,
check_number,
created_at,
created_by,
updated_at,
updated_by
from {{ref('warehouse_base_prepaid_invoices')}} oi 