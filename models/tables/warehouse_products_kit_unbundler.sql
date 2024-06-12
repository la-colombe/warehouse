/*
Products can be sold as a kit SKU (product_type = 'K') consisting of multiple finished good SKUs (product_type = 'F')
Production output, inventory, and forecasts only represent finished good SKUs.
This model unbundles all kit SKUs into its component finished good SKUs. 
So for example, say we sold a 4x12 oz bundle of Corsica. The kit_sku logged on the order_items table would be CCCOR412WB,
which consists of 4 units of the fg_sku CCCORB12WB
*/

{{
  config({
    "materialized" : "table",
    "post-hook" : [
      "grant select on table {{this}} to group non_gl_read_only"
      ]
    })
}}

select
  bom.produced_sku as kit_sku,
  bom.component_sku as fg_sku,
  bom.quantity as fg_quantity
from {{ref('warehouse_bill_of_materials')}} bom
join {{ref('warehouse_products')}} k on bom.produced_sku = k.sku
join {{ref('warehouse_products')}} f on bom.component_sku = f.sku
where bom.revision = bom.current_revision
  and k.product_type = 'K'
  and f.product_type = 'F'