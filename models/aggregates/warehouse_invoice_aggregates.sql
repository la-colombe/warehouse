select 
	
	il.unique_invoice_id,
	sum(il.quantity) as total_quantity,
	sum(il.quantity_ordered) as total_quantity_ordered,
	sum(il.quantity_backordered) as total_quantity_backordered,
	sum(il.extension) as total_extension,
	sum(il.total_weight) as total_weight,
	sum((il.sku like 'C%')::integer * il.total_weight) as total_coffee_weight,
	sum((il.sku like 'C%')::integer * il.extension) as total_coffee_extension

from {{ref('warehouse_base_invoice_items')}} il
group by 1