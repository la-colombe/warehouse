select

  invoiceno as invoice_number, 
  packageno as package_number, 
  itemcode as sku, 
  itemtype as item_type, 
  itemcodedesc as item_name, 
  aliasitemno as alias_item_number, 
  quantity

from {{source('sage','so_packagetrackingbyitem')}}