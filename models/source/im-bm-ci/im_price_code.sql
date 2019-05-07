select
  nullif(pc.pricecode,'') as price_code,
  nullif(pc.itemcode,'') as sku,
  nullif(pc.customerno,'') as customer_code,
  case pc.customerpricelevel
    when '' then '8'
    else pc.customerpricelevel
  end as tier,
  case pricecode
    when '' then NULL
    else discountmarkup1
  end as tier_discount,
  case customerno
    when '' then NULL
    else discountmarkup1
  end as contract_price
from dbo.im_pricecode pc