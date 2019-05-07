select
i.itemcode as sku,
i.itemcodedesc as name,
pl.productlinedesc as product_line,
i.standardunitprice as unit_price,
i.producttype as product_type,
i.standardunitofmeasure as unit_of_measure,
case shipweight
  when '' THEN null
  else shipweight::decimal(16,10)
end as weight,
i.taxclass as tax_class,
i.primaryvendorno as vendor,
i.standardunitcost as unit_cost,
i.pricecode as price_code,
i.datecreated + (nullif(i.timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
i.dateupdated + (nullif(i.timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at
from dbo.ci_item i
left join dbo.im_productline pl on  pl.productline = i.productline