select

	   l.invoice,
       l.headerseqno,
       l.detailseqno,
       l.lot_number,
       l.tiertype,
       l.quantity_shipped,
       l.lot_expiration_date 

from {{ref('ar_invoice_history_lot')}} l