select
salesorderno as sales_order_number,
linekey as line_number,
itemcode as sku,
itemcodedesc as item_name,
warehousecode as warehouse_code,
quantityorderedoriginal as original_quantity,
quantityorderedrevised as revised_quantity,
quantityshipped as shipped_quantity,
quantitybackordered as backordered_quantity
from dbo.so_salesorderhistorydetail