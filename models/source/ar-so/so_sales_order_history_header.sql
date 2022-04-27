select 
*,
rank() over (partition by customer_code order by order_date, sales_order_number ASC) AS account_order_number
from (
  select
    md5('lch' || salesorderno) as unique_sales_order_id,
    salesorderno as sales_order_number,
      case orderdate 
        when '1753-01-01' then null
        else orderdate::date
      end as order_date,
      case udf_requested_delivery_date 
        when '1753-01-01' then null
        else udf_requested_delivery_date::date
      end as requested_delivery_date,
      case lastinvoicedate 
        when '1753-01-01' then null
        else lastinvoicedate::date
      end as last_invoice_date,
    orderstatus as order_status,
    customerno as customer_code,
    nullif(so551elk_weborderno,'') as web_order_number,
    billtoname as bill_to_name,
    CASE
      when billtoaddress1 = '' then null
      when billtoaddress2 = '' then billtoaddress1
      when billtoaddress3 = '' then billtoaddress1 || ' ' || billtoaddress2
      else billtoaddress1 || ' ' || billtoaddress2 || ' ' || billtoaddress3
    end as bill_to_address,
    billtocity as bill_to_city,
    billtostate as bill_to_state,
    billtozipcode as bill_to_zip,
    billtocountrycode as bill_to_country,
    shiptocode as ship_to_code,
    shiptoname as ship_to_name,
    CASE
      when shiptoaddress1 = '' then null
      when shiptoaddress2 = '' then shiptoaddress1
      when shiptoaddress3 = '' then shiptoaddress1 || ' ' || shiptoaddress2
      else shiptoaddress1 || ' ' || shiptoaddress2 || ' ' || shiptoaddress3
    end as ship_to_address,
    shiptocity as ship_to_city,
    shiptostate as ship_to_state,
    shiptozipcode as ship_to_zip,
    shiptocountrycode as ship_to_country,
    customerpono as customer_purchase_order_number,
    emailaddress as email_address,
    taxableamt + nontaxableamt as order_subtotal,
    salestaxamt as sales_tax,
    freightamt as freight,
    datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
    cu.full_name as created_by,
    dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
    uu.full_name as updated_by
  from dbo.so_salesorderhistoryheader s
  left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
  left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
  where orderstatus in  ('A','C')
  and orderdate >= '2015-05-01'

  union all

  select
    md5('lcg' || salesorderno) as unique_sales_order_id,
    salesorderno as sales_order_number,
      case orderdate 
        when '1753-01-01' then null
        else orderdate::date
      end as order_date,
    null as requested_delivery_date,
    orderstatus as order_status,
    customerno as customer_code,
    null as web_order_number,
    billtoname as bill_to_name,
    CASE
      when billtoaddress1 = '' then null
      when billtoaddress2 = '' then billtoaddress1
      when billtoaddress3 = '' then billtoaddress1 || ' ' || billtoaddress2
      else billtoaddress1 || ' ' || billtoaddress2 || ' ' || billtoaddress3
    end as bill_to_address,
    billtocity as bill_to_city,
    billtostate as bill_to_state,
    billtozipcode as bill_to_zip,
    billtocountrycode as bill_to_country,
    shiptocode as ship_to_code,
    shiptoname as ship_to_name,
    CASE
      when shiptoaddress1 = '' then null
      when shiptoaddress2 = '' then shiptoaddress1
      when shiptoaddress3 = '' then shiptoaddress1 || ' ' || shiptoaddress2
      else shiptoaddress1 || ' ' || shiptoaddress2 || ' ' || shiptoaddress3
    end as ship_to_address,
    shiptocity as ship_to_city,
    shiptostate as ship_to_state,
    shiptozipcode as ship_to_zip,
    shiptocountrycode as ship_to_country,
    customerpono as customer_purchase_order_number,
    emailaddress as email_address,
    taxableamt + nontaxableamt as order_subtotal,
    salestaxamt as sales_tax,
    freightamt as freight,
    datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
    cu.full_name as created_by,
    dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
    uu.full_name as updated_by
  from lcg.so_salesorderhistoryheader s
  left join lambda_uploads.historical_customer_mapping cm on cm.oldcustomercode = s.customerno and cm.database = 'lcg'
  left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
  left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
  where orderstatus in  ('A','C')
  and orderdate >= '2014-11-01' and orderdate < '2015-05-01'


  union all

  select
    md5('lct' || salesorderno) as unique_sales_order_id,
    salesorderno as sales_order_number,
      case orderdate 
        when '1753-01-01' then null
        else orderdate::date
      end as order_date,
    null as requested_delivery_date,
    orderstatus as order_status,
    customerno as customer_code,
    null as web_order_number,
    billtoname as bill_to_name,
    CASE
      when billtoaddress1 = '' then null
      when billtoaddress2 = '' then billtoaddress1
      when billtoaddress3 = '' then billtoaddress1 || ' ' || billtoaddress2
      else billtoaddress1 || ' ' || billtoaddress2 || ' ' || billtoaddress3
    end as bill_to_address,
    billtocity as bill_to_city,
    billtostate as bill_to_state,
    billtozipcode as bill_to_zip,
    billtocountrycode as bill_to_country,
    shiptocode as ship_to_code,
    shiptoname as ship_to_name,
    CASE
      when shiptoaddress1 = '' then null
      when shiptoaddress2 = '' then shiptoaddress1
      when shiptoaddress3 = '' then shiptoaddress1 || ' ' || shiptoaddress2
      else shiptoaddress1 || ' ' || shiptoaddress2 || ' ' || shiptoaddress3
    end as ship_to_address,
    shiptocity as ship_to_city,
    shiptostate as ship_to_state,
    shiptozipcode as ship_to_zip,
    shiptocountrycode as ship_to_country,
    customerpono as customer_purchase_order_number,
    emailaddress as email_address,
    taxableamt + nontaxableamt as order_subtotal,
    salestaxamt as sales_tax,
    freightamt as freight,
    datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
    cu.full_name as created_by,
    dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
    uu.full_name as updated_by
  from lct.so_salesorderhistoryheader s
  left join lambda_uploads.historical_customer_mapping cm on cm.oldcustomercode = s.customerno and cm.database = 'lct'
  left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
  left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
  where orderstatus in  ('A','C')
  and orderdate < '2014-11-01'
)