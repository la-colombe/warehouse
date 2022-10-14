select
  creditcardguid as card_guid,
  (ExpirationDateYear || '-' || ExpirationDateMonth || '-01')::date as expiration_date ,
  customerno as customer_code,
  paymenttype as card_type,
  cardholdername as card_holder,
  last4unencryptedcreditcardnos as last_4,
  emailaddress as email_address,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by
from {{source('sage','AR_CustomerCreditCard')}}
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey