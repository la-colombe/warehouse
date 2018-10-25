select
  division,
  vendor_number,
  vendor_name,
  days_before_due,
  address_line_1,
  address_line_2,
  address_line_3,
  city,
  state,
  zip_code,
  country,
  telephone,
  created_at,
  created_by,
  updated_at,
  updated_by
from {{ref('ap_vendor')}} v
