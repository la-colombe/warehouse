select
entry_number,
customer_code,
sku,
warehouse_name,
transaction_date,
sent_date,
transaction_quantity,
transaction_type,
updated_at,
updated_by
from {{ref('im_item_transactions')}} t
join {{ref('im_warehouse')}} w on w.warehouse_code = t.warehouse_code
