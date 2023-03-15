select

  itemcode as sku,
  case when trim(lotserialno) = '' then null else lotserialno end as lot_code,
  warehousecode as warehouse_code,

  date_add('seconds',round(timecreated::float*3600,0)::int, datecreated) as create_date,
  receiptdate as receipt_date,
  transactiondate as transaction_date,
  date_add('seconds',round(timeupdated::float*3600,0)::int, dateupdated) as update_date,

  quantityonhand as qty_on_hand,
  quantitycommitted as qty_committed,
  unitcost as unit_cost,
  allocatedcost as allocated_cost,
  extendedcost as extended_cost,
  costcalcqtycommitted as cost_calc_qty_committed,
  costcalccostcommitted as cost_calc_cost_committed

from {{source('sage','im_itemcost')}}