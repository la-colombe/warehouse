select
    udf_msrtd_flavor_id::int as msrtd_flavor_id,
    udf_flavor as flavor,
    udf_roast_level as roast_level,
    udf_seasonal = 'Y' as seasonal
from {{source('sage','im_udt_msrtd_flavor')}}