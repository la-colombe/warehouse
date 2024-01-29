select

  sku,
  lot_code,
  warehouse_code,

  create_date,
  case
    when substring(right(lot_code,10),3,6) similar to '([2][0-9])(0[1-9]|1[0-2])(0[0-9]|[1-2][0-9]|3[0-2])'
    then to_date(substring(right(lot_code,10),3,6), 'YYMMDD')
  end as production_date,
  receipt_date,
  transaction_date,
  update_date,


  qty_on_hand,
  qty_committed,
  unit_cost,
  allocated_cost,
  extended_cost,
  cost_calc_qty_committed,
  cost_calc_cost_committed

from {{ref('im_item_cost')}}