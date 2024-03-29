select
    udf_roasted_format_id::int as roasted_format_id,
    udf_format_desc as format_desc,
    nullif(udf_subunit_format, '')::int as sub_unit_format_id,
    nullif(udf_roasted_lbs, '')::float as roasted_lbs,
    nullif(udf_servings, '')::int as servings,
    nullif(udf_case_eq, '')::float as case_eq,
    nullif(udf_units_in_pack, '')::int as units_in_pack
from {{source('sage','im_udt_roasted_format')}}