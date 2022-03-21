select 

	a.customer_code, 
	count(case when a.invested_value > 0 then a.customer_code end) as invested_machines,
	sum(a.value) as total_value, 
	sum(a.invested_value) as total_invested_value, 
	sum(a.value) - sum(a.invested_value) as total_customer_owned_value,


	--Minimum weekly sales is partially dependent on the invested value. 
	--Only assets purchased in the last 2 fiscal years count towards that value. 
	sum(
		case 
			when
				a.date_purchased is null or 								--NULL values for purchase date are included 
				(now.fyear = f.fyear) or 										--This fiscal year
        (now.fyear - 1 = f.fyear) or 								--Last fiscal year
        (now.fyear - 2 = f.fyear and not f.is_ytd) 	--Two fiscal years ago
      then a.invested_value
		end) as invested_value_last_2_years

from  {{ref('warehouse_assets')}} a
left join analytics_finance.finance_calendar f on date(a.date_purchased) = f.date
join analytics_finance.finance_calendar now on current_date = now.date
group by customer_code
