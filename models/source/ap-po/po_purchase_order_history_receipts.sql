with po_receipthistorydetail as (
	select
		headerseqno,
		receipttype as receipt_type,
		receiptno as receipt_number,
		linekey as purchase_order_line_number,
		purchaseorderno as purchase_order_number,
		--Warehouse 038 and 049 both represent the same Garfield location. 038 is deprecated in favor of 049
	  case warehousecode 
	    when '038' then '049' 
	    else warehousecode 
	  end as warehouse_code,  
		itemcode as sku,
		quantityreceived * (case unitofmeasureconvfactor when 0 then 1 else unitofmeasureconvfactor end) as quantity,
		quantityreceived as quantity_in_ordered_uom
	from {{source('sage','po_receipthistorydetail')}}
)

select 
	d.receipt_type,
	d.receipt_number,
	d.purchase_order_line_number,
	d.purchase_order_number,
	d.sku,
	case h.receiptdate 
		when '1753-01-01' then null
		else h.receiptdate::date
	end as recieved_at,
	case h.transactiondate
		when '1753-01-01' then null
		else h.transactiondate::date
	end as transaction_date,
	d.quantity,
	d.quantity_in_ordered_uom,
	w.warehouse_name as warehouse,
	h.datecreated + (nullif(h.timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
	cu.full_name as created_by,
	h.dateupdated + (nullif(h.timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
	uu.full_name as updated_by
from po_receipthistorydetail d
join {{source('sage','po_receipthistoryheader')}} h on h.purchaseorderno = d.purchase_order_number and h.headerseqno = d.headerseqno and h.receiptno = d.receipt_number
left join {{ref('sy_user')}} cu on cu.user_key = h.usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = h.userupdatedkey
left join {{ref('im_warehouse')}} w on w.warehouse_code = d.warehouse_code