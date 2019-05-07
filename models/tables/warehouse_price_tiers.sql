select
  pc.price_code,
  i.sku,
  pc.tier,
  i.unit_price as standard_price,
  pc.tier_discount,
  i.unit_price - pc.tier_discount as tier_price
from {{ref('im_price_code')}} pc
join {{(ref('ci_item'))}} i on i.price_code = pc.price_code
where pc.price_code is not null