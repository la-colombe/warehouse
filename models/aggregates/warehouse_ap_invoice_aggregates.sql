select 

il.invoice_number,
il.header_sequence_number,
sum(il.extension) as extension
from {{ref('warehouse_base_ap_invoice_items')}} il
group by 1,2