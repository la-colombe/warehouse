select 
il.*,
il.quantity * p.weight as total_weight,
a.full_account_number,
a.full_account_name as gl_account_name

from (
  SELECT 
    md5('lct' || invoiceno || headerseqno) as unique_invoice_id,
    md5('lct' || invoiceno || headerseqno || detailseqno) as unique_invoice_item_id,
    'lct' as source_mas_instance,
    invoiceno as invoice_number,
    coalesce(sku, itemcode) as sku,
    itemcodedesc as item_name,
    itemtype as item_type,
    null as kit_type,
    quantityshipped as quantity,
    quantityordered as quantity_ordered,
    quantitybackordered as quantity_backordered,
    unitprice as unit_price,
    linediscountpercent as discount_percentage,
    extensionamt as extension,
    headerseqno as header_number,
    detailseqno as line_number,
    warehousecode as warehouse_code,
    salesacctkey as sales_account_key
    
  from {{source('lct','ar_invoicehistorydetail')}} i
  left join lambda_uploads.historical_sku_mapping sm on sm.oldsku = i.itemcode and sm.database = 'lct'

  union all

  SELECT 
    md5('lcg' || invoiceno || headerseqno) as unique_invoice_id,
    md5('lcg' || invoiceno || headerseqno || detailseqno) as unique_invoice_item_id,
    'lcg' as source_mas_instance,
    invoiceno as invoice_number,
    itemcode as sku,
    itemcodedesc as item_name,
    itemtype as item_type,
    null as kit_type,
    quantityshipped as quantity,
    quantityordered as quantity_ordered,
    quantitybackordered as quantity_backordered,
    unitprice as unit_price,
    linediscountpercent as discount_percentage,
    extensionamt as extension,
    headerseqno as header_number,
    detailseqno as line_number,
    warehousecode as warehouse_code,
    salesacctkey as sales_account_key
    
  from {{source('lcg','ar_invoicehistorydetail')}} 

  union all

  SELECT 
    md5('lch' || invoiceno || headerseqno) as unique_invoice_id,
    md5('lch' || invoiceno || headerseqno || detailseqno) as unique_invoice_item_id,
    'lch' as source_mas_instance,
    invoiceno as invoice_number,
    itemcode as sku,
    itemcodedesc as item_name,
    itemtype as item_type,
    case when kititem = 'Y' and unitprice > 0 then 'Parent'
      when kititem = 'N' and unitprice = 0 then 'Child'
      else 'Non Kit'
    end as kit_type,
    quantityshipped as quantity,
    quantityordered as quantity_ordered,
    quantitybackordered as quantity_backordered,
    unitprice as unit_price,
    linediscountpercent as discount_percentage,
    extensionamt as extension,
    headerseqno as header_number,
    detailseqno as line_number,
    warehousecode as warehouse_code,
    salesacctkey as sales_account_key
    
  from {{source('sage','ar_invoicehistorydetail')}}
) il
left join {{ref('ci_item')}} p on p.sku = il.sku
left join {{ref('gl_account')}} a on a.id = il.sales_account_key