{{
  config({
    "materialized" : "table",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select
	i.sku, 
	i.created_at,
	i.name, 
	pl.product_line_desc as product_line,
	i.upc,
	i.active,
	i.unit_price, 
	i.product_type,
	i.shelf_life_days,
	i.unit_of_measure, 
	i.weight,  
	i.tax_class, 
	i.unit_cost,
	i.vendor,
	i.updated_at,
	i.default_warehouse_code,
	i.hi,
	i.ti,
	c.item_category,
	im.product_type_desc,
	i.procurement_type,

--GL Account Numbers
	pl.inventory_gl_id,
	gli.full_account_number as inventory_gl_account_number,
	glc.full_account_number as cogs_gl_account_number,
	gls.full_account_number as sales_income_gl_account_number,
	glr.full_account_number as return_gl_account_number,
	gla.full_account_number as adjustment_gl_account_number,
	glp.full_account_number as purchase_gl_account_number,

--Multi-Serve RTD Flavor
	i.msrtd_flavor_id,
	msrtd_flavor.flavor as msrtd_flavor,
	msrtd_flavor.roast_level as msrtd_roast_level,
	msrtd_flavor.seasonal as msrtd_flavor_seasonal,

--Multi-Serve RTD Format
	i.msrtd_format_id,
	msrtd_format.format_desc as msrtd_format_desc,
	msrtd_format.sub_unit_format_id as msrtd_sub_unit_format_id,
	msrtd_format.case_eq as msrtd_case_eq,
	msrtd_format.hi as msrtd_hi,
	msrtd_format.ti as msrtd_ti,
	msrtd_format.units_per_pack as msrtd_units_per_pack,
	msrtd_format.stackable as msrtd_stackable,
	msrtd_format.pallets_per_truck as msrtd_pallets_per_truck,

--Ontap Flavor
	i.ontap_flavor_id,
	ontap_flavor.flavor as ontap_flavor,
	ontap_flavor.concentration_type as ontap_flavor_conc_type,
	ontap_flavor.seasonal as ontap_flavor_seasonal,

-- Ontap Format
	i.ontap_format_id,
	ontap_format.format_desc as ontap_format_desc,
	ontap_format.liquid_ounces as ontap_liquid_ounces,
	ontap_format.sub_unit_format_id as ontap_sub_unit_format_id,
	ontap_format.units_per_pack as ontap_units_per_pack,

--Single Server RTD Flavor
	i.ssrtd_flavor_id,
	ssrtd_flavor.flavor_desc as ssrtd_flavor_desc,
	ssrtd_flavor.sub_category as ssrtd_sub_category,
	ssrtd_flavor.brand as ssrtd_brand,
	ssrtd_flavor.seasonal as ssrtd_seasonal,

--Single Serve RTD Format	
	i.ssrtd_format_id,
	ssrtd_format.format_desc as ssrtd_format_desc,
	ssrtd_format.case_eq as ssrtd_case_eq,
	ssrtd_format.hi as ssrtd_hi,
	ssrtd_format.ti as ssrtd_ti,
	ssrtd_format.sub_unit_format_id as ssrtd_sub_unit_format_id,
	ssrtd_format.units_in_pack as ssrtd_units_per_pack,
	ssrtd_format.stackable as ssrtd_stackable,
	ssrtd_format.pallets_truck as ssrtd_pallets_truck,

--Roasted Flavor	
	i.roasted_flavor_id,
	roasted_flavor.flavor as roasted_flavor,
	roasted_flavor.single_origin as roasted_single_origin,
	roasted_flavor.roast_level as roasted_roast_level,
	roasted_flavor.brand as roasted_brand,
	roasted_flavor.class as roasted_class,
	roasted_flavor.seasonal as roasted_seasonal,

--Roasted Format
	i.roasted_format_id,
	roasted_format.format_desc as roasted_format_desc,
	roasted_format.sub_unit_format_id as roasted_sub_unit_format_id,
	roasted_format.roasted_lbs as roasted_roasted_lbs,
	roasted_format.servings as roasted_servings,
	roasted_format.case_eq as roasted_case_eq,
	roasted_format.units_in_pack as roasted_units_per_pack
from {{ref('ci_item')}} i
left join {{ref('im_productline')}} pl on  pl.product_line = i.productline
left join {{ref('im_product_type')}} im on  im.product_type_code = pl.product_type_code
left join {{ref('im_item_category')}} c on  c.item_category_code = i.item_category_code
left join {{ref('gl_account')}} gli on pl.inventory_gl_id = gli.id
left join {{ref('gl_account')}} glc on pl.cogs_gl_id = glc.id
left join {{ref('gl_account')}} gls on pl.sales_income_gl_id = gls.id
left join {{ref('gl_account')}} glr on pl.return_gl_id = glr.id
left join {{ref('gl_account')}} gla on pl.adjustment_gl_id = gla.id
left join {{ref('gl_account')}} glp on pl.purchase_gl_id = glp.id
left join {{ref('im_msrtd_flavor')}} msrtd_flavor using (msrtd_flavor_id)
left join {{ref('im_msrtd_format')}} msrtd_format using (msrtd_format_id)
left join {{ref('im_ssrtd_flavor')}} ssrtd_flavor using (ssrtd_flavor_id)
left join {{ref('im_ssrtd_format')}} ssrtd_format using  (ssrtd_format_id)
left join {{ref('im_ontap_flavor')}} ontap_flavor using  (ontap_flavor_id)
left join {{ref('im_ontap_format')}} ontap_format using (ontap_format_id)
left join {{ref('im_roasted_flavor')}} roasted_flavor using  (roasted_flavor_id)
left join {{ref('im_roasted_format')}} roasted_format using  (roasted_format_id)