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
a.secondary_sales_rep_id,
a.call_frequency,
a.min_vol,
a.new_tier,
a.group_code,
a.sales_rep_name,
a.primary_account_manager_name,
a.secondary_sales_rep_name,

a.overdue_balance_30_day,
a.overdue_balance_60_day,
a.overdue_balance_90_day,
a.overdue_balance_120_day,
a.average_days_overdue,
a.current_balance,
a.average_days_to_payment,
a.payment_terms,
a.days_until_payment_due,
a.sent_to_collections,
a.sent_to_collections_date,

a.address_line_1,
a.address_line_2,
a.city,
a.state,
a.country,
a.zip,
a.email,
a.phone,
a.tax,
a.price_tier,
a.ar_bucket,

aa.total_invoices,
aa.total_paid_core_invoices,
aa.second_paid_coffee_invoice_date,
aa.first_invoice_date,
aa.total_quantity,
aa.total_extension,
round(aa.total_weight::decimal(16,2),2) as total_weight,
aa.most_recent_invoice_date,
aa.total_core_extension,
aa.total_core_weight,
aa.total_coffee_extension,
aa.total_coffee_weight,
aa.average_time_since_previous_paid_coffee_invoice,
aa.most_recent_core_invoice_date,
aa.first_core_invoice_date,
aa.oldest_outstanding_invoice_date,

l.last_90d_core_lbs,

acr.most_recent_payment_date,
 
case
	when dateadd(day, 91, most_recent_core_invoice_date) < current_date then 'Churned'
	else 'Active'
end as churn_status,

case
	when dateadd(day, 91, most_recent_core_invoice_date) < current_date then dateadd(day, 91, most_recent_core_invoice_date)
	else NULL
end as churn_date,

datediff(week, aa.first_core_invoice_date, aa.most_recent_core_invoice_date) + 1 as weeks_active,
round((aa.total_core_extension / nullif(datediff(week, aa.first_core_invoice_date, aa.most_recent_core_invoice_date) + 1, 0))::decimal(16,2),2) as average_weekly_core_revenue,
round((aa.total_core_weight/ nullif(datediff(week, aa.first_core_invoice_date, aa.most_recent_core_invoice_date) + 1, 0))::decimal(16,2),2) as average_weekly_core_volume,
round((aa.total_coffee_extension / nullif(aa.total_coffee_weight, 0))::decimal(16,2),2) as average_coffee_price,

coalesce(aaa.invested_machines,0) as invested_machines,
coalesce(aaa.total_value, 0) as total_asset_value,
coalesce(aaa.total_invested_value, 0) as total_invested_asset_value,
coalesce(aaa.total_customer_owned_value, 0) as total_customer_owned_asset_value


from {{ref('warehouse_base_accounts')}} a
left join {{ref('warehouse_account_aggregates')}} aa on aa.customer_code = a.customer_code
left join {{ref('warehouse_last_90d_core_aggregate')}} l on a.customer_code = l.customer_code
left join {{ref('warehouse_account_asset_aggregates')}} aaa on aaa.customer_code = a.customer_code
left join {{ref('warehouse_account_cash_receipts_aggregates')}} acr on acr.customer_code = a.customer_code
where a.customer_code is not null