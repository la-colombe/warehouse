select 

il.invoice_number,
il.header_sequence_number,
sum(il.extension) as extension
from {{ref('ap_invoice_history_detail')}} il
group by 1,2