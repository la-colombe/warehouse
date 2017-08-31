select 
unique_key,
produced_sku, 
component_sku,
component_name, 
quantity, 
component_cost,
uom,
updated_at
from {{ref('bm_bill_of_materials')}}