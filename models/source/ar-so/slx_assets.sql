select 
	row_number() OVER() AS unique_id,
	A.accountid as account_id,
	A.ActualID as sku, 
	A.productname as product_name,
	A.Purchase_Date as date_purchased, 
	A.SerialNumber as serial_number,
	A.HistoricalValue as value,
	A.UserField3 as Status,
	A.UserField4 as date_moved, 
	A.UserField5 as vendor,
 	A.UserField6 as class,  
	A.InvestValue as invested_value
from sysdba.accountasset A