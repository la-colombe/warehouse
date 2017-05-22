select 
ch.bankcode as bank_code,
ch.checkno as check_number,
ch.checkseqno as check_sequence_number,
ch.checktype as check_type,
ch.checkdate as check_date,
ch.transactiondate as check_transaction_date,
ch.apdivisionno as division,
ch.vendorno as vendor_number,
ch.checkamt as total_check_amount,
cd.invoiceno as invoice_number,
cd.invoiceseqno as invoice_sequence_number,
cd.comment as check_comment,
cd.amountpaid as amount_paid,
row_number() over (partition by invoice_number, invoice_sequence_number order by check_transaction_date desc) as row_number
from dbo.ap_checkhistoryheader ch
join dbo.ap_checkhistorydetail cd on cd.checkno = ch.checkno and ch.checkseqno = cd.checkseqno and cd.bankcode = ch.bankcode