select 
i.division,
invoice_number,
header_sequence_number,
invoice_date, 
i.vendor_number, 
invoice_comment,
vendor_name,
created_at,
created_by,
updated_at,
updated_by
from {{ref('ap_invoice_history_header')}} i
left join {{ref('ap_vendor')}} v on v.division = i.division and v.vendor_number = i.vendor_number
