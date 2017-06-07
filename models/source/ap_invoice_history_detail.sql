select
invoiceno as invoice_number,
headerseqno as header_sequence_number,
detailseqno as line_number,
itemcode as sku,
quantityordered as quantity_ordered,
quantityreceived as quantity_received,
quantityinvoiced as quantity_invoiced,
extensionamt as extension,
warehousecode as warehouse_code,
accountkey as gl_account_key
from dbo.ap_invoicehistorydetail 