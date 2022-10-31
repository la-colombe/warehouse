with assetonly as
(select accountid,
count(aa.accountid) as asset_rows

from {{source('sysdba','dl_acct_ref')}} dl
left join {{source('sysdba','accountasset')}} aa using(accountid)
group by 1
having asset_rows >= 1)

select distinct
acct_id as customer_code,
accountid as account_id,
acct_division as division,
comp_code as company_code

from {{source('sysdba','dl_acct_ref')}} dl
    join assetonly ao using(accountid)