select
  apdivisionno as division,
  vendorno as vendor_number,
  vendorname as vendor_name,
  termscode as terms_code,
  addressline1 as address_line_1,
  addressline2 as address_line_2,
  addressline3 as address_line_3,
  city,
  state,
  zipcode as zip_code,
  countrycode as country,
  telephoneno as telephone,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  usercreatedkey as user_created_key,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  userupdatedkey as user_updated_key
from dbo.ap_vendor v