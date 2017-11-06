select 
i.apdivisionno as division,
invoiceno as invoice_number, 
case invoicedate 
	when '1753-01-01' then null
	else invoicedate::date
end as invoice_date, 
i.vendorno as vendor_number, 
invoiceamt as invoice_amount, 
checkno as check_number, 
checktype as check_type, 
case checkdate 
  when '1753-01-01' then null
  else checkdate::date
end as check_date, 
balance,
i.comment,
v.vendorname as vendor_name,
i.datecreated + (nullif(i.timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
i.dateupdated + (nullif(i.timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.ap_openinvoice i
left join dbo.ap_vendor v on v.apdivisionno = i.apdivisionno and v.vendorno = i.vendorno
left join {{ref('sy_user')}} cu on cu.user_key = i.usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = i.userupdatedkey