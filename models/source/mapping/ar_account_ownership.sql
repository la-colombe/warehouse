select 
    udf_sls_ccr_am_code as owner_id,
    udf_name as user_name

from {{source('sage','ar_udt_sls_ccr_am')}}