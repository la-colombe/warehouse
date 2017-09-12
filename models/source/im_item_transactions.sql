select
entryno as entry_number,
customerno as customer_code,
itemcode as sku,
warehousecode as warehouse_code,
transactiondate as transaction_date,
referencedate as sent_date,
transactionqty as transaction_quantity,
transactioncode as transaction_type
from dbo.im_itemtransactionhistory t