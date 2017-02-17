select
sku, 
created_at,
name, 
product_line, 
unit_price, 
product_type,
sales_unit_of_measure, 
volume, 
ship_weight,  
commissionable,
tax_class, 
status, 
unit_cost, 
vendor,
updated_at

from {{ref('slx_product')}}
where sku != ''