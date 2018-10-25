select
  card_guid,
  expiration_date,
  customer_code,
  card_type,
  card_holder,
  last_4,
  email_address,
  created_at,
  created_by,
  updated_at,
  updated_by
from {{ref('ar_customer_credit_card')}}