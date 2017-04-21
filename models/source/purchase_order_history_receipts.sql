select 
d.receipttype as receipt_type,
d.receiptno as receipt_number,
linekey as line_number,
d.purchaseorderno as purchase_order_number,
itemcode as sku,
receiptdate as recieved_at, 
quantityreceived as quantity,
d.warehousecode as warehouse_code
from dbo.po_receipthistorydetail d
join dbo.po_receipthistoryheader h on h.receipttype = d.receipttype and h.receiptno = d.receiptno
