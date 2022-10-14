select 
  
  invoiceno as invoice_number,
  ardivisionno as ar_division_number,
  customerno as customer_code,
  salesorderno as sales_order_number,
  shipdate as ship_date,
  shipvia as shipping_method,
  shipperid as shipper_id,
  freightamt  as freight_amount,
  invoicetotal as invoice_total,
  dateupdated as date_updated,
  timeupdated as time_updated,
  userupdatedkey as user_updated_key

from {{source('sage','so_dailyshipment')}}
