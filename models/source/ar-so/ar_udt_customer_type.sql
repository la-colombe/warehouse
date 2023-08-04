select

	udf_customer_type_code,
	udf_customertypenam as segment,
	case
    when udf_customer_type_code in ('1','2','3','4') then 'Hospitality'
    when udf_customer_type_code in ('6','7','8','9','A','B') then 'CPG'
    when udf_customer_type_code = 'D' then 'DTC'
    when udf_customer_type_code = 'X' then 'Internal'
  	else udf_customer_type_code
  end as customer_type
	
from {{source('sage','ar_udt_customer_type')}}