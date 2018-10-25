select
customer_code,
max(posting_date) as most_recent_payment_date
from {{ref('ar_cash_receipts_history')}}
group by 1