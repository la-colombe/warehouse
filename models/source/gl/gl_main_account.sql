select

  segmentno as segment_number,
  mainaccountcode as account_code,
  mainaccountdesc as account_description,
  mainaccountshortdesc as account_short_description,
  case datestart
    when '1753-01-01' then null
    else datestart::date
  end as start_date,
  case dateend
    when '1753-01-01' then null
    else dateend::date
  end as end_date,
  status as status,
  clearbalance as clear_balance,
  accountgroup as account_group,
  accountcategory as account_category,
  accounttype as account_type,
  cashflowstype as cash_flow_type,
  rollupcode1 as roll_up_code_1,
  rollupcode2 as roll_up_code_2,
  rollupcode3 as roll_up_code_3,
  rollupcode4 as roll_up_code_4,
  companycode as company_code,
  datecreated + (nullif(timecreated, '')::DECIMAL(7, 5) || ' hours')::interval as created_at,
  usercreatedkey,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7, 5) || ' hours')::interval as updated_at,
  userupdatedkey

from {{source('sage','gl_mainaccount')}}