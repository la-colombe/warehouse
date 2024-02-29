select
    udf_product_type_code as product_type_code,
    udf_product_type as product_type_desc
from
    {{source('sage','im_udt_product_type')}}