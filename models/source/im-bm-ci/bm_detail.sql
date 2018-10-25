select 
d.billno as produced_sku, 
d.revision as revision,
d.componentitemcode as component_sku,
i.name as component_name, 
d.quantityperbill as quantity,
i.unit_cost as component_cost,
i.unit_of_measure as uom
from dbo.bm_billdetail d 
join {{ref('ci_item')}} i on i.sku = d.componentitemcode