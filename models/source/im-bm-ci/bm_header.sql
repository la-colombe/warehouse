select 
h.billno as produced_sku, 
h.revision as revision,
h.currentbillrevision as current_revision,
h.billtype as bill_type,
case
	when h.udf_bom_effective_date is null then '2016-01-01'
	when h.udf_bom_effective_date::date = '1753-01-01' then '2016-01-01'
	else h.udf_bom_effective_date::date
end as effective_date,
h.datecreated + (nullif(h.timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
h.dateupdated + (nullif(h.timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from {{source('sage','bm_billheader')}} h
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey