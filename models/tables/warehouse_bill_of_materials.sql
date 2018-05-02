select 
unique_key,
effective_date,
produced_sku, 
revision,
component_sku,
component_name, 
quantity, 
component_cost,
uom,
updated_at
from {{ref('bm_bill_of_materials')}}