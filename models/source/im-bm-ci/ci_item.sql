select
  i.itemcode as sku,
  nullif(i.udf_upc, '') as upc,
  i.itemcodedesc as name,
  i.productline as productline,
  i.standardunitprice as unit_price,
  i.producttype as product_type,
  i.standardunitofmeasure as unit_of_measure,
  nullif(i.udf_shelf_life_days, '')::int as shelf_life_days,
  i.inactiveitem = 'N' as active,
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
  i.udf_item_category as item_category_code,
  i.procurementtype as procurement_type,
  nullif(i.udf_msrtd_flavor, '')::int as msrtd_flavor_id,
  nullif(i.udf_msrtd_format, '')::int as msrtd_format_id,
  nullif(i.udf_ontap_flavor, '')::int as ontap_flavor_id,
  nullif(i.udf_ontap_format, '')::int as ontap_format_id,
  nullif(i.udf_ssrtd_flavor, '')::int as ssrtd_flavor_id,
  nullif(i.udf_ssrtd_format, '')::int as ssrtd_format_id,
  nullif(i.udf_roasted_flavor, '')::int as roasted_flavor_id,
  nullif(i.udf_roasted_format, '')::int as roasted_format_id
from {{source('sage','ci_item')}} i
