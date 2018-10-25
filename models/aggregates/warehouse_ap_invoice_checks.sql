select
invoice_number,
invoice_sequence_number,
sum(amount_paid) as amount_paid
from {{ref('ap_check_detail')}}
group by 1,2