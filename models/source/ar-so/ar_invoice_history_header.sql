select 
i.*,
art.days_until_payment_due,
w.warehouse_name

from (
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
    null as requested_delivery_date,
    coalesce(customercode, customerno) as customer_code,
    journalnoglbatchno as batch_number,
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
    termscode as terms_code,
    discountrate as discount_rate,
    discountamt as discount_amount,
    shiptocode as ship_to_code,
    shiptoname as ship_to_name,
    shiptoaddress1 as ship_to_address1,
    shiptoaddress2 as ship_to_address2,
    shiptoaddress3 as ship_to_address3,
    shiptocity as ship_to_city,
    shiptostate as ship_to_state,
    shiptozipcode as ship_to_zip,
    shiptocountrycode as ship_to_country,
    warehousecode as warehouse_code,
    salestaxamt as sales_tax,
    freightamt as freight,
    shipvia as shipping_method,
    comment,
    customerpono as customer_po_number,
    datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
    cu.full_name as created_by,
    dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
    uu.full_name as updated_by,
    null as packed_by,
    null as checked_by

  from {{source('lct','ar_invoicehistoryheader')}} i
  left join lambda_uploads.historical_customer_mapping cm on cm.oldcustomercode = i.customerno and cm.database = 'lct'
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
    null as requested_delivery_date,
    coalesce(customercode, customerno) as customer_code,
    journalnoglbatchno as batch_number,
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
    termscode as terms_code,
    discountrate as discount_rate,
    discountamt as discount_amount,
    shiptocode as ship_to_code,
    shiptoname as ship_to_name,
    shiptoaddress1 as ship_to_address1,
    shiptoaddress2 as ship_to_address2,
    shiptoaddress3 as ship_to_address3,
    shiptocity as ship_to_city,
    shiptostate as ship_to_state,
    shiptozipcode as ship_to_zip,
    shiptocountrycode as ship_to_country,
    warehousecode as warehouse_code,
    salestaxamt as sales_tax,
    freightamt as freight,
    shipvia as shipping_method,
    comment,
    customerpono as customer_po_number,
    datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
    cu.full_name as created_by,
    dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
    uu.full_name as updated_by,
    null as packed_by,
    null as checked_by

  from {{source('lcg','ar_invoicehistoryheader')}} i
  left join lambda_uploads.historical_customer_mapping cm on cm.oldcustomercode = i.customerno and cm.database = 'lcg'
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
    case udf_requested_delivery_date 
      when '1753-01-01' then null
      else udf_requested_delivery_date::date
    end as requested_delivery_date,
    coalesce(customercode, customerno) as customer_code,
    journalnoglbatchno as batch_number,
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
    termscode as terms_code,
    discountrate as discount_rate,
    discountamt as discount_amount,
    shiptocode as ship_to_code,
    shiptoname as ship_to_name,
    shiptoaddress1 as ship_to_address1,
    shiptoaddress2 as ship_to_address2,
    shiptoaddress3 as ship_to_address3,
    shiptocity as ship_to_city,
    shiptostate as ship_to_state,
    shiptozipcode as ship_to_zip,
    shiptocountrycode as ship_to_country,
    warehousecode as warehouse_code,
    salestaxamt as sales_tax,
    freightamt as freight,
    shipvia as shipping_method,
    comment,
    customerpono as customer_po_number,
    datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
    cu.full_name as created_by,
    dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
    uu.full_name as updated_by,
    sh.employee_name as packed_by,
    ch.employee_name as checked_by

  from {{source('sage','ar_invoicehistoryheader')}} i
  left join lambda_uploads.historical_customer_mapping cm on cm.oldcustomercode = i.customerno and cm.database = 'lch'
  left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
  left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
  left join {{ref('so_udt_shipper_checker')}} sh on sh.shipper_checker_code = udf_shipped_by
  left join {{ref('so_udt_shipper_checker')}} ch on ch.shipper_checker_code = udf_checked_by
  where transactiondate >= '2015-05-01'
  and (comment != 'LCT AR Import' or comment is null)
) i
left join {{ref('ar_terms')}} art on art.terms_code = i.terms_code
left join {{ref('im_warehouse')}} w on w.warehouse_code = i.warehouse_code

where i.customer_code not in ('01PAR05150001', '20NYC00720001','01PAR01440001', '01PAO00720001')
  --Invoices for above customer_codes are duplicated by 20NYR05140001, 20NYC00990001, 01PAO01290001 and 01PAO00710001 respectively