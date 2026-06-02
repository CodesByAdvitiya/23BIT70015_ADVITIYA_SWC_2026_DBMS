select f1.date, count(f2.action)/count(f1.action)::decimal as percentage_acceptance 
from fb_friend_requests as f1
left join fb_friend_requests as f2
on f1.user_id_sender = f2.user_id_sender
and f1.user_id_receiver = f1.user_id_receiver
and f2.action = 'accepted'
where f1.action = 'sent'
group by f1.date
