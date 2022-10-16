select
d.salesorderno as sales_order_number,
d.linekey as line_number,
d.itemcode as sku,
d.itemcodedesc as item_name,
  case d.promisedate
    when '1753-01-01' then null
    else d.promisedate::date
  end as promise_date,
w.warehouse_name as warehouse,
d.quantityorderedoriginal as original_quantity,
d.quantityorderedrevised as revised_quantity,
d.quantityshipped as shipped_quantity,
d.quantitybackordered as backordered_quantity
from {{source('sage','so_salesorderhistorydetail')}} d
left join {{ref('im_warehouse')}} w on w.warehouse_code = d.warehousecode