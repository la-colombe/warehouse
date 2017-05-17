select 
division,
invoice_number, 
invoice_date, 
vendor_number, 
invoice_amount, 
check_number, 
check_date, 
check_type,
balance,
comment,
vendor_name
from {{ref('accounts_payable_invoices')}} 