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
	case p.disassembly when 'Y' then -d.total_quantity else d.total_quantity end as total_quantity,
	case p.disassembly when 'Y' then -d.total_cost else d.total_cost end as total_cost
from {{ref('bm_production_history_detail')}} d 
	left join {{ref('bm_production_history_header')}} p using(productionno, productionseqno)