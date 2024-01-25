select
    udf_ontap_flavor_id::int as ontap_flavor_id,
    udf_flavor as flavor,
    udf_conc_type as concentration_type,
    udf_seasonal = 'Y' as seasonal
from {{source('sage','im_udt_ontap_flavor')}}