select
entryno as entry_number,
userupdatedkey as user_id,

postingdate as posting_date,

journalcomment as comment,
sourcejournal as source_journal

from saleslogix.gl_generaljournalhistory h