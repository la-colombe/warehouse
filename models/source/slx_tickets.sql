select
t.ticketid as ticket_id, 
t.accountid as account_id, 
t.createdate as created_at,
area,
category,
issue,
subject,
tp.notes as problem_notes, 
ts.notes as solution_notes
from sysdba.ticket t
left join sysdba.ticketproblem tp on tp.ticketid = t.ticketid
left join sysdba.ticketsolution ts on ts.ticketid = t.ticketid