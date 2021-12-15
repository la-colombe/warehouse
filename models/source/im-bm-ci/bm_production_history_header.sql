select

	p.productiondate::date as production_date,
	p.productionno,
	p.productionseqno,
	p.billno as produced_sku,
	p.revision,
	p.parentwarehousecode as warehouse_code,
	p.disassembly,
	p.disassemblytype as disassembly_type,
	p.productionquantity as quantity,
	p.billcalcunitcost as unit_cost,
	p.totalimcost as total_cost,
	p.datecreated::date as created_at,
	p.dateupdated::date as updated_at

from dbo.BM_Productionhistoryheader p

