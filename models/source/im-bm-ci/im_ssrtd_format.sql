select
    udf_ssrtd_format_id::int as ssrtd_format_id,
    udf_format_desc as format_desc,
    nullif(udf_case_eq, '')::float as case_eq,
    nullif(udf_liquid_oz, '')::float as liquid_ounces,
    nullif(udf_hi, '')::int as hi,
    nullif(udf_ti, '')::int as ti,
    nullif(udf_sub_unit_id, '')::int as sub_unit_format_id,
    nullif(udf_units_in_pack, '')::int as units_in_pack,
    udf_stackable = 'Y' as stackable,
    nullif(udf_pallets_truck, '')::int as pallets_truck
from {{source('sage','im_udt_ssrtd_format')}}