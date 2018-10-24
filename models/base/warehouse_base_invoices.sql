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
art.days_until_payment_due,
i.ship_to_name,
i.ship_to_address1,
i.ship_to_address2,
i.ship_to_address3,
i.ship_to_city,
i.ship_to_state,
i.ship_to_zip,
i.ship_to_country,
i.warehouse_code,
w.warehouse_name,
i.sales_tax,
i.freight,
i.shipping_method,
i.comment,
i.invoice_date,
oi.posting_date,
oi.balance,
i.created_at,
i.created_by,
i.updated_at,
i.updated_by,

rank() over (partition by i.customer_code order by i.transaction_date, i.invoice_number ASC) AS account_invoice_number


from {{ref('invoice_history_header')}} i
left join {{ref('ar_open_invoices')}} oi on oi.invoice_number = i.invoice_number and oi.header_number = i.header_number
left join {{ref('ar_terms')}} art on art.terms_code = i.terms_code
left join {{ref('im_warehouse')}} w on w.warehouse_code = i.warehouse_code