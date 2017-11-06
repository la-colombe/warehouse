select

d.journal_entry_number as entry_number,
d.line_item_id,
d.account_id,

d.posting_date as detail_posting_date,
--e.posting_date as entry_posting_date,


d.credit,
d.debit,

d.comment as detail_comment,
--e.comment as entry_comment,
d.source_journal,
d.source_module,

a.full_account_number,
a.name as full_account_name,
a.type as account_type,
a.group as account_group,
a.category as account_category,

a.main_account_code,
a.group_code,
a.category_code,
a.type_code,
d.created_at,
d.created_by

from {{ref('gl_entry_detail')}} d
left join {{ref('general_ledger_base_accounts')}} a on a.id = d.account_id