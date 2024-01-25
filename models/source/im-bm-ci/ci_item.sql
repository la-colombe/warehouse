{{
  config({
    "materialized" : "table",
    "post-hook" : [
        "grant select on table {{this}} to group non_gl_read_only"
        ]
    })
}}

select
  i.itemcode as sku,
  i.itemcodedesc as name,
  pl.product_line_desc as product_line,
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
  c.udf_category as item_category,
  i.procurementtype as procurement_type,
  pl.inventory_gl_id,
  pl.cogs_gl_id,
  pl.sales_income_gl_id,
  pl.return_gl_id,
  pl.adjustment_gl_id,
  pl.purchase_gl_id,
  i.udf_msrtd_flavor,
  msrtd_flavor.msrtd_flavor_id as msrtd_flavor_id,
  msrtd_flavor.flavor as msrtd_flavor,
  msrtd_flavor.roast_level as msrtd_roast_level,
  msrtd_flavor.seasonal as msrtd_flavor_seasonal,
  i.udf_msrtd_format,
  msrtd_format.msrtd_format_id as msrtd_format_id,
  msrtd_format.format_desc as msrtd_format_desc,
  msrtd_format.sub_unit_format_id as ms_format_sub_unit_format_id,
  msrtd_format.case_eq as msrtd_case_eq,
  msrtd_format.hi as msrtd_hi,
  msrtd_format.ti as mstrd_ti,
  msrtd_format.units_per_pack as mstrd_units_per_pack,
  msrtd_format.stackable as msrtd_stackable,
  msrtd_format.pallets_per_truck as msrtd_pallets_per_truck,
  i.udf_ontap_flavor,
  ontap_flavor.ontap_flavor_id as ontap_flavor_id,
  ontap_flavor.flavor as ontap_flavor,
  ontap_flavor.concentration_type as ontap_flavor_conc_type,
  ontap_flavor.seasonal as ontap_flavor_seasonal,
  i.udf_ontap_format,
  ontap_format.ontap_format_id as ontap_format_id,
  ontap_format.format_desc as ontap_format_desc,
  ontap_format.liquid_ounces as ontap_liquid_ounces,
  ontap_format.sub_unit_format_id,
  ontap_format.units_per_pack as ontap_units_per_pack,
  i.udf_ssrtd_flavor,
  ssrtd_flavor.ssrtd_flavor_id as ssrtd_flavor_id,
  ssrtd_flavor.flavor_desc as ssrtd_flavor_desc,
  ssrtd_flavor.sub_category as ssrtd_sub_category,
  ssrtd_flavor.brand as ssrtd_brand,
  ssrtd_flavor.seasonal as ssrtd_flavor,
  i.udf_ssrtd_format,
  ssrtd_format.ssrtd_format_id as sstrd_format_id,
  ssrtd_format.format_desc as ssrtd_format_desc,
  ssrtd_format.case_eq as ssrtd_case_eq,
  ssrtd_format.hi as ssrtd_hi,
  ssrtd_format.ti as sstrd_ti,
  ssrtd_format.sub_unit_format_id as ssrtd_sub_unit_format_id,
  ssrtd_format.units_in_pack as ssrtd_units_per_pack,
  ssrtd_format.stackable as ssrtd_stackable,
  ssrtd_format.pallets_truck as ssrtd_pallets_truck,
  i.udf_roasted_flavor,
  roasted_flavor.roasted_flavor_id as roasted_flavor_id,
  roasted_flavor.flavor as roasted_flavor,
  roasted_flavor.single_origin as roasted_single_origin,
  roasted_flavor.roast_level as roasted_roast_level,
  roasted_flavor.brand as roasted_brand,
  roasted_flavor.class as roasted_class,
  roasted_flavor.seasonal as roasted_seasonal,
  i.udf_roasted_format,
  roasted_format.roasted_format_id as roasted_format_id,
  roasted_format.format_desc as roasted_format_desc,
  roasted_format.sub_unit_format_id as roasted_sub_unit_format_id,
  roasted_format.roasted_lbs as roasted_roasted_lbs,
  roasted_format.servings as roasted_servings,
  roasted_format.case_eq as roasted_case_eq,
  roasted_format.units_in_pack as roasted_units_per_pack
from {{source('sage','ci_item')}} i
left join {{ref('im_productline')}} pl on  pl.product_line = i.productline
left join {{ref('im_msrtd_flavor')}} msrtd_flavor on  msrtd_flavor.msrtd_flavor_id = i.udf_msrtd_flavor
left join {{ref('im_msrtd_format')}} msrtd_format on  msrtd_format.msrtd_format_id = i.udf_msrtd_format
left join {{ref('im_ssrtd_flavor')}} ssrtd_flavor on  ssrtd_flavor.ssrtd_flavor_id = i.udf_ssrtd_flavor
left join {{ref('im_ssrtd_format')}} ssrtd_format on  ssrtd_format.ssrtd_format_id = i.udf_ssrtd_format
left join {{ref('im_ontap_flavor')}} ontap_flavor on  ontap_flavor.ontap_flavor_id = i.udf_ontap_flavor
left join {{ref('im_ontap_format')}} ontap_format on  ontap_format.ontap_format_id = i.udf_ontap_format
left join {{ref('im_roasted_flavor')}} roasted_flavor on  roasted_flavor.roasted_flavor_id = i.udf_roasted_flavor
left join {{ref('im_roasted_format')}} roasted_format on  roasted_format.roasted_format_id = i.udf_roasted_format
left join {{source('sage','im_udt_item_category')}} c on  c.udf_item_category_code = i.udf_item_category
