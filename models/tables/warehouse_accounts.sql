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
a.group_code,
a.sales_rep_name,
a.primary_account_manager_name,
a.secondary_account_manager_name,

a.overdue_balance_30_day,
a.overdue_balance_60_day,
a.overdue_balance_90_day,
a.overdue_balance_120_day,
a.average_days_overdue,
a.current_balance,
a.average_days_to_payment,
a.payment_terms,
a.sent_to_collections,

a.address_line_1,
a.address_line_2,
a.city,
a.state,
a.country,
a.zip,
a.email,
a.phone,
a.tax,

aa.total_invoices,
aa.total_paid_coffee_invoices,
aa.second_paid_coffee_invoice_date,
aa.first_invoice_date,
aa.total_quantity,
aa.total_extension,
round(aa.total_weight::decimal(16,2),2) as total_weight,
aa.most_recent_invoice_date,
aa.total_coffee_extension,
aa.total_coffee_weight,
aa.average_time_since_previous_paid_coffee_invoice,
case
	when aa.total_paid_coffee_invoices <= 5 and dateadd(day, 28, most_recent_invoice_date) < current_date then 'Churned'
	when dateadd(second, average_time_since_previous_paid_coffee_invoice * 2, most_recent_invoice_date) < current_date then 'Churned'
	else 'Active'
end as churn_status,

case
	when aa.total_paid_coffee_invoices <= 5 and dateadd(day, 28, most_recent_invoice_date) < current_date then most_recent_invoice_date
	when dateadd(second, average_time_since_previous_paid_coffee_invoice * 2, most_recent_invoice_date) < current_date then most_recent_invoice_date
	else NULL
end as churn_date,

datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date) + 1 as weeks_active,
round((aa.total_coffee_extension / nullif(datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date) + 1, 0))::decimal(16,2),2) as average_weekly_coffee_revenue,
round((aa.total_coffee_weight/ nullif(datediff(week, aa.second_paid_coffee_invoice_date, aa.most_recent_invoice_date) + 1, 0))::decimal(16,2),2) as average_weekly_coffee_volume,
round((aa.total_coffee_extension / nullif(aa.total_coffee_weight, 0))::decimal(16,2),2) as average_coffee_price,

coalesce(aaa.total_value, 0) as total_asset_value,
coalesce(aaa.total_invested_value, 0) as total_invested_asset_value,
coalesce(aaa.total_customer_owned_value, 0) as total_customer_owned_asset_value


from {{ref('warehouse_base_accounts')}} a
left join {{ref('warehouse_account_aggregates')}} aa on aa.customer_code = a.customer_code
left join {{ref('warehouse_account_asset_aggregates')}} aaa on aaa.customer_code = a.customer_code
where a.customer_code is not null