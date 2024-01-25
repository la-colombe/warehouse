select

    productline as product_line,
    productlinedesc as product_line_desc,
    producttype as product_type,
    inventoryacctkey as inventory_gl_id,
    costofgoodssoldacctkey as cogs_gl_id,
    salesincomeacctkey as sales_income_gl_id,
    returnsacctkey as return_gl_id,
    adjustmentacctkey as adjustment_gl_id,
    purchaseacctkey as purchase_gl_id
from {{source('sage', 'im_productline')}}