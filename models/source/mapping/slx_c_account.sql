select distinct

accountid as account_id,
accountmanagerid2 as sales_rep_id,
accountmanagerid3 as secondary_sales_rep_id,
call_frequency,
customertype as group_code,
newminvol as min_vol,
newtier as new_tier

from sysdba.c_account 