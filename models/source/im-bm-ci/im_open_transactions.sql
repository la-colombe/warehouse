select
  h.entryno as entry_number,
  h.batchno as batch_number,
  h.transactiontype as transaction_type,
  transactiondate::date as sent_date,
  fw.warehouse_name as from_warehouse,
  tw.warehouse_name as to_warehouse,
  itemcode as sku,
  transactionqty as quantity,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by,
  cu.full_name as created_by
from {{source('sage','im_transactionheader')}} h
join {{source('sage','im_transactiondetail')}} d on d.entryno = h.entryno
join {{ref('im_warehouse')}} fw on fw.warehouse_code = defaultfromwhsecode
join {{ref('im_warehouse')}} tw on tw.warehouse_code = towhsecode
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
