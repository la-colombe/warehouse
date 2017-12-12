select
i.apdivisionno as division,
headerseqno as header_sequence_number,
invoiceno as invoice_number, 
case invoicedate 
	when '1753-01-01' then null
	else invoicedate::date
end as invoice_date, 
i.purchaseorderno as purchase_order_number,
i.vendorno as vendor_number, 
invoiceamt as invoice_amount, 
i.comment as invoice_comment,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.ap_invoicehistoryheader i
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey