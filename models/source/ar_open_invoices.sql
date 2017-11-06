select 
customerno as customer_code, 
invoiceno as invoice_number, 
invoicehistoryheaderseqno as header_number,
invoicetype as invoice_type,
invoiceno || '-' || invoicetype as invoice,
case invoicedate 
	when '1753-01-01' then null
	else invoicedate::date
end as invoice_date, 
case postingdate 
  when '1753-01-01' then null
  else postingdate
end as posting_date,
balance,
comment,
checkno as check_number,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.ar_openinvoice
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey