select

  segment_number,
  cost_center_code,
  cost_center_description,
  cost_center_short_description,
  print_financial_statements,
  start_date,
  end_date,
  status,
  created_at,
  usercreatedkey,
  updated_at,
  userupdatedkey

from {{ref('gl_sub_account')}}