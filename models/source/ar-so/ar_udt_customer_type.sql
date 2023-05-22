select

	udf_customer_type_code,
	udf_customertypenam as udf_customer_type_name
	
from {{source('sage','ar_udt_customer_type')}}