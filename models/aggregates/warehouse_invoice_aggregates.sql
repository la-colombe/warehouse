select 
	
	il.unique_invoice_id,
	sum(il.quantity) as total_quantity,
	sum(il.quantity_ordered) as total_quantity_ordered,
	sum(il.quantity_backordered) as total_quantity_backordered,
	sum(il.extension) as total_extension,
	sum(il.total_weight) as total_weight,
	sum((il.sku like 'C%' or il.sku like 'P%')::integer * il.quantity) as total_core_quantity,
	sum((il.sku like 'C%' or il.sku like 'P%')::integer * il.total_weight) as total_core_weight,
	sum((il.sku like 'C%' or il.sku like 'P%')::integer * il.extension) as total_core_extension,
	sum((il.sku like 'C%')::integer * il.quantity) as total_coffee_quantity,
	sum((il.sku like 'C%')::integer * il.total_weight) as total_coffee_weight,
	sum((il.sku like 'C%')::integer * il.extension) as total_coffee_extension
from {{ref('warehouse_base_invoice_items')}} il
group by 1