select
md5('lch' || salesorderno) as unique_sales_order_id,
salesorderno as sales_order_number,
  case orderdate 
    when '1753-01-01' then null
    else orderdate::date
  end as order_date,
orderstatus as order_status,
customerno as customer_code,
nullif(so551elk_weborderno,'') as web_order_number,
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
  end as order_date,orderstatus as order_status,
customerno as customer_code,
null as web_order_number,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from lcg.so_salesorderhistoryheader s
left join google_sheets.lcg_customer_mapping cm on cm.old_customer_code = s.customerno
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
  end as order_date,orderstatus as order_status,
customerno as customer_code,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from lct.so_salesorderhistoryheader s
left join google_sheets.lct_customer_mapping cm on cm.old_customer_code = s.customerno
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
where orderstatus in  ('A','C')
and orderdate < '2014-11-01'