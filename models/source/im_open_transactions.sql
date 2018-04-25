select
  h.entryno as entry_number,
  h.batchno as batch_number,
  h.transactiontype as transaction_type,
  transactiondate::date as sent_date,
  towhsecode as to_warehouse_code,
  defaultfromwhsecode as from_warehouse_code,
  itemcode as sku,
  transactionqty as quantity,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by,
  cu.full_name as created_by
from dbo.im_transactionheader h
join dbo.im_transactiondetail d on d.entryno = h.entryno
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey