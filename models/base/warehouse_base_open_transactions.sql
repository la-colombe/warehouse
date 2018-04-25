select
  entry_number,
  batch_number,
  transaction_type,
  sent_date,
  fw.warehouse_name as from_warehouse,
  tw.warehouse_name as to_warehouse,
  sku,
  quantity,
  created_at,
  updated_at,
  updated_by,
  created_by
from {{ref('im_open_transactions')}} iot
join {{ref('im_warehouse')}} fw on fw.warehouse_code = iot.from_warehouse_code
join {{ref('im_warehouse')}} tw on tw.warehouse_code = iot.to_warehouse_code