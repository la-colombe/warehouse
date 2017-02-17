select distinct
actualid as sku, 
createdate as created_at,
name, 
family as product_line, 
price as unit_price, 
productgroup as product_type,
unit as sales_unit_of_measure, 
stockvolume as  volume, 
stockweight as ship_weight,  
commissionable,
taxable as tax_class, 
status, 
fixedcost as unit_cost, 
vendor,
modifydate as updated_at

from sysdba.product