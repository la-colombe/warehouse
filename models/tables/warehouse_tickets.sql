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
account_ticket_number


from {{ref('warehouse_base_tickets')}}