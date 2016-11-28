select 

a.name,
a.created_at,
a.division,
a.account_id,
a.sales_rep_id,
a.regional_manager_id,
a.divisional_manager_id,

ar.customer_code,
ar.company_code,

ca.primary_account_manager_id,
ca.secondary_account_manager_id,
ca.call_frequency,
ca.min_vol,
ca.new_tier,

sr.full_name as sales_rep_name,
am1.full_name as primary_account_manager_name,
am2.full_name as secondary_account_manager_name,

case
	when customer_code like '70%' then 'CPG'
	else 'Hospitality'
end as customer_type

from {{ref('slx_account')}} a
left join {{ref('slx_account_ref')}} ar on ar.account_id = a.account_id
left join {{ref('slx_c_account')}} ca on ca.account_id = a.account_id
left join {{ref('slx_users')}} sr on sr.user_id = a.sales_rep_id
left join {{ref('slx_users')}} am1 on am1.user_id = ca.primary_account_manager_id
left join {{ref('slx_users')}} am2 on am2.user_id = ca.secondary_account_manager_id
where ar.customer_code is not null