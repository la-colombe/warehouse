select 
    udf_item_category_code as item_category_code,   
    udf_category as item_category
from {{source('sage','im_udt_item_category')}}