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
	a.customer_code,
	a.location

from {{ref('warehouse_base_assets')}} a