select
  deposit_type,
  deposit_date,
  deposit_number,
  line_number,
  customer_code,
  posting_date,
  invoice_number,
  invoice_type,
  cash_amount_applied,
  discount_amount_applied,
  invoice_balance
from {{ref('ar_cash_receipts_history')}}