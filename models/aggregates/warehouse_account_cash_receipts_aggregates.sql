select
customer_code,
max(posting_date) as most_recent_payment_date
from {{ref('warehouse_base_cash_receipts')}}
group by 1