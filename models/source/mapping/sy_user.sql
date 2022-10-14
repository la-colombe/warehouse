select
  userkey as user_key,
  usercode as user_code,
  userlogon as user_login,
  firstname as first_name,
  lastname as last_name,
  firstname || ' ' || lastname as full_name,
  active
from {{source('sage','sy_user')}}