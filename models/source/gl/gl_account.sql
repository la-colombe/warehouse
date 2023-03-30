select

accountkey as id,
account as full_account_number,


datecreated as create_date,

accountdesc as full_account_name,
t.accounttypedesc as account_type_desc,
g.accountgroupdesc as account_group_desc,
c.accountcategorydesc as account_category_desc,


mainaccountcode as main_account_code,
a.accountgroup as account_group_code,
a.accountcategory as account_category_code,
a.accounttype as account_type_code

from {{source('sage','gl_account')}} a
left join {{source('sage','gl_accounttype')}} t on t.accountcategory = a.accountcategory and t.accounttype = a.accounttype
left join {{source('sage','gl_accountgroup')}} g on g.accountcategory = a.accountcategory and g.accounttype = a.accounttype and g.accountgroup = a.accountgroup
left join {{source('sage','gl_accountcategory')}} c on c.accountcategory = a.accountcategory