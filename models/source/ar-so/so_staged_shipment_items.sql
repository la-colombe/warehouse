select 

  invoiceno as invoice_number,
  linekey as line_key,
  itemcode as sku,
  itemcodedesc as item_name,
  itemtype as item_type,
  warehousecode as warehouse_code,
    case promisedate
      when '1753-01-01' then null
      else promisedate::date
    end as promise_date,
  quantityordered as quantity_ordered,
  quantityshipped as quantity_shipped,
  quantitybackordered as quantity_backordered

from {{source('sage','so_invoicedetail')}}