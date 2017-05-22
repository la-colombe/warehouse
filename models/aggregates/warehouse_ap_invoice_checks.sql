select
invoice_number,
invoice_sequence_number,
sum(amount_paid) as amount_paid
from {{ref('warehouse_base_ap_checks')}}
group by 1,2