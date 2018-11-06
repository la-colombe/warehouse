select   

	i.customer_code,
	sum(il.total_weight) as last_90d_core_lbs

from {{ref('ar_invoice_history_detail')}} il
join {{ref('warehouse_invoices')}} i on i.unique_invoice_id = il.unique_invoice_id

where i.ship_date > date_add('day', -90,current_date)
  and il.extension >0

group by 1