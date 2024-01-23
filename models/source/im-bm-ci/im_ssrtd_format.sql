{{
  config({
    "materialized" : "table",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select
    udf_ssrtd_format_id::int as ssrtd_format_id,
    udf_format_desc as format_desc,
  case
    when udf_case_eq = '' then null
    else udf_case_eq::float
  end as case_eq,
  /*case
    when udf_hi = '' then null
    else udf_hi::int
  end as hi,*/
  nullif(udf_hi, '')::int as hi,
  /*case
    when udf_ti = '' then null
    else udf_ti::int
  end as ti,*/
  nullif(udf_ti, '')::int as ti,
  case
    when udf_sub_unit_id = '' then null
    else udf_sub_unit_id::int
  end as sub_unit_id,
  case
    when udf_units_in_pack = '' then null
    else udf_units_in_pack::int
  end as sub_units_in_pack,
    udf_stackable as stackable,
  /*case
    when udf_pallets_truck = '' then null
    else udf_pallets_truck::int
  end as pallets_per_truck*/
  nullif(udf_pallets_truck, '')::int as pallets_truck
from {{source('sage','im_udt_ssrtd_format')}}

