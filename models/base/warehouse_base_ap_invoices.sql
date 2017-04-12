select 
invoice_number, 
invoice_date, 
vendor_number, 
invoice_amount, 
check_number, 
check_date, 
balance
from {{ref('accounts_payable_invoices')}} 