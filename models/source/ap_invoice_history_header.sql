select
i.apdivisionno as division,
headerseqno as header_sequence_number,
invoiceno as invoice_number, 
case invoicedate 
	when '1753-01-01' then null
	else invoicedate
end as invoice_date, 
i.vendorno as vendor_number, 
invoiceamt as invoice_amount, 
i.comment as invoice_comment
from dbo.ap_invoicehistoryheader i