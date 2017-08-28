select 

customerno as customer_code,
agingcategory1 as overdue_balance_30_day,
agingcategory2 as overdue_balance_60_day,
agingcategory3 as overdue_balance_90_day,
agingcategory4 as overdue_balance_120_day,
avgdaysoverdue as average_days_overdue,
currentbalance as current_balance,
case 
	when termscodedesc is null then c.termscode
	else termscodedesc
end as payment_terms,
avgdayspaymentinvoice as average_days_to_payment,
udf_sent_to_collections as sent_to_collections,
addressline1 as address_line_1,
case
	when addressline3 is not null then addressline2 || ' ' || addressline3
	else addressline2
end as address_line_2,
city,
emailaddress as email,
telephoneno as phone,
state,
coalesce(countrycode, 'USA') as country,
zipcode as zip,
taxschedule as tax,
pricelevel as price_tier

from dbo.ar_customer c
left join dbo.ar_termscode t on c.termscode = t.termscode