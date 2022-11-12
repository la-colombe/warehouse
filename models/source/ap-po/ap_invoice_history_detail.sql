with ap_invoice_history_detail as (
	select
		invoiceno as invoice_number,
		headerseqno as header_sequence_number,
		detailseqno as line_number,
		accountkey as account_key,
		--Warehouse 038 and 049 both represent the same Garfield location. 038 is deprecated in favor of 049
		case warehousecode 
			when '038' then '049' 
			else warehousecode 
		end as warehouse_code,	
		itemcode as sku,
		quantityordered as quantity_ordered,
		quantityreceived as quantity_received,
		quantityinvoiced as quantity_invoiced,
		extensionamt as extension
	from {{source('sage','ap_invoicehistorydetail')}}
)

select
	il.invoice_number,
	il.header_sequence_number,
	il.line_number,
	il.sku,
	il.quantity_ordered,
	il.quantity_received,
	il.quantity_invoiced,
	il.extension,
	p.name as item_name,
	w.warehouse_name,
	a.full_account_number
from ap_invoice_history_detail il
left join {{ref('ci_item')}} p using(sku)
left join {{ref('im_warehouse')}} w using(warehouse_code)
left join {{ref('gl_account')}} a on a.id = il.account_key