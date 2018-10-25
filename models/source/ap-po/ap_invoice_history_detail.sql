select
il.invoiceno as invoice_number,
il.headerseqno as header_sequence_number,
il.detailseqno as line_number,
il.itemcode as sku,
il.quantityordered as quantity_ordered,
il.quantityreceived as quantity_received,
il.quantityinvoiced as quantity_invoiced,
il.extensionamt as extension,
p.name as item_name,
w.warehouse_name,
a.full_account_number
from dbo.ap_invoicehistorydetail il
left join {{ref('ci_item')}} p on p.sku = il.itemcode
left join {{ref('im_warehouse')}} w on w.warehouse_code = il.warehousecode
left join {{ref('gl_account')}} a on a.id = il.accountkey