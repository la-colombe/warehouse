select customer_code, 
sum(value) as total_value, 
sum(invested_value) as total_invested_value, 
sum(value) - sum(invested_value) as total_customer_owned_value
from  {{ref('warehouse_base_assets')}}
group by customer_code
