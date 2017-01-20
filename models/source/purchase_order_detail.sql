select 
h.purchaseorderno as purchase_order_id,
h.purchaseorderdate as purchase_order_date,
h.lastinvoicedate as invoice_date,
d.extensionamt as extension,
d.quantityordered as quantity_ordered,
d.quantityinvoiced as quantity_invoiced,
d.itemcode as sku,
h.vendorno as vendor_id
from dbo.po_purchaseorderheader h
join dbo.po_purchaseorderdetail d on d.purchaseorderno = h.purchaseorderno