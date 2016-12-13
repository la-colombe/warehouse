select

entry_number,
posting_date,
comment,
source_journal

from {{ref('gl_entry')}}
