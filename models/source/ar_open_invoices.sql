select 
customerno as customer_code, 
invoiceno as invoice_number, 
invoicehistoryheaderseqno as header_number,
invoicetype as invoice_type,
invoiceno || '-' || invoicetype as invoice,
invoicedate as invoice_date,
case postingdate 
  when '1753-01-01' then null
  else postingdate
end as posting_date,
balance,
comment,
checkno as check_number
from dbo.ar_openinvoice