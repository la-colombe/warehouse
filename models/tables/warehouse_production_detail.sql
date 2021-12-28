select 
	
	d.productionno,
	d.productionseqno,
	d.item_type,
	d.component_sku,
	d.component_name,
	d.warehouse_code,
	d.comment,
	d.valuation,
	d.unit_of_measure,
	d.quantity_per_unit,
	d.total_quantity,
	d.total_cost

from {{ref('bm_production_history_detail')}} d 