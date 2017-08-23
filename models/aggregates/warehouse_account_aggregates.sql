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
	min(i.ship_date) as first_invoice_date,
	avg(datediff(second, ppci.ship_date, i.ship_date)) as average_time_since_previous_paid_coffee_invoice

from {{ref('warehouse_base_invoices')}} i
left join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} ppci on ppci.customer_code = i.customer_code and ppci.account_paid_coffee_invoice_number = pci.account_paid_coffee_invoice_number - 1


group by 1