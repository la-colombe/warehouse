select
  invoice_number,
  sum(delivery_charge) as delivery_charge,
  sum(total_weight) as invoice_weight_total,
  sum(number_of_packages) as invoice_packages_total
from {{ref('starship_shipments')}}
group by 1