--https://docs.google.com/spreadsheets/d/1FzyFf-_hSYqSshLnSpHpz2TyuwxhbsXuWyULBbS14dg/edit#gid=0
--Manual overrides for the requested_delivery_date

with recency as (
  select
    salesordernumber as sales_order_number,
    revisedrdd::date as revised_requested_delivery_date,
    row_number() over(partition by salesordernumber order by row_number desc) as recency
  from {{source('lambda_uploads','wholesale_revised_rdd')}}
)

select
  sales_order_number,
  revised_requested_delivery_date
from recency
where recency = 1