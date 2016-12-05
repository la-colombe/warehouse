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
aa.total_weight,
aa.most_recent_invoice_date,
aa.total_coffee_extension,
aa.total_coffee_weight,

datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date) as weeks_active,
aa.total_coffee_extension / nullif(datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date), 0) as average_weekly_coffee_revenue,
aa.total_coffee_weight/ nullif(datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date), 0) as average_weekly_coffee_volume,
aa.total_coffee_extension / nullif(aa.total_coffee_weight, 0) as average_coffee_price


from {{ref('warehouse_base_accounts')}} a
left join {{ref('warehouse_account_aggregates')}} aa on aa.customer_code = a.customer_code
where a.customer_code is not null