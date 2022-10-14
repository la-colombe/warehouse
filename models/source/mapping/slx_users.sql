select distinct

	userid as user_id,
    firstname as first_name,
    lastname as last_name,
    username as full_name,
    title

from {{source('sysdba','userinfo')}}