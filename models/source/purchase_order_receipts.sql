select itemcode as sku,
receiptdate as recieved_at, 
quantityreceived as quantity
from dbo.po_receipthistorydetail d
join dbo.po_receipthistoryheader h on h.receipttype = d.receipttype and h.receiptno = d.receiptno