select
  bankcode as bank_code,
  checkno as check_number,
  checkseqno as check_sequence_number,
  checktype as check_type,
  sourcejournal as source_journal,
  checkcomment as check_comment,
  case checkdate
	  when '1753-01-01' then null
	  else checkdate::date
  end as check_date,
  case transactiondate
	  when '1753-01-01' then null
	  else transactiondate::date
  end as check_transaction_date,
  apdivisionno as division,
  vendorno as vendor_number,
  checkamt as check_amount,
  datecreated + (nullif(timecreated, '')::DECIMAL(7,5) || ' hours')::interval as created_at,
  cu.full_name as created_by,
  dateupdated + (nullif(timeupdated, '')::DECIMAL(7,5) || ' hours')::interval as updated_at,
  uu.full_name as updated_by
from {{source('sage','ap_checkhistoryheader')}} ch
left join {{ref('sy_user')}} cu on cu.user_key = usercreatedkey
left join {{ref('sy_user')}} uu on uu.user_key =userupdatedkey