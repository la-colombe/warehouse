select 
h.purchaseorderno as purchase_order_number,
h.purchaseorderdate as purchase_order_date,
d.linekey as line_number,
h.lastinvoicedate as invoice_date,
h.completiondate as completion_date,
d.requireddate as required_date,
h.lastreceiptdate as last_receipt_date,
d.extensionamt as extension,
d.quantityordered as quantity_ordered,
d.quantityinvoiced as quantity_invoiced,
d.quantityreceived as quantity_received,
d.itemcode as sku,
h.vendorno as vendor_id,
h.comment as comment
from dbo.po_purchaseorderheader h
join dbo.po_purchaseorderdetail d on d.purchaseorderno = h.purchaseorderno