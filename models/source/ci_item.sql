select
i.itemcode as sku,
i.datecreated as created_at,
i.itemcodedesc as name,
pl.productlinedesc as product_line,
i.standardunitprice as unit_price,
i.producttype as product_type,
i.standardunitofmeasure as unit_of_measure,
i.shipweight as weight,
i.taxclass as tax_class,
i.primaryvendorno as vendor,
i.standardunitcost as unit_cost,
i.dateupdated as updated_at
from dbo.ci_item i
left join dbo.im_productline pl on  pl.productline = pl.productline