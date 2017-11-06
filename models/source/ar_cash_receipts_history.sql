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
  case depositdate 
    when '1753-01-01' then null
    else depositdate::date
  end as deposit_date, 
  depositno as deposit_number,
  sequenceno as line_number,
  customerno as customer_code,
  case postingdate 
    when '1753-01-01' then null
    else postingdate::date
  end as posting_date, 
  invoiceno as invoice_number,
  invoicetype as invoice_type,
  cashamountapplied as cash_amount_applied,
  discountamountapplied as discount_amount_applied,
  invoicebalance as invoice_balance,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by,
dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
uu.full_name as updated_by
from dbo.ar_cashreceiptshistory
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key = userupdatedkey
