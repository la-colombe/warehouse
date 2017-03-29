select 
d.receipttype as receipt_type,
d.receiptno as receipt_number,
linekey as line_number,
d.purchaseorderno as purchase_order_number,
w.warehousedesc as warehouse,
itemcode as sku,
receiptdate as recieved_at, 
quantityreceived as quantity
from dbo.po_receipthistorydetail d
join dbo.po_receipthistoryheader h on h.receipttype = d.receipttype and h.receiptno = d.receiptno
left join dbo.im_warehouse w on w.warehousecode = d.warehousecode