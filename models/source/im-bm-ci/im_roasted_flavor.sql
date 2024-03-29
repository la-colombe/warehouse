select
    udf_roasted_flavor_id::int as roasted_flavor_id,
    udf_flavor as flavor,
    udf_single_origin = 'Y' as single_origin,
    udf_roast_level as roast_level,
    udf_brand as brand,
    udf_class as class,
    udf_seasonal = 'Y' as seasonal
from {{source('sage','im_udt_roasted_flavor')}}