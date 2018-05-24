select
  division,
  vendor_number,
  vendor_name,
  apt.days_before_due,
  address_line_1,
  address_line_2,
  address_line_3,
  city,
  state,
  zip_code,
  country,
  telephone,
  created_at,
  cu.full_name as created_by,
  updated_at,
  uu.full_name as updated_by
from {{ref('ap_vendor')}} v
left join {{ref('sy_user')}} cu on cu.user_key = v.user_created_key
left join {{ref('sy_user')}} uu on uu.user_key = v.user_updated_key
left join {{ref('ap_terms')}} apt on apt.terms_code = v.terms_code