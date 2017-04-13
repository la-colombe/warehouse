select
ticket_id, 
customer_code,
created_at,
area,
category,
issue,
subject,
problem_notes, 
solution_notes,

rank() over (partition by customer_code order by created_at ASC) AS account_ticket_number


from {{ref('slx_tickets')}} t
left join {{ref('slx_account_ref')}} ar on ar.account_id = t.account_id