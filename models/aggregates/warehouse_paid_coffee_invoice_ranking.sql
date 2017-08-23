select 	
		i.unique_invoice_id,
		i.customer_code,
		i.ship_date,
		rank() over (partition by i.customer_code order by i.ship_date, i.invoice_number ASC) AS account_paid_coffee_invoice_number

from {{ref('warehouse_base_invoices')}} i
join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
where ia.total_core_quantity > 0 and ia.total_extension > 0