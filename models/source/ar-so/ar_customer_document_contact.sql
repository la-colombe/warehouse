select

  customerno as customer_code,
  document,
  toadditionalemailaddress as email,
  case datecreated
	  when '1753-01-01' then null
	  else datecreated::date
  end as created_date

from dbo.ar_customerdocumentcontacts