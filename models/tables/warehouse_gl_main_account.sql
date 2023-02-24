select

  segment_number,
  account_code,
  account_description,
  account_short_description,
  start_date,
  end_date,
  status,
  clear_balance,
  account_group,
  account_category,
  account_type,
  cash_flow_type,
  roll_up_code_1,
  roll_up_code_2,
  roll_up_code_3,
  roll_up_code_4,
  company_code,
  created_at,
  usercreatedkey,
  updated_at,
  userupdatedkey

from {{ref('gl_main_account')}}