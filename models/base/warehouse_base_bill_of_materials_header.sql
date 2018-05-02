select 
produced_sku, 
revision,
effective_date,
lead(effective_date,1) over (PARTITION BY produced_sku order by effective_date) as next_effective_date,
created_at,
cu.full_name as created_by,
updated_at,
uu.full_name as updated_by
from {{ref('bm_header')}}
left join {{ref('sy_user')}} cu on cu.user_key = created_user_key
left join {{ref('sy_user')}} uu on uu.user_key = updated_user_key