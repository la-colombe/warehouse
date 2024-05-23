select 
	f1.ssrtd_format_id,
    f1.format_desc,
    f1.case_eq,
    f1.liquid_ounces,
    f1.hi,
    f1.ti,
    f1.sub_unit_format_id,
    f1.units_in_pack,
    coalesce(nullif(f2.units_in_pack, 1), 1) as sub_unit_units_in_pack,
    coalesce(nullif(f1.units_in_pack * f2.units_in_pack, 1), 1) as total_units_in_pack,
    f1.stackable,
    f1.pallets_truck
from
    {{ref('im_ssrtd_format')}} f1
left join
        {{ref('im_ssrtd_format')}} f2
on f1.sub_unit_format_id = f2.ssrtd_format_id