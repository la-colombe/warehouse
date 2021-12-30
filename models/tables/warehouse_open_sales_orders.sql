select 

	sales_order_number, 
	line_number,
	order_date, 
	order_type,
	ship_date,
	requested_delivery_date
	customer_code,
	customer_purchase_order_number,
	ship_to_code,
	ship_to_name,
	ship_to_address,
	ship_to_city,
	ship_to_state,
	ship_to_zip,
	ship_via,
	warehouse,
	invoice_number,
	sku,
	item_name,
	price_level,
	quantity_ordered,
	quantity_original,
	extension,
	weight,
	unit_price,
	created_at,
	created_by,
	updated_at,
	updated_by
	
from {{ref('so_sales_orders')}} so
