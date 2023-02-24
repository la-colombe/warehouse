select

  segment_number,
  division_code,
  division_description,
  sub_division_short_description,
  print_financial_statements,
  start_date,
  end_date,
  status,
  created_at,
  usercreatedkey,
  updated_at,
  userupdatedkey

from {{ref('gl_sub_account_division')}}
