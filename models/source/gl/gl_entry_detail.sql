select
md5('lct' || journalregisterno || sequenceno) as unique_journal_id,
journalregisterno as journal_entry_number,
sourcejournal + '-' + journalregisterno as source_code,
sequenceno as line_item_id,
accountkey as account_id,
case postingdate 
	when '1753-01-01' then null
	else postingdate::date
end as posting_date, 

creditamount as credit,
debitamount as debit,

postingcomment as comment,
sourcejournal as source_journal,
sourcemodule as source_module,
datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
cu.full_name as created_by


from {{source('sage','gl_detailposting')}}
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
