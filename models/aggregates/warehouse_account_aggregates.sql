{{
  config({
    "materialized" : "table",
    "sort" : "second_paid_coffee_invoice_date",
    "unique_key" : "account_id",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select

	i.customer_code,
	count(*) as total_invoices,
	sum((ia.total_core_weight > 0 and ia.total_extension > 0)::integer) as total_paid_core_invoices,
	max(case when pci.account_paid_coffee_invoice_number = 2 then pci.ship_date else NULL end) as second_paid_coffee_invoice_date,
	max(case when pci.account_paid_coffee_invoice_number = 1 then pci.ship_date else NULL end) as first_core_invoice_date,
	sum(ia.total_quantity) as total_quantity,
	sum(ia.total_extension) as total_extension,
	sum(ia.total_weight) as total_weight,
	max(i.ship_date) as most_recent_invoice_date,
	max(pci.ship_date) as most_recent_core_invoice_date,
	sum(ia.total_core_extension) as total_core_extension,
	sum(ia.total_core_weight) as total_core_weight,
	sum(case when i.ship_date > date_add('day', -90,current_date) and ia.total_core_extension > 0 then ia.total_core_weight end) as last_90d_core_weight,
	case
		when second_paid_coffee_invoice_date is not null then sum(case when date_diff('week',i.ship_date,current_date)<=13 and date_diff('week',i.ship_date,current_date)!=0 then ia.total_core_extension end) / least(greatest(date_diff('week',second_paid_coffee_invoice_date,current_date),1),13)
		else 0
	end as average_weekly_core_revenue, --rolling 13 weeks revenue divided by lesser of 13 or week tenure
	sum(ia.total_coffee_extension) as total_coffee_extension,
	sum(ia.total_coffee_weight) as total_coffee_weight,
	min(i.ship_date) as first_invoice_date,
	min(case when i.balance > 0 and i.ship_date >= '2015-01-01' then i.ship_date else null end) as oldest_outstanding_invoice_date,
	avg(datediff(second, ppci.ship_date, i.ship_date)) as average_time_since_previous_paid_coffee_invoice

from {{ref('warehouse_invoices')}} i
left join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} ppci on ppci.customer_code = i.customer_code and ppci.account_paid_coffee_invoice_number = pci.account_paid_coffee_invoice_number - 1

group by 1