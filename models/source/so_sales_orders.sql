select 
h.salesorderno as sales_order_number, 
d.linekey as line_number,
h.orderdate as order_date, 
h.ordertype as order_type,
h.shipexpiredate as ship_date,
h.customerno as customer_code,
h.warehousecode as warehouse_code,
currentinvoiceno as invoice_number,
d.itemcode as sku,
d.itemcodedesc as item_name,
d.quantityordered as quantity_ordered,
d.extensionamt as extension,
lineweight * quantityordered as weight
from dbo.so_salesorderheader h
join dbo.so_salesorderdetail d on d.salesorderno = h.salesorderno