select count(*) AS payment_count
from transactions t1
where exists (
    select *
    from transactions t2
    where t2.merchant_id = t1.merchant_id
      and t2.credit_card_id = t1.credit_card_id
      and t2.amount = t1.amount
      and t2.transaction_timestamp < t1.transaction_timestamp
      and t1.transaction_timestamp - t2.transaction_timestamp <= interval '10 minutes'
);
-- select * from TRANSACTIONs
