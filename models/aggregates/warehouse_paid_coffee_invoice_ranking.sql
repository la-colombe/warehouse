select 	i.invoice_number,
		i.header_number,
		i.customer_code,
		i.transaction_date,
		rank() over (partition by i.customer_code order by i.transaction_date, i.invoice_number ASC) AS account_paid_coffee_invoice_number

from {{ref('warehouse_base_invoices')}} i
join {{ref('warehouse_invoice_aggregates')}} ia on ia.invoice_number = i.invoice_number and ia.header_number = i.header_number
where ia.total_coffee_quantity > 0 and ia.total_extension > 0