select 
produced_sku, 
revision,
component_sku,
i.name as component_name, 
quantity, 
i.unit_cost as component_cost,
i.unit_of_measure as uom
from {{ref('bm_detail')}} d
join {{ref('ci_item')}} i on i.sku = d.component_sku