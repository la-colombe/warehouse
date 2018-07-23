select
  creditcardguid as card_guid,
  (ExpirationDateYear || '-' || ExpirationDateMonth || '-01')::date as expiration_date ,
  customerno as customer_code,
  paymenttype as card_type,
  cardholdername as card_holder,
  last4unencryptedcreditcardnos as last_4,
  emailaddress as email_address,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  usercreatedkey as user_created_key,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  userupdatedkey as user_updated_key
from dbo.AR_CustomerCreditCard