select
i.sku, 
i.created_at,
i.name, 
i.product_line, 
i.unit_price, 
i.product_type,
i.unit_of_measure, 
i.weight,  
i.tax_class, 
i.unit_cost,
i.vendor,
i.updated_at,
i.default_warehouse_code,
i.hi,
i.ti,
i.item_category,
i.procurement_type,
gli.full_account_number as inventory_gl_account_number,
glc.full_account_number as cogs_gl_account_number,
gls.full_account_number as sales_income_gl_account_number,
glr.full_account_number as return_gl_account_number,
gla.full_account_number as adjustment_gl_account_number,
glp.full_account_number as purchase_gl_account_number

from {{ref('ci_item')}} i
	left join {{ref('gl_account')}} gli on i.inventory_gl_id = gli.id
	left join {{ref('gl_account')}} glc on i.cogs_gl_id = glc.id
	left join {{ref('gl_account')}} gls on i.sales_income_gl_id = gls.id
	left join {{ref('gl_account')}} glr on i.return_gl_id = glr.id
	left join {{ref('gl_account')}} gla on i.adjustment_gl_id = gla.id
	left join {{ref('gl_account')}} glp on i.purchase_gl_id = glp.id