select 
d.receipttype as receipt_type,
d.receiptno as receipt_number,
linekey as purchase_order_line_number,
d.purchaseorderno as purchase_order_number,
itemcode as sku,
receiptdate as recieved_at, 
quantityreceived as quantity,
d.warehousecode as warehouse_code
from dbo.po_receipthistorydetail d
join dbo.po_receipthistoryheader h on h.purchaseorderno = d.purchaseorderno and h.headerseqno = d.headerseqno
