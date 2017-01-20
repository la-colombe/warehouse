SELECT 
  md5('lct' || invoiceno || headerseqno) as unique_invoice_id,
  md5('lct' || invoiceno || headerseqno || detailseqno) as unique_invoice_item_id,
  'lct' as source_mas_instance,
  invoiceno as invoice_number,
  coalesce(sku, itemcode) as sku,
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
  
from saleslogix.lct_ar_invoicehistorydetail i
left join google_sheets.lct_sku_mapping sm on sm.old_sku = i.itemcode

UNION

SELECT 
  md5('lcg' || invoiceno || headerseqno) as unique_invoice_id,
  md5('lcg' || invoiceno || headerseqno || detailseqno) as unique_invoice_item_id,
  'lcg' as source_mas_instance,
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
  
from saleslogix.lcg_ar_invoicehistorydetail 

UNION

SELECT 
  md5('lch' || invoiceno || headerseqno) as unique_invoice_id,
  md5('lch' || invoiceno || headerseqno || detailseqno) as unique_invoice_item_id,
  'lch' as source_mas_instance,
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
  
from dbo.ar_invoicehistorydetail 
