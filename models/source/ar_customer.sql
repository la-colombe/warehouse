select 

customerno as customer_code,
agingcategory1 as overdue_balance_30_day,
agingcategory2 as overdue_balance_60_day,
agingcategory3 as overdue_balance_90_day,
agingcategory4 as overdue_balance_120_day,
avgdaysoverdue as average_days_overdue,
currentbalance as current_balance

from saleslogix.ar_customer