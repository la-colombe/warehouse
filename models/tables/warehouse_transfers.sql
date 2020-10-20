select
md5(t.entry_number || t.sku || t.warehouse_code) as unique_key,
entry_number,
sku,
warehouse_name,
sent_date,
transaction_date,
transaction_quantity,
updated_at,
updated_by
from {{ref('im_item_transactions')}} t
join {{ref('im_warehouse')}} w on w.warehouse_code = t.warehouse_code
where transaction_type = 'IT' or transaction_type = 'IA'