SELECT

i.unique_invoice_id,
i.unique_sales_order_id,
i.transaction_date, 
i.customer_code,
i.bill_to_name,
i.invoice_number,
i.sales_order_number,
i.header_number,
i.invoice_type,
i.invoice,
i.ship_date,
i.ship_to_name,
i.ship_to_address1,
i.ship_to_address2,
i.ship_to_address3,
i.ship_to_city,
i.ship_to_state,
i.ship_to_zip,
i.ship_to_country,
i.sales_tax,
i.freight,
i.comment,
i.transaction_date as updated_at,

ari.posting_date,
ari.balance,


rank() over (partition by i.customer_code order by i.transaction_date, i.invoice_number ASC) AS account_invoice_number


from {{ref('invoice_history_header')}} i
left join {{ref('ar_invoices')}} ari on ari.unique_invoice_id = i.unique_invoice_id