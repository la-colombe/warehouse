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
	a.customer_code,
	a.location

from {{ref('warehouse_base_assets')}} a