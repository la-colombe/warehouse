{{
  config({
    "materialized" : "table",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select
    udf_ontap_format_id::int as ontap_format_id ,
    udf_format_desc as format_desc,
  case
    when udf_liquid_ounces = '' then null
    else udf_liquid_ounces::int
  end as liquid_ounces,
  case
    when udf_sub_unit_format = '' then null
    else udf_sub_unit_format::int
  end as sub_unit_format,
  case
    when udf_units_in_pack = '' then null
    else udf_units_in_pack::int
  end as units_in_pack
from {{source('sage','im_udt_ontap_format')}}
