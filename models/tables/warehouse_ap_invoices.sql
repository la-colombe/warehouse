select 
division,
invoice_number, 
invoice_date, 
vendor_number, 
invoice_amount, 
check_number, 
check_type,
check_date, 
balance
from {{ref('warehouse_base_ap_invoices')}} 