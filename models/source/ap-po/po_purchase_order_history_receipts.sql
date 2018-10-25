select 
d.receipttype as receipt_type,
d.receiptno as receipt_number,
linekey as purchase_order_line_number,
d.purchaseorderno as purchase_order_number,
itemcode as sku,
  case receiptdate 
    when '1753-01-01' then null
    else receiptdate::date
  end as recieved_at,
quantityreceived as quantity,
w.warehouse_name as warehouse,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.po_receipthistorydetail d
join dbo.po_receipthistoryheader h on h.purchaseorderno = d.purchaseorderno and h.headerseqno = d.headerseqno and h.receiptno = d.receiptno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
left join {{ref('im_warehouse')}} w on w.warehouse_code = d.warehousecode