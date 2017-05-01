select warehousecode as warehouse_code, 
case warehousedesc 
	when 'La Colombe Norton Shores' then 'Norton Shores'
	else warehousedesc
end as warehouse_name
from dbo.im_warehouse w