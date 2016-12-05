select
	A.account_id,
	A.item_number, 
	A.description,
	A.date_purchased, 
	A.serial_number,
	A.value,
	A.notes, 
	A.status,
	A.date_moved, 
	A.vendor,
	A.class,  
	a.invested_value,

	ac.customer_code,
	ac.name as location

from {{ref('slx_assets')}} a
join {{ref('warehouse_base_accounts')}} ac on ac.account_id = a.account_id