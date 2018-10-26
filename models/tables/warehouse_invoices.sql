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

rank() over (partition by i.customer_code order by i.transaction_date, i.invoice_number ASC) AS account_invoice_number,

oi.posting_date,
oi.balance,
ia.total_quantity,
ia.total_quantity_ordered,
ia.total_quantity_backordered,
ia.total_extension,
ia.total_weight,
pci.account_paid_coffee_invoice_number,
s.delivery_charge

from {{ref('ar_invoice_history_header')}} i
left join {{ref('ar_open_invoices')}} oi on oi.invoice_number = i.invoice_number and oi.header_number = i.header_number
left join {{ref('warehouse_invoice_aggregates')}} ia on ia.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_paid_coffee_invoice_ranking')}} pci on pci.unique_invoice_id = i.unique_invoice_id
left join {{ref('warehouse_invoice_shipment_aggregates')}} s on i.invoice_number = s.invoice_number