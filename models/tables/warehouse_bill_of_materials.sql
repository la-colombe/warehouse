with header as (

select 
*,
lead(h.effective_date,1) over (PARTITION BY h.produced_sku order by h.effective_date) as next_effective_date
from {{ref('bm_header')}} h
)

select 
h.produced_sku, 
h.revision,
h.current_revision,
h.effective_date,
h.next_effective_date,
h.bill_type,
d.component_sku,
d.component_name, 
d.quantity,
d.produced_cost, 
d.component_cost,
d.uom,
d.waste_percent,
h.created_at,
h.created_by,
h.updated_at,
h.updated_by
from header h
join {{ref('bm_detail')}} d on d.produced_sku = h.produced_sku and d.revision = h.revision