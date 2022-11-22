select 

  ar_division_no,
  customer_code,
  invoice_number,
  invoice_type,
  header_number,
  transaction_date,
  payment_date,
  line_number,
  check_number,
  transaction_type,
  payment_type,
  transaction_amount,
  updated_at

from {{ref('ar_transaction_payment_history')}}