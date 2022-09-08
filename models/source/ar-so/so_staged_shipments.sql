select

  invoiceno as invoice_number,
    case invoicedate 
      when '1753-01-01' then null
      else invoicedate::date
    end as invoice_date,
  invoicetype as invoice_type,
  salesorderno as sales_order_number,
  ordertype as order_type,
  orderstatus as order_status,
    case orderdate 
      when '1753-01-01' then null
      else orderdate::date
    end as order_date,
  customerpono as customer_po_number,
  ardivisionno as ar_division_number,
  customerno as customer_code,
  shiptocode as ship_to_code,
    case shipdate 
      when '1753-01-01' then null
      else shipdate::date
    end as ship_date,
  shipvia as ship_via,
  warehousecode as warehouse_code,
  shipperid as shipper_id,
  shipstatus as ship_status,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  usercreatedkey as user_created_key,
  userupdatedkey as user_updated_key

from dbo.so_invoiceheader    