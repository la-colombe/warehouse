select 
  h.purchaseorderno as purchase_order_number,
  h.purchaseorderdate as purchase_order_date,
  d.linekey as line_number,
  h.orderstatus as order_status,
  case lastinvoicedate 
    when '1753-01-01' then null
    else lastinvoicedate::date
  end as invoice_date, 
  case completiondate 
    when '1753-01-01' then null
    else completiondate::date
  end as completion_date, 
  case requireddate 
    when '1753-01-01' then null
    else requireddate::date
  end as required_date, 
  case lastreceiptdate 
    when '1753-01-01' then null
    else lastreceiptdate::date
  end as last_receipt_date, 
  d.extensionamt as extension,
  d.quantityordered as quantity_ordered,
  d.quantityinvoiced as quantity_invoiced,
  d.quantityreceived as quantity_received,
  d.masteroriginalqty as master_quantity_original,
  d.masterqtybalance as master_quantity_balance,
  d.originalunitcost as original_unit_cost,
  d.itemcodedesc as item_name,
  d.unitcost as invoiced_unit_cost,
  d.itemcode as sku,
  h.apdivisionno as division,
  h.vendorno as vendor_id,
  h.comment as comment,
  h.ordertype as order_type,
  --Warehouse 038 and 049 both represent the same Garfield location. 038 is deprecated in favor of 049
  case h.warehousecode 
    when '038' then '049' 
    else h.warehousecode 
  end as warehouse_code,  
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by
from {{source('sage','po_purchaseorderheader')}} h
join {{source('sage','po_purchaseorderdetail')}} d on d.purchaseorderno = h.purchaseorderno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey