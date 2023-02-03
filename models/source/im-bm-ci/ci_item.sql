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
i.dateupdated + (nullif(i.timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
i.defaultwarehousecode as default_warehouse_code,
i.udf_hi as hi,
i.udf_ti as ti,
i.procurementtype as procurement_type,
pl.inventoryacctkey as inventory_gl_id,
pl.costofgoodssoldacctkey as cogs_gl_id,
pl.salesincomeacctkey as sales_income_gl_id,
pl.returnsacctkey as return_gl_id,
pl.adjustmentacctkey as adjustment_gl_id,
pl.purchaseacctkey as purchase_gl_id

from {{source('sage','ci_item')}} i
left join {{source('sage','im_productline')}} pl on  pl.productline = i.productline