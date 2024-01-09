with transaction_side as (

  select
      t.source_code as transaction_source_code,
      t.transaction_date,
      c.fyear as transactionyear,
      c.fperiod as transactionperiod,
      -- i.productline, removed product line grouping for aura on 10/9
      i.inventory_gl_id as current_inventory_account_key,
      ai.full_account_number as current_inventory_account,
      ai.full_account_name as current_inventory_account_desc,
      sum(t.extended_cost) as total_extension_cost

  from {{ref('im_item_transactions')}} t
    join {{ref('ci_item')}} i using (sku)
    join {{ref('gl_account')}} ai on i.inventory_gl_id = ai.id
    join analytics_finance.finance_calendar c on t.transaction_date = c.date
  where c.fyear >= 2023
  group by 1, 2, 3, 4, 5, 6, 7
  ),

     gl_side as (

       select
           g.source_code as gl_source_code,
           a.id as accountkey,
           a.full_account_number,
           a.full_account_name,
           a.account_type_desc,
           g.posting_date,
           c.fyear as postingyear,
           c.fperiod as postingperiod,
           --g.postingcomment,
           sum(g.debit) as debit_sum,     --g.debitamount,
           sum(g.credit) as credit_sum,   --g.creditamount,
           debit_sum - credit_sum as net_amount --g.debitamount - g.creditamount


       from {{ref('gl_entry_detail')}} g
         join {{ref('gl_account')}} a on g.account_id = a.id
         join analytics_finance.finance_calendar c on g.posting_date = c.date
       where a.account_type_desc = 'Inventory'
         and c.fyear >= 2023
       group by 1, 2, 3, 4, 5, 6, 7, 8

       )

select
  t.transaction_source_code,
  t.transaction_date,
  t.transactionperiod,
  t.transactionyear,
  t.current_inventory_account_key,
  t.current_inventory_account,
  t.current_inventory_account_desc,
  t.total_extension_cost,
  null as table_split,
  g.gl_source_code,
  g.accountkey,
  g.full_account_number,
  g.full_account_name,
  g.account_type_desc,
  g.posting_date,
  g.postingperiod,
  g.postingyear,
  debit_sum,
  credit_sum,
  net_amount,
  case
    when t.transaction_source_code is null then 'GL Side Only'
    when g.gl_source_code is null then 'Transaction Side Only'
    when total_extension_cost != net_amount then 'Value Mismatch'
    else 'On both and equal'
    end as match_status
from transaction_side t
  full outer join gl_side g
                  on t.transaction_source_code = g.gl_source_code
                    and t.current_inventory_account = g.full_account_number