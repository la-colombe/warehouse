select 
md5(h.billno || d.componentitemcode) as unique_key,
h.billno as produced_sku, 
d.componentitemcode as component_sku,
i.name as component_name, 
d.quantityperbill as quantity, 
i.unit_cost as component_cost,
i.unit_of_measure as uom,
h.dateupdated as updated_at
from dbo.bm_billheader h
join dbo.bm_billdetail d on d.billno = h.billno
join {{ref('ci_item')}} i on i.sku = d.componentitemcode