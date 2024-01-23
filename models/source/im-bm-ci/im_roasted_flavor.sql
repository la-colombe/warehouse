{{
  config({
    "materialized" : "table",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select
    cast(udf_roasted_flavor_id as int) as roasted_flavor_id,
    udf_flavor as flavor,
    udf_single_origin as single_origin,
    udf_roast_level as roast_level,
    udf_brand as brand,
    udf_class as class,
    udf_seasonal as seasonal
from {{source('sage','im_udt_roasted_flavor')}}