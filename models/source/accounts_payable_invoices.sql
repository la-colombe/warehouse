select 
i.apdivisionno as division,
invoiceno as invoice_number, 
case invoicedate 
	when '1753-01-01' then null
	else invoicedate
end as invoice_date, 
i.vendorno as vendor_number, 
invoiceamt as invoice_amount, 
checkno as check_number, 
checktype as check_type, 
case checkdate 
  when '1753-01-01' then null
  else checkdate
end as check_date, 
balance,
i.comment,
v.vendorname as vendor_name
from dbo.ap_openinvoice i
left join dbo.ap_vendor v on v.apdivisionno = i.apdivisionno and v.vendorno = i.vendorno