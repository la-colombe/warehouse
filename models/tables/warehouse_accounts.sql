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
a.customer_type,

aa.total_invoices,
aa.total_paid_coffee_invoices,
aa.second_paid_coffee_invoice_date,
aa.total_quantity,
aa.total_extension,
aa.total_weight

from {{ref('warehouse_base_accounts')}} a
left join {{ref('warehouse_account_aggregates')}} aa on aa.customer_code = a.customer_code
where a.customer_code is not null