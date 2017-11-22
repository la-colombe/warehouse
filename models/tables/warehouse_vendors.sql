select
  division,
  vendor_number,
  vendor_name,
  address_line_1,
  address_line_2,
  address_line_3,
  city,
  zip_code,
  country,
  telephone,
  created_at,
  created_by,
  updated_at,
  updated_by
from {{ref('ap_vendor')}}
