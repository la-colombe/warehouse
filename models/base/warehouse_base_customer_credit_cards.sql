select
  card_guid,
  expiration_date,
  customer_code,
  card_type,
  card_holder,
  last_4,
  email_address,
  created_at,
  cu.full_name as created_by,
  updated_at,
  uu.full_name as updated_by
from {{ref('ar_customer_credit_card')}}
left join {{ref('sy_user')}} cu on cu.user_key = user_created_key
left join {{ref('sy_user')}} uu on uu.user_key = user_updated_key