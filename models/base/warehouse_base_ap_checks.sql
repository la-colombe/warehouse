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
amount_paid,
row_number
from {{ref('ap_check_history')}}