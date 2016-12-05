select 

a.name,
a.account_id,
a.created_at,
a.division,
a.sales_rep_id,
a.regional_manager_id,
a.divisional_manager_id,
a.customer_code,
a.company_code,
a.primary_account_manager_id,
a.secondary_account_manager_id,
a.call_frequency,
a.min_vol,
a.new_tier,
a.sales_rep_name,
a.primary_account_manager_name,
a.secondary_account_manager_name,

aa.total_invoices,
aa.total_paid_coffee_invoices,
aa.second_paid_coffee_invoice_date,
aa.total_quantity,
aa.total_extension,
round(aa.total_weight::decimal(16,2),2) as total_weight,
aa.most_recent_invoice_date,
aa.total_coffee_extension,
aa.total_coffee_weight,

datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date) + 1 as weeks_active,
round((aa.total_coffee_extension / nullif(datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date) + 1, 0)::decimal(16,2),2) as average_weekly_coffee_revenue,
round((aa.total_coffee_weight/ nullif(datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date) + 1, 0))::decimal(16,2),2) as average_weekly_coffee_volume,
round((aa.total_coffee_extension / nullif(aa.total_coffee_weight, 0))::decimal(16,2),2) as average_coffee_price,

coalesce(aaa.total_value, 0) as total_asset_value,
coalesce(aaa.total_invested_value, 0) as total_invested_asset_value,
coalesce(aaa.total_customer_owned_value, 0) as total_customer_owned_asset_value


from {{ref('warehouse_base_accounts')}} a
left join {{ref('warehouse_account_aggregates')}} aa on aa.customer_code = a.customer_code
left join {{ref('warehouse_account_asset_aggregates')}} aaa on aaa.customer_code = a.customer_code
where a.customer_code is not null