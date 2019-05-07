select
  sku,
  customer_code,
  contract_price
from {{ref('im_price_code')}}
where sku is not null and customer_code is not null