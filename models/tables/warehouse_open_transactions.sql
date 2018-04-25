select
  entry_number,
  batch_number,
  transaction_type,
  sent_date,
  from_warehouse,
  to_warehouse,
  sku,
  quantity,
  created_at,
  updated_at,
  updated_by,
  created_by
from {{ref('warehouse_base_open_transactions')}} iot