select 
  md5('lct' || invoiceno || headerseqno) as unique_invoice_id,
  md5('lct' || salesorderno) as unique_sales_order_id,
  'lct' as source_mas_instance,
case transactiondate 
  when '1753-01-01' then null
  else transactiondate::date
end as transaction_date, 
case invoicedate 
  when '1753-01-01' then null
  else invoicedate::date
end as invoice_date, 
  coalesce(customer_code, customerno) as customer_code,
  billtoname as bill_to_name,
  invoiceno as invoice_number,
  salesorderno as sales_order_number,
  headerseqno as header_number,
  invoicetype as invoice_type,
  invoiceno || '-' || invoicetype as invoice,
  case shipdate 
    when '1753-01-01' then null
    else shipdate::date
  end as ship_date, 
  shiptoname as ship_to_name,
  shiptoaddress1 as ship_to_address1,
  shiptoaddress2 as ship_to_address2,
  shiptoaddress3 as ship_to_address3,
  shiptocity as ship_to_city,
  shiptostate as ship_to_state,
  shiptozipcode as ship_to_zip,
  shiptocountrycode as ship_to_country,
  salestaxamt as sales_tax,
  freightamt as freight,
  comment,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by

from lct.ar_invoicehistoryheader i
left join google_sheets.lct_customer_mapping cm on cm.old_customer_code = i.customerno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey

where transactiondate < '2014-11-01'

union all

select 
  md5('lcg' || invoiceno || headerseqno) as unique_invoice_id,
  md5('lcg' || salesorderno) as unique_sales_order_id,
  'lcg' as source_mas_instance,
case transactiondate 
  when '1753-01-01' then null
  else transactiondate::date
end as transaction_date, 
case invoicedate 
  when '1753-01-01' then null
  else invoicedate::date
end as invoice_date, 
  coalesce(customer_code, customerno) as customer_code,
  billtoname as bill_to_name,
  invoiceno as invoice_number,
  salesorderno as sales_order_number,
  headerseqno as header_number,
  invoicetype as invoice_type,
  invoiceno || '-' || invoicetype as invoice,
  case shipdate 
    when '1753-01-01' then null
    else shipdate::date
  end as ship_date,   
  shiptoname as ship_to_name,
  shiptoaddress1 as ship_to_address1,
  shiptoaddress2 as ship_to_address2,
  shiptoaddress3 as ship_to_address3,
  shiptocity as ship_to_city,
  shiptostate as ship_to_state,
  shiptozipcode as ship_to_zip,
  shiptocountrycode as ship_to_country,
  salestaxamt as sales_tax,
  freightamt as freight,
  comment,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by

from lcg.ar_invoicehistoryheader i
left join google_sheets.lcg_customer_mapping cm on cm.old_customer_code = i.customerno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey

where transactiondate >= '2014-11-01' and transactiondate < '2015-05-01'

union all

select 
  md5('lch' || invoiceno || headerseqno) as unique_invoice_id,
  md5('lch' || salesorderno) as unique_sales_order_id,
  'lch' as source_mas_instance,
case transactiondate 
  when '1753-01-01' then null
  else transactiondate::date
end as transaction_date, 
case invoicedate 
  when '1753-01-01' then null
  else invoicedate::date
end as invoice_date, 
  coalesce(new_customer_code, customerno) as customer_code,
  billtoname as bill_to_name,
  invoiceno as invoice_number,
  salesorderno as sales_order_number,
  headerseqno as header_number,
  invoicetype as invoice_type,
  invoiceno || '-' || invoicetype as invoice,
  case shipdate 
    when '1753-01-01' then null
    else shipdate::date
  end as ship_date, 
  shiptoname as ship_to_name,
  shiptoaddress1 as ship_to_address1,
  shiptoaddress2 as ship_to_address2,
  shiptoaddress3 as ship_to_address3,
  shiptocity as ship_to_city,
  shiptostate as ship_to_state,
  shiptozipcode as ship_to_zip,
  shiptocountrycode as ship_to_country,
  salestaxamt as sales_tax,
  freightamt as freight,
  comment,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by

from dbo.ar_invoicehistoryheader i
left join google_sheets.lch_customer_mapping cm on cm.old_customer_code = i.customerno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
where transactiondate >= '2015-05-01'
and (comment != 'LCT AR Import' or comment is null)
