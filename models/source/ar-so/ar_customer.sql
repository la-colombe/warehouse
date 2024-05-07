select 

customerno as customer_code,
ardivisionno as division_code,
customername as name,
nullif(customertype,'') as group_code,
agingcategory1 as overdue_balance_30_day,
agingcategory2 as overdue_balance_60_day,
agingcategory3 as overdue_balance_90_day,
agingcategory4 as overdue_balance_120_day,
avgdaysoverdue as average_days_overdue,
currentbalance as current_balance,
c.udf_machine_value as min_avg_weekly_core_rev,
t.payment_terms,
t.days_until_payment_due,
avgdayspaymentinvoice as average_days_to_payment,
udf_sent_to_collections as sent_to_collections,
case udf_sent_to_collections_date 
	when '1753-01-01' then null
	else udf_sent_to_collections_date::date
end as sent_to_collections_date,
case datecreated
	when '1753-01-01' then null
	else datecreated::date
end as created_date,
DECODE(credithold, 'N', '0','Y', '1')::integer::boolean as credit_hold,
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
primaryshiptocode as primary_ship_to,
taxschedule as tax,
pricelevel as price_tier,
sortfield as ar_bucket,
ct.segment,
ct.customer_type,
case customerstatus
  when 'A' then 'Active'
  when 'I' then 'Inactive'
end as closed_status,
udf_business_category as business_type,
c.udf_invoice_method as invoice_method_code,
im.invoice_method,

udf_salesperson as sales_rep_mas_id,
sr.user_name as sales_rep,
udf_cocreator as secondary_sales_rep_mas_id,
ssr.user_name as secondary_sales_rep,
udf_account_manager as account_manager_mas_id,
am.user_name as account_manager,

nvl(DECODE(udf_ownership_01,
             'Y', '1',
             'N', '0' ),'0')::integer::boolean as diversity_bipoc_owned,
nvl(DECODE(udf_ownership_02,
             'Y', '1',
             'N', '0' ),'0')::integer::boolean as diversity_woman_owned,
nvl(DECODE(udf_ownership_03,
             'Y', '1',
             'N', '0' ),'0')::integer::boolean as diversity_lgbtq_owned,
nvl(DECODE(udf_ownership_04,
             'Y', '1',
             'N', '0' ),'0')::integer::boolean as diversity_veteran_owned,
nvl(DECODE(udf_ownership_05,
             'Y', '1',
             'N', '0' ),'0')::integer::boolean as diversity_disability_owned,

c.comment,
c.contactcode as contact_code,
c.udf_property_id as property_id


from {{source('sage','ar_customer')}} c
left join {{ref('ar_terms')}} t on c.termscode = t.terms_code
left join {{ref('ar_account_ownership')}} sr on c.udf_salesperson = sr.owner_id
left join {{ref('ar_account_ownership')}} ssr on c.udf_cocreator = ssr.owner_id
left join {{ref('ar_account_ownership')}} am on c.udf_account_manager = am.owner_id
left join {{ref('ar_udt_customer_type')}} ct on c.udf_customer_type = ct.udf_customer_type_code
left join {{ref('ar_invoice_method')}} im on c.udf_invoice_method = im.invoice_method_code