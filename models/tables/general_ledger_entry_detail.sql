select

d.journal_entry_number as entry_number,
d.line_item_id,
d.account_id,

d.posting_date as detail_posting_date,

d.credit,
d.debit,

d.comment as detail_comment,
d.source_journal,
d.source_module,

a.full_account_number,
a.name as full_account_name,
a.type as account_type,
a.group as account_group,
a.category as account_category,

split_part(a.full_account_number, '-', 1) as account_code, 
split_part(a.full_account_number, '-', 2) as cost_center_code, 
split_part(a.full_account_number, '-', 3) as division_code,
d.created_at,
d.created_by

from {{ref('gl_entry_detail')}} d
left join {{ref('gl_account')}} a on a.id = d.account_id