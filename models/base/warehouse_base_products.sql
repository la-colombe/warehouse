select
sku, 
created_at,
name, 
product_line, 
unit_price, 
product_type,
unit_of_measure, 
weight,  
tax_class, 
vendor,
unit_cost,
updated_at

from {{ref('ci_item')}}