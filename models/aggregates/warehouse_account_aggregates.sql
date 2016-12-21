select

	i.customer_code,
	count(*) as total_invoices,
	sum((ia.total_coffee_weight > 0 and ia.total_extension > 0)::integer) as total_paid_coffee_invoices,
	max(case when pci.account_paid_coffee_invoice_number = 2 then pci.transaction_date else NULL end) as second_paid_coffee_invoice_date,
	sum(ia.total_quantity) as total_quantity,
	sum(ia.total_extension) as total_extension,
	sum(ia.total_weight) as total_weight,
	max(i.transaction_date) as most_recent_invoice_date,
	sum(ia.total_coffee_extension) as total_coffee_extension,
	sum(ia.total_coffee_weight) as total_coffee_weight,
	min(i.transaction_date) as first_invoice_date,
	avg(datediff(second, ppci.transaction_date, i.transaction_date)) as average_time_since_previous_paid_coffee_invoice

from {{ref('warehouse_base_invoices')}} i
left join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.customer_code = i.customer_code
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} ppci on ppci.customer_code = i.customer_code and ppci.account_paid_coffee_invoice_number = pci.account_paid_coffee_invoice_number - 1


group by 1