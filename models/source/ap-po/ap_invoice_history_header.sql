select
i.apdivisionno as division,
headerseqno as header_sequence_number,
sourcejournal + '-' + sourcejournalno as source_code,
invoiceno as invoice_number, 
case invoicedate 
	when '1753-01-01' then null
	else invoicedate::date
end as invoice_date, 
case transactiondate 
	when '1753-01-01' then null
	else transactiondate::date
end as transaction_date, 
i.purchaseorderno as purchase_order_number,
t.days_before_due as days_before_due,
t.terms_code,
i.vendorno as vendor_number, 
nontaxableamt + freightamt as invoice_amount, 
freightamt as shipping_amount,
i.comment as invoice_comment,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from {{source('sage','ap_invoicehistoryheader')}} i
left join {{ref('ap_terms')}} t on t.terms_code = i.termscode
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
