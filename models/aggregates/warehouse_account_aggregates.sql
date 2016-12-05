select

	i.customer_code,
	count(*) as total_invoices,
	sum((ia.total_coffee_weight > 0 and ia.total_extension > 0)::integer) as total_paid_coffee_invoices,
	min(pci.transaction_date) as second_paid_coffee_invoice_date,
	sum(ia.total_quantity) as total_quantity,
	sum(ia.total_extension) as total_extension,
	sum(ia.total_weight) as total_weight,
	max(i.transaction_date) as most_recent_invoice_date,
	sum(ia.total_coffee_extension) as total_coffee_extension,
	sum(ia.total_coffee_weight) as total_coffee_weight

from {{ref('warehouse_base_invoices')}} i
left join {{ref('warehouse_invoice_aggregates')}} ia on ia.invoice_number = i.invoice_number and ia.header_number = i.header_number
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.customer_code = i.customer_code and pci.account_paid_coffee_invoice_number = 2

group by 1