select
  case deposittype
    when 'C' then
      case left(checkno,3)
        when 'ACH' THEN 'ACH'
        else 'Check'
        end
    when 'R' then 'Credit Card'
    else 'Other'
  end as deposit_type,
  depositdate::date as deposit_date,
  depositno as deposit_number,
  sequenceno as line_number,
  customerno as customer_code,
  postingdate::date as posting_date,
  invoiceno as invoice_number,
  invoicetype as invoice_type,
  cashamountapplied as cash_amount_applied,
  discountamountapplied as discount_amount_applied,
  invoicebalance as invoice_balance
from dbo.ar_cashreceiptshistory
order by posting_date desc