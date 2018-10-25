select
	A.unique_id,
	A.account_id,
	A.sku, 
	A.product_name,
	A.date_purchased, 
	A.serial_number,
	A.value,
	A.status,
	A.date_moved, 
	A.vendor,
	A.class,  
	a.invested_value,

	ac.customer_code,
	ac.name as location

from {{ref('slx_assets')}} a
join {{ref('warehouse_base_accounts')}} ac on ac.account_id = a.account_id