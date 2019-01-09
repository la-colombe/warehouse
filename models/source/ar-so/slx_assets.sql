select 
	row_number() OVER() AS unique_id,
	A.accountid as account_id,
	A.ActualID as sku, 
	A.productname as product_name,
	A.UserField1 as date_purchased, 
	A.SerialNumber as serial_number,
	case
	  when (regexp_replace(A.UserField2,'[^0-9.]') ='.' or regexp_count(A.UserField2,'\\.') > 1) then null
	  else regexp_replace(A.UserField2,'[^0-9.]')
	end value,
	A.UserField3 as Status,
	A.UserField4 as date_moved, 
	A.UserField5 as vendor,
 	A.UserField6 as class,  
	case
	  when (regexp_replace(A.UserField8,'[^0-9.]') ='.' or regexp_count(A.UserField8,'\\.') > 1) then null
	  else regexp_replace(A.UserField8,'[^0-9.]')
	end invested_value
from sysdba.accountproduct A