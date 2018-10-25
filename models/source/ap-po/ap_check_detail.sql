select
  bankcode as bank_code,
  checkno as check_number,
  checkseqno as check_sequence_number,
  invoiceno as invoice_number,
  invoiceseqno as invoice_sequence_number,
  case invoicedate
	  when '1753-01-01' then null
	  else invoicedate::date
  end as invoice_date,
  apdivisionno as division,
  vendorno as vendor_number,
  comment,
  amountpaid as amount_paid
from dbo.ap_checkhistorydetail