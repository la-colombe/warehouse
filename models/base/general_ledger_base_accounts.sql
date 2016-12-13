select

id,
number,

create_date,

name,
type,
a.group,
category,

main_account_code,
group_code,
category_code,
type_code

from {{ref('gl_account')}} a