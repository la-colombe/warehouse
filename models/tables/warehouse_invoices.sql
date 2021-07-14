SELECT

	i.unique_invoice_id,
	i.unique_sales_order_id,
	i.transaction_date, 
	i.customer_code,
	i.bill_to_name,
	i.invoice_number,
	i.sales_order_number,
	i.customer_po_number,
	i.header_number,
	i.invoice_type,
	i.invoice,
	i.ship_date,
	i.days_until_payment_due,
	i.discount_rate,
	i.discount_amount,
	i.ship_to_code,
	i.ship_to_name,
	i.ship_to_address1,
	i.ship_to_address2,
	i.ship_to_address3,
	i.ship_to_city,
	i.ship_to_state,
	i.ship_to_zip,
	i.ship_to_country,
	i.warehouse_code,
	i.warehouse_name,
	i.sales_tax as invoice_sales_tax,
	i.freight as invoice_freight,
	i.shipping_method,
	i.comment,
	i.invoice_date,
	i.created_at,
	i.created_by,
	i.updated_at,
	i.updated_by,
	i.packed_by,
	i.checked_by,

	case when i.invoice_type = 'IN' and nvl(ia.total_quantity,0) != 0 then rank() over (partition by i.customer_code, i.invoice_type order by i.transaction_date, i.invoice_number asc) else null end as account_invoice_number,

	oi.posting_date,
	oi.balance,
	ia.total_quantity,
	ia.total_quantity_ordered,
	ia.total_quantity_backordered,
	ia.total_extension,
	ia.total_weight,
	pci.account_paid_coffee_invoice_number,
	s.delivery_charge,
	dateadd('day',nvl(a.days_until_payment_due,0)::int,i.ship_date) as payment_due_date

from {{ref('ar_invoice_history_header')}} i
left join {{ref('ar_open_invoices')}} oi on oi.invoice_number = i.invoice_number and oi.header_number = i.header_number
left join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_invoice_shipment_aggregates')}} s on i.invoice_number = s.invoice_number
left join {{ref('warehouse_base_accounts')}} a on i.customer_code = a.customer_code

where nvl(ia.total_quantity,0) != 0
