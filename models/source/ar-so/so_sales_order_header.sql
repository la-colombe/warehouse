select 
h.salesorderno as sales_order_number,
  case orderdate 
    when '1753-01-01' then null
    else orderdate::date
  end as order_date,
h.ordertype as order_type,
  case 
    when shipexpiredate::date < '2011-01-01' or shipexpiredate::date >= '2999-01-01' then null
    else shipexpiredate::date
  end as ship_date,
  case udf_requested_delivery_date 
    when '1753-01-01' then null
    else udf_requested_delivery_date::date
  end as requested_delivery_date,
h.customerno as customer_code,
h.customerpono as customer_purchase_order_number,
h.shiptocode as ship_to_code,
h.shiptoname as ship_to_name,
h.shiptoaddress1 as ship_to_address,
h.shiptocity as ship_to_city,
h.shiptostate as ship_to_state,
h.shiptozipcode as ship_to_zip,
h.shipvia as ship_via,
h.warehousecode as warehouse_code,
w.warehouse_name as warehouse,
currentinvoiceno as invoice_number,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by,
h.comment as order_comment


from {{source('sage','so_salesorderheader')}} h
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
left join {{ref('im_warehouse')}} w on w.warehouse_code = h.warehousecode