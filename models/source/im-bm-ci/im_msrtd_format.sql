select
    udf_msrtd_format_id::int as msrtd_format_id,
    udf_format_desc as format_desc,
    nullif(udf_sub_unit_format, '')::int as sub_unit_format_id,
    nullif(udf_case_eq, '')::float as case_eq,
    nullif(udf_liquid_oz, '')::float as liquid_ounces,
    nullif(udf_hi, '')::int as hi,
    nullif(udf_ti, '')::int as ti,
    nullif(udf_upp, '')::int as units_per_pack,
    udf_stack_pallets = 'Y' as stackable,
    nullif(udf_ppt, '')::int as pallets_per_truck
from {{source('sage','im_udt_msrtd_format')}}    