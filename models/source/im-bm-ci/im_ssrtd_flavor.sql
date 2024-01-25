
{{
  config({
    "materialized" : "table",
    "post-hook" : [
        "grant select on table {{this}} to group non_gl_read_only"
        ]
    })
}}
select
    udf_ssrtd_flavor_id::int as ssrtd_flavor_id,
    udf_flavor_desc as flavor_desc,
    udf_subcategory as sub_category,
    udf_brand as brand,
    udf_seasonal = 'Y' as seasonal
from {{source('sage','im_udt_ssrtd_flavor')}}
