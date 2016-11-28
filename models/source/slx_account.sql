select distinct

account as name,
coalesce(accountid, '') as account_id,
createdate as created_at,
coalesce(division, '') as division,
coalesce(accountmanagerid, '') as sales_rep_id,
coalesce(regionalmanagerid, '') as regional_manager_id,
coalesce(divisionalmanagerid, '') as divisional_manager_id

from saleslogix.account