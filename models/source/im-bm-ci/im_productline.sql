select
    productline as product_line,
    productlinedesc as product_line_desc,
    producttype as product_type,
    udf_product_type,
    udf_type
from {{source('sage', 'im_productline')}}