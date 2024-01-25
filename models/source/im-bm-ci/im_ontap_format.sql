select
    udf_ontap_format_id::int as ontap_format_id,
    udf_format_desc as format_desc,
    nullif(udf_liquid_ounces, '')::int as liquid_ounces,
    nullif(udf_sub_unit_format, '')::int as sub_unit_format_id,
    nullif(udf_units_in_pack, '')::int as units_per_pack
from {{source('sage','im_udt_ontap_format')}}

