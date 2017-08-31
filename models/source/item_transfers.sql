select
entryno as entry_number,
itemcode as sku,
warehousecode as warehouse_code,
referencedate as sent_date,
transactionqty as transaction_quantity
from dbo.im_itemtransactionhistory t
where transactioncode = 'IT'