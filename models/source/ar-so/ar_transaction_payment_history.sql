select 

  ardivisionno as ar_division_no,
  customerno as customer_code,
  invoiceno as invoice_number,
  invoicetype as invoice_type,
  invoicehistoryheaderseqno as header_number,
  case transactiondate
    when '1753-01-01' then null
    else transactiondate::date
  end as transaction_date,
  case paymentdate 
    when '1753-01-01' then null
    else paymentdate::date
  end as payment_date,
  sequenceno as line_number,
  checkno as check_number,
  transactiontype as transaction_type,
  paymenttype as payment_type,
  transactionamt as transaction_amount,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at

from {{source('sage','ar_transactionpaymenthistory')}}