select
ari.invoice,
MAX(ari.posting_date) as posting_date,
SUM(ari.balance) as balance

from {{ref('ar_invoices')}} ari
group by 1