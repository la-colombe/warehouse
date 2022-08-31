select 
  
  invoiceno as invoice_number,
  ardivisionno as ar_division_number,
  customerno as customer_number,
  salesorderno as sales_order_number,
  shipdate as ship_date,
  shipvia as ship_via,
  shipperid as shipper_id,
  freightamt  as freight_amount,
  invoicetotal as invoice_total,
  dateupdated as date_updated,
  timeupdated as time_updated,
  userupdatedkey as user_updated_key

from dbo.so_dailyshipment