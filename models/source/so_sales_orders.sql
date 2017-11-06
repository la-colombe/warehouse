select 
h.salesorderno as sales_order_number, 
d.linekey as line_number,
  case orderdate 
    when '1753-01-01' then null
    else orderdate::date
  end as order_date,
h.ordertype as order_type,
  case shipexpiredate 
    when '1753-01-01' then null
    else shipexpiredate::date
  end as ship_date,
h.customerno as customer_code,
h.warehousecode as warehouse_code,
currentinvoiceno as invoice_number,
d.itemcode as sku,
d.itemcodedesc as item_name,
d.quantityordered as quantity_ordered,
d.extensionamt as extension,
lineweight * quantityordered as weight,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by

from dbo.so_salesorderheader h
join dbo.so_salesorderdetail d on d.salesorderno = h.salesorderno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey