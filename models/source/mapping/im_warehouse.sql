select warehousecode as warehouse_code, 
case warehousedesc 
	when 'La Colombe Norton Shores' then 'Norton Shores'
	when 'FST Logistics Warehouse' then 'FST'
	when 'La Colombe Salmon St' then 'Salmon'
	when 'PJP Warehouse' then 'PJP'
	when 'Tioga Warehouse' then 'Tioga'
	when 'Garfield Road' then 'Garfield'
	when 'Vertical Cold Warehouse' then 'Liberty Cold'
	when 'La Colombe Frogtown Warehouse' then 'Frogtown'
	when 'US Cold Storage' then 'US Cold'
	when 'Pontaluna Warehouse' then 'Pontaluna'
	when 'Allendale Warehouse' then 'Allendale'
	else warehousedesc
end as warehouse_name,
udf_palletspots as pallet_spots
from {{source('sage','im_warehouse')}} w