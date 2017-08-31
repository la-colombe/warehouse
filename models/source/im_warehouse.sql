select warehousecode as warehouse_code, 
case warehousedesc 
	when 'La Colombe Norton Shores' then 'Norton Shores'
	when 'FST Logistics Warehouse' then 'FST'
	when 'La Colombe Salmon St' then 'Salmon'
	when 'PJP Warehouse' then 'PJP'
	when 'Tioga Warehouse' then 'Tioga'
	else warehousedesc
end as warehouse_name
from dbo.im_warehouse w