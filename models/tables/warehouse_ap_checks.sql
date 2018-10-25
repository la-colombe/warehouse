select 
ach.bank_code,
ach.check_number,
ach.check_sequence_number,
ach.check_type,
ach.check_date,
ach.check_transaction_date,
acd.division,
acd.vendor_number,
ach.check_amount as total_check_amount,
acd.invoice_number,
acd.invoice_sequence_number,
ach.check_comment,
acd.comment as detail_comment,
acd.amount_paid,
row_number() over (partition by invoice_number, invoice_sequence_number order by check_transaction_date desc) as row_number,
ach.created_at,
ach.created_by,
ach.updated_at,
ach.updated_by
from {{ref('ap_check_header')}} ach
join {{ref('ap_check_detail')}} acd 
	on acd.check_sequence_number = ach.check_sequence_number
	and acd.check_number = ach.check_number
	and acd.bank_code = ach.bank_code