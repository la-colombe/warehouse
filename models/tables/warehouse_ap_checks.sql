select 
bank_code,
check_number,
check_sequence_number,
check_type,
check_date,
check_transaction_date,
division,
vendor_number,
total_check_amount,
invoice_number,
invoice_sequence_number,
check_comment,
detail_comment,
amount_paid,
row_number,
created_at,
created_by,
updated_at,
updated_by
from {{ref('warehouse_base_ap_checks')}}
	