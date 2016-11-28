SELECT 

  invoiceno as invoice_number,
  itemcode as sku,
  itemcodedesc as item_name,
  itemtype as item_type,
  quantityshipped as quantity,
  quantityordered as quantity_ordered,
  quantitybackordered as quantity_backordered,
  unitprice as unit_price,
  extensionamt as extension,
  headerseqno as header_number,
  detailseqno as line_number,
  warehousecode as warehouse_code
  
from saleslogix.ar_invoicehistorydetail 

