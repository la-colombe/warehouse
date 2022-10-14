select distinct

acct_id as customer_code,
max(accountid) as account_id,
max(acct_division) as division,
max(comp_code) as company_code

from {{source('sysdba','dl_acct_ref')}} dl
group by 1