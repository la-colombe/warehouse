select 
md5('lch' || invoiceno || invoicehistoryheaderseqno) as unique_invoice_id,
customerno as customer_code, 
invoiceno as invoice_number, 
invoicetype as invoice_type,
invoiceno || '-' || invoicetype as invoice,
case postingdate 
  when '1753-01-01' then null
  else postingdate
end as posting_date,
balance
from dbo.ar_openinvoice

union

select 
md5('lct' || invoiceno || invoicehistoryheaderseqno) as unique_invoice_id,
customerno as customer_code, 
invoiceno as invoice_number, 
invoicetype as invoice_type,
invoiceno || '-' || invoicetype as invoice,
case postingdate 
  when '1753-01-01' then null
  else postingdate
end as posting_date,
balance
from lct.ar_openinvoice

union 

select 
md5('lct' || invoiceno || invoicehistoryheaderseqno) as unique_invoice_id,
customerno as customer_code, 
invoiceno as invoice_number, 
invoicetype as invoice_type,
invoiceno || '-' || invoicetype as invoice,
case postingdate 
  when '1753-01-01' then null
  else postingdate
end as posting_date,
balance
from lcg.ar_openinvoice