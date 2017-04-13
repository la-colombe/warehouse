select 
apdivisionno as division,
invoiceno as invoice_number, 
case invoicedate 
	when '1753-01-01' then null
	else invoicedate
end as invoice_date, 
vendorno as vendor_number, 
invoiceamt as invoice_amount, 
checkno as check_number, 
checktype as check_type, 
case checkdate 
  when '1753-01-01' then null
  else checkdate
end as check_date, 
balance as balance
from dbo.ap_openinvoice 