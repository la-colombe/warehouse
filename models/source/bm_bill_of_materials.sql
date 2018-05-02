select 
md5(h.billno || d.componentitemcode || h.revision) as unique_key,
h.billno as produced_sku, 
h.revision as revision,
d.componentitemcode as component_sku,
i.name as component_name, 
d.quantityperbill as quantity, 
i.unit_cost as component_cost,
i.unit_of_measure as uom,
case
	when udf_bom_effective_date is null then '2016-01-01'
	else udf_bom_effective_date::date
end as effective_date,
h.datecreated + (nullif(h.timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
h.dateupdated + (nullif(h.timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.bm_billheader h
join dbo.bm_billdetail d on d.billno = h.billno and h.revision = d.revision
join {{ref('ci_item')}} i on i.sku = d.componentitemcode
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey