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
unit_cost,
vendor,
updated_at

from {{ref('warehouse_base_products')}}