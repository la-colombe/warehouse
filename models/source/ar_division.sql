select ardivisionno as division_code, 
case ardivisionno
	when '01' then 'Philly'
	when '30' then 'D.C.'
	when '20' then 'New York'
	else ardivisiondesc 
end as division
from dbo.ar_division
