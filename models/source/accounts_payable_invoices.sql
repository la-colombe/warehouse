select 
invoiceno as invoice_number, 
invoicedate as invoice_date, 
vendorno as vendor_number, 
invoiceamt as invoice_amount, 
checkno as check_number, 
checktype as check_type, 
checkdate as check_date, 
balance as balance
from dbo.ap_openinvoice 