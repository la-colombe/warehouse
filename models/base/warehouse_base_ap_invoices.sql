select 
i.division,
invoice_number,
header_sequence_number,
invoice_date, 
i.purchase_order_number,
i.vendor_number, 
i.invoice_amount,
i.shipping_amount,
invoice_comment,
i.terms_code,
vendor_name,
NVL(apt.days_before_due,v.days_before_due) as days_before_due,
i.created_at,
i.created_by,
i.updated_at,
i.updated_by
from {{ref('ap_invoice_history_header')}} i
left join {{ref('warehouse_base_ap_vendors')}} v on v.division = i.division and v.vendor_number = i.vendor_number
left join {{ref('ap_terms')}} apt on apt.terms_code = i.terms_code
