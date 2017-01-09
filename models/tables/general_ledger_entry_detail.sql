select

entry_number,
line_item_id,
account_id,

detail_create_date,
detail_posting_date,

credit,
debit,

detail_comment,
source_journal,
source_module,

full_account_number,
full_account_name,
account_type,
account_group,
account_category,

split_part(full_account_number, '-', 1) as account_code, 
split_part(full_account_number, '-', 2) as cost_center_code, 
split_part(full_account_number, '-', 3) as division_code

from {{ref('general_ledger_base_entry_detail')}}