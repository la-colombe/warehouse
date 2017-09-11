select
md5('lch' || salesorderno) as unique_sales_order_id,
salesorderno as sales_order_number,
orderdate as order_date,
orderstatus as order_status,
customerno as customer_code
from dbo.so_salesorderhistoryheader s
where orderstatus in  ('A','C')
and orderdate >= '2015-05-01'

union all

select
md5('lcg' || salesorderno) as unique_sales_order_id,
salesorderno as sales_order_number,
orderdate as order_date,
orderstatus as order_status,
customerno as customer_code
from lcg.so_salesorderhistoryheader s
left join google_sheets.lcg_customer_mapping cm on cm.old_customer_code = s.customerno
where orderstatus in  ('A','C')
and orderdate >= '2014-11-01' and orderdate < '2015-05-01'


union all

select
md5('lct' || salesorderno) as unique_sales_order_id,
salesorderno as sales_order_number,
orderdate as order_date,
orderstatus as order_status,
customerno as customer_code
from lct.so_salesorderhistoryheader s
left join google_sheets.lct_customer_mapping cm on cm.old_customer_code = s.customerno
where orderstatus in  ('A','C')
and orderdate < '2014-11-01'