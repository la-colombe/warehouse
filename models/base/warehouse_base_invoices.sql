SELECT

i.unique_invoice_id,
i.transaction_date, 
coalesce(cm.customer_code, i.customer_code) as customer_code,
i.bill_to_name,
i.invoice_number,
i.header_number,
i.invoice_type,
i.invoice,
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

a.name as account_name,
a.division as account_division,
a.company_code,
a.min_vol as account_min_vol,
a.new_tier as account_tier,
a.sales_rep_name,
a.primary_account_manager_name,
a.secondary_account_manager_name,

rank() over (partition by i.customer_code order by i.transaction_date, i.invoice_number ASC) AS account_invoice_number


from {{ref('invoice_history_header')}} i
left join {{ref('warehouse_base_accounts')}} a on a.customer_code = i.customer_code
left join google_sheets.lcg_customer_mapping cm on cm.old_customer_code = i.customer_code