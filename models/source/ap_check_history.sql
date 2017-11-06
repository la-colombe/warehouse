select 
ch.bankcode as bank_code,
ch.checkno as check_number,
ch.checkseqno as check_sequence_number,
ch.checktype as check_type,
case checkdate 
	when '1753-01-01' then null
	else checkdate::date
end as check_date, 
case transactiondate 
	when '1753-01-01' then null
	else transactiondate::date
end as check_transaction_date, 
ch.apdivisionno as division,
ch.vendorno as vendor_number,
ch.checkamt as total_check_amount,
cd.invoiceno as invoice_number,
cd.invoiceseqno as invoice_sequence_number,
cd.comment as check_comment,
cd.amountpaid as amount_paid,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by,
row_number() over (partition by invoice_number, invoice_sequence_number order by check_transaction_date desc) as row_number
from dbo.ap_checkhistoryheader ch
join dbo.ap_checkhistorydetail cd on cd.checkno = ch.checkno and ch.checkseqno = cd.checkseqno and cd.bankcode = ch.bankcode
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey