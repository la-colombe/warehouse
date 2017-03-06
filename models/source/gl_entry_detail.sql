select
md5('lct' || journalregisterno || sequenceno) as unique_journal_id,
journalregisterno as journal_entry_number,
sequenceno as line_item_id,
accountkey as account_id,
usercreatedkey as user_id,

datecreated as create_date,
postingdate as posting_date,

creditamount as credit,
debitamount as debit,

postingcomment as comment,
sourcejournal as source_journal,
sourcemodule as source_module

from dbo.gl_detailposting