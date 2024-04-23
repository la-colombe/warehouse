select 
d.billno as produced_sku, 
d.revision as revision,
d.componentitemcode as component_sku,
i.name as component_name, 
d.quantityperbill as quantity,
d.standardunitcost as produced_cost,
i.unit_cost as component_cost,
i.unit_of_measure as uom,
d.scrappercent as waste_percent
from {{source('sage','bm_billdetail')}} d
left join {{ref('ci_item')}} i on i.sku = d.componentitemcode