select

	p.production_date,
	p.productionno,
	p.productionseqno,
	p.produced_sku,
	p.revision,
	p.lot_number,
	p.warehouse_code,
	p.disassembly,
	p.disassembly_type,
	case p.disassembly when 'Y' then -p.quantity else p.quantity end as quantity,
	p.unit_cost,
	p.total_cost,
	p.created_at,
	p.updated_at

from {{ref('bm_production_history_header')}} p