select 
h.purchaseorderno as purchase_order_number,
h.purchaseorderdate as purchase_order_date,
d.linekey as line_number,
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
d.itemcode as sku,
h.vendorno as vendor_id,
h.comment as comment,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.po_purchaseorderheader h
join dbo.po_purchaseorderdetail d on d.purchaseorderno = h.purchaseorderno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey