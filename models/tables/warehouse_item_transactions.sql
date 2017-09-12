select
entry_number,
customer_code,
sku,
warehouse_code,
transaction_date,
sent_date,
transaction_quantity,
transaction_type
from {{ref('im_item_transactions')}} t