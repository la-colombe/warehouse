select distinct

accountid as account_id,
accountmanagerid2 as sales_rep_id,
creator as sales_rep_name,
accountmanagerid3 as secondary_sales_rep_id,
co_creator as secondary_sales_rep_name,
call_frequency,
customertype as group_code,
newminvol as min_vol,
newtier as new_tier

from {{source('sysdba','c_account')}}