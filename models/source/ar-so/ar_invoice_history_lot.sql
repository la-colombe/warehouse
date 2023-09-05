select 
	   
	   l.invoiceno as invoice,
       l.headerseqno,
       l.detailseqno,
       l.lotserialno as lot_number,
       l.tiertype,
       l.quantityshipped as quantity_shipped,
       case l.lotserialexpirationdate 
	     when '1753-01-01' then null
	     else l.lotserialexpirationdate::date
	   end as lot_expiration_date
        

from {{source('sage','ar_invoicehistorylotserial')}} l