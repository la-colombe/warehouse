select
  apdivisionno as division,
  vendorno as vendor_number,
  vendorname as vendor_name,
  addressline1 as address_line_1,
  addressline2 as address_line_2,
  addressline3 as address_line_3,
  city,
  zipcode as zip_code,
  countrycode as country,
  telephoneno as telephone,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by
from dbo.ap_vendor
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey