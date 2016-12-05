select 
	row_number() OVER() AS unique_id,
	A.accountid as account_id,
	A.ActualID as sku, 
	A.PRDDescription as description,
	A.UserField1 as date_purchased, 
	A.SerialNumber as serial_number,
	A.UserField2 as value,
	A.Notes, 
	A.UserField3 as Status,
	A.UserField4 as date_moved, 
	A.UserField5 as vendor,
 	A.UserField6 as class,  
 	A.UserField8 as invested_value
from saleslogix.accountproduct A