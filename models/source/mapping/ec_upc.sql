select

  itemcode as sku,
  upccode as upc

from {{source('sage','ec_upccode')}}