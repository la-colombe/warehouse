select

  segmentno as segment_number,
  subaccountcode as cost_center_code,
  subaccountdesc as cost_center_description,
  subaccountshortdesc as cost_center_short_description,
  printfinancialstmts as print_financial_statements,
  case datestart
    when '1753-01-01' then null
    else datestart::date
  end as start_date,
  case dateend
    when '1753-01-01' then null
    else dateend::date
  end as end_date,
  status as status,
  datecreated + (nullif(timecreated, '')::DECIMAL(7, 5) || ' hours')::interval as created_at,
  usercreatedkey,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7, 5) || ' hours')::interval as updated_at,
  userupdatedkey

from {{source('sage','gl_subaccount')}}
where segmentno = '02' --filter to cost center