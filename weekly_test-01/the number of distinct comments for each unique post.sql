CREATE TABLE Submissions (
    sub_id INT,
    parent_id INT
);

INSERT INTO Submissions (sub_id, parent_id) VALUES 
(1, NULL),
(2, NULL),
(1, NULL),
(12, NULL),
(3, 1),
(5, 2),
(3, 1),
(4, 1),
(9, 1),
(10, 2),
(6, 7);

select p.sub_id as post_id,count(distinct c.sub_id) as number_of_comments
from (
select distinct sub_id
from submissions where parent_id is null
) as p
left join(
select distinct sub_id,parent_id
from submissions
where parent_id is not null
) as c
on p.sub_id=c.parent_id
group by p.sub_id
order by p.sub_id;
