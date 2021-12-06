{{
  config({
    "materialized" : "table",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select 
	
	d.productionno,
	d.productionseqno,
	d.itemtype as item_type,
	d.componentitemcode as component_sku,
	d.componentdesc as component_name,
	d.componentwarehousecode as warehouse_code,
	d.commenttext as comment,
	d.valuation as valuation,
	d.unitofmeasure as unit_of_measure,
	d.quantityperbill as quantity_per_unit,
	d.extendedquantity as total_quantity,
	d.totalcost as total_cost

from dbo.bm_productionhistorydetail d 