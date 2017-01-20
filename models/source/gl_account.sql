select

accountkey as id,
account as full_account_number,


datecreated as create_date,

accountdesc as name,
t.accounttypedesc as type,
g.accountgroupdesc as group,
c.accountcategorydesc as category,


mainaccountcode as main_account_code,
a.accountgroup as group_code,
a.accountcategory as category_code,
a.accounttype as type_code

from dbo.gl_account a
left join dbo.gl_accounttype t on t.accountcategory = a.accountcategory and t.accounttype = a.accounttype
left join dbo.gl_accountgroup g on g.accountcategory = a.accountcategory and g.accounttype = a.accounttype and g.accountgroup = a.accountgroup
left join dbo.gl_accountcategory c on c.accountcategory = a.accountcategory