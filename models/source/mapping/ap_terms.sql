select
  termscode as terms_code,
  termscodedesc as terms_code_description,
  daysbeforedue as days_before_due
from {{source('sage','ap_termscode')}}