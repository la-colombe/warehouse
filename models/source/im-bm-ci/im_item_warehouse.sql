select

  itemcode as sku,
  warehousecode as warehouse_code,
  binlocation as bin_location,
  reordermethod as reorder_method,
  quantityonhand as quantity_on_hand,
  quantityonpurchaseorder as quantity_on_purchase_order,
  quantityonsalesorder as quantity_on_sales_order,
  quantityonbackorder as quantity_on_backorder,
  averagecost as average_cost,
  quantityrequiredforwo as quantity_required_for_work_order,
  economicorderqty as economic_order_quantity,
  reorderpointqty as reorder_point_quantity,
  minimumorderqty as min_order_quantity,
  maximumonhandqty as max_order_quantity,
  quantityonworkorder as quanity_on_work_order,
  quantityinshipping as quantity_shipping,
  totalwarehousevalue as total_warehouse_value,
  costcalcqtycommitted as cost_calc_quantity,
  costcalccostcommitted as cost_calc_cost,
  case lastphysicalcountdate
    when '1753-01-01' then null
    else lastphysicalcountdate::date
  end as last_physical_count_date,
  datecreated + (nullif(timecreated, '')::DECIMAL(7, 5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7, 5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by 

from {{source('sage','im_itemwarehouse')}}
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey