select
entryno as entry_number,
customerno as customer_code,
itemcode as sku,
warehousecode as warehouse_code,
case transactiondate 
	when '1753-01-01' then null
	else transactiondate::date
end as transaction_date, 
case referencedate 
	when '1753-01-01' then null
	else referencedate::date
end as sent_date, 
transactionqty as transaction_quantity,
transactioncode as transaction_type,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.im_itemtransactionhistory t
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey