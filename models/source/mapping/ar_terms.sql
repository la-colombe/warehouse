select
termscode as terms_code,
termscodedesc as payment_terms,
daysbeforedue as days_until_payment_due,
daysbeforediscountdue as days_until_discount_due,
discountrate as discount_rate
from {{source('sage','ar_termscode')}}