select 
md5(h.billno || d.componentitemcode) as unique_key,
h.billno as produced_sku, 
d.componentitemcode as component_sku,
i.name as component_name, 
d.quantityperbill as quantity, 
i.unit_cost as component_cost,
i.unit_of_measure as uom,
h.datecreated + (nullif(h.timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
h.dateupdated + (nullif(h.timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.bm_billheader h
join dbo.bm_billdetail d on d.billno = h.billno
join {{ref('ci_item')}} i on i.sku = d.componentitemcode
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey