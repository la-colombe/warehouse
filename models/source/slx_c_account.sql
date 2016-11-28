select distinct

accountid as account_id,
accountmanagerid2 as primary_account_manager_id,
accountmanagerid3 as secondary_account_manager_id,
call_frequency,
customertype as customer_type,
newminvol as min_vol,
newtier as new_tier

from saleslogix.c_account 