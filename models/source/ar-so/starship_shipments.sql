select
  so.ordernumber as sales_order_number,
  so.documentkey as invoice_number,
  so.ponumber as po_number,
  s.deliverycharge as delivery_charge,
  s.deliverydesc as delivery_description,
  s.customer as customer_code,
  s.starshipuser as shipper,
  s.totalweight as total_weight,
  s.processdatetime as processed_at,
  s.mastertrackingid as tracking_id,
  s.mastertrackinglink as tracking_link,
  s.totalpackqty as number_of_packages
from {{source('starship','shipment')}} s
  join {{source('starship','shipmentorder')}} so on so.shipmentid = s.internalid and so.ordernumber != 'No Order'
where deleted = 0