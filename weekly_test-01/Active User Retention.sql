SELECT 
  EXTRACT(MONTH FROM event_date) as month,
  COUNT(DISTINCT user_id) as monthly_active_users
FROM user_actions
where user_id in(
select DISTINCT(user_id) 
from user_actions
where event_date>='2022-06-01' 
and event_date<'2022-07-01'
)
and event_date>='2022-07-01' 
and event_date<'2022-08-01'
group by EXTRACT(MONTH from event_date)
;
