select

entry_number,
line_item_id,
account_id,

detail_create_date,
detail_posting_date,
entry_posting_date,


credit,
debit,

detail_comment,
entry_comment,
source_journal,
source_module,

account_number,
account_name,
account_type,
account_group,
account_category,

main_account_code,
group_code,
category_code,
type_code

from {{ref('general_ledger_base_entry_detail')}}