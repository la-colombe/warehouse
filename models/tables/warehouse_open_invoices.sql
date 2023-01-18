select 

  customer_code, 
  invoice_number, 
  header_number,
  invoice_type,
  invoice,
  invoice_date, 
  posting_date,
  balance,
  amount,
  comment,
  check_number,
  created_at,
  created_by,
  updated_at,
  updated_by

from {{ref('ar_open_invoices')}}

where balance != 0