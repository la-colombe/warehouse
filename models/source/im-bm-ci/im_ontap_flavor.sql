{{
  config({
    "materialized" : "table",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select
    cast(udf_ontap_flavor_id as int) as ontap_flavor_id,
    udf_flavor as flavor,
    udf_conc_type as conc_type,
    udf_seasonal as seasonal
from {{source('sage','im_udt_ontap_flavor')}}