select distinct

trim(account) as name,
coalesce(accountid, '') as account_id,
createdate as created_at,
coalesce(division, '') as division,
coalesce(accountmanagerid, '') as primary_account_manager_id,
accountmanager as primary_account_manager_name,
coalesce(regionalmanagerid, '') as regional_manager_id,
coalesce(divisionalmanagerid, '') as divisional_manager_id

from {{source('sysdba','account')}}