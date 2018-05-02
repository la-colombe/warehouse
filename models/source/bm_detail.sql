select 
d.billno as produced_sku, 
d.revision as revision,
d.componentitemcode as component_sku,
d.quantityperbill as quantity
from dbo.bm_billdetail d 