select

arc.customer_code,
arc.name,
arc.created_date as created_at,
arc.account_manager_mas_id as primary_account_manager_id,
arc.sales_rep_mas_id as sales_rep_id,
arc.secondary_sales_rep_mas_id as secondary_sales_rep_id,
arc.min_avg_weekly_core_rev,
nvl(arc.group_code,ca.group_code) as group_code,

ad.division,

case
    when nvl(arc.sales_rep, ca.sales_rep_name) like '%,%' then split_part(nvl(arc.sales_rep, ca.sales_rep_name),', ',1)
    else nvl(arc.sales_rep, ca.sales_rep_name)
end as sales_rep_name,
case
    when nvl(arc.sales_rep, ca.sales_rep_name) like '%,%' then split_part(nvl(arc.sales_rep, ca.sales_rep_name),', ',2)
end as sales_rep_email,
case
    when nvl(arc.account_manager, a.primary_account_manager_name) like '%,%' then split_part(nvl(arc.account_manager, a.primary_account_manager_name),', ',1)
    else nvl(arc.account_manager, a.primary_account_manager_name)
end as primary_account_manager_name,
case
    when nvl(arc.secondary_sales_rep, ca.secondary_sales_rep_name) like '%,%' then split_part(nvl(arc.secondary_sales_rep, ca.secondary_sales_rep_name),', ',1)
    else nvl(arc.secondary_sales_rep, ca.secondary_sales_rep_name)
end as secondary_sales_rep_name,

arc.created_date,
arc.overdue_balance_30_day,
arc.overdue_balance_60_day,
arc.overdue_balance_90_day,
arc.overdue_balance_120_day,
arc.average_days_overdue,
arc.current_balance,
arc.average_days_to_payment,
arc.payment_terms,
arc.days_until_payment_due,
arc.sent_to_collections,
arc.sent_to_collections_date,
arc.credit_hold,
arc.address_line_1,
arc.address_line_2,
arc.city,
arc.state,
arc.country,
arc.zip,
arc.primary_ship_to,
arc.email,
arc.phone,
arc.tax,
arc.price_tier,
arc.ar_bucket,
arc.segment,
arc.customer_type,
arc.closed_status,
arc.business_type,

arc.diversity_bipoc_owned,
arc.diversity_woman_owned,
arc.diversity_lgbtq_owned,
arc.diversity_veteran_owned,
arc.diversity_disability_owned,

arc.comment,
arc.contact_code,


--saleslogix fields
a.account_id,
a.regional_manager_id,
a.divisional_manager_id,
ar.company_code,
ca.call_frequency,
ca.min_vol,
ca.new_tier



from {{ref('ar_customer')}} arc
left join {{ref('slx_account_ref')}} ar using(customer_code)
left join {{ref('slx_account')}} a using(account_id)
left join {{ref('slx_c_account')}} ca using(account_id)
left join {{ref('ar_division')}} ad using(division_code)