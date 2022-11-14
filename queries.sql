select card, count(amount) AS Transaction_count
from transaction
where amount<2
group by  card
order by Transaction_count DESC;

select card, amount, date, cast(date as time)
from transaction
where cast(date as time) between '07:00:00' AND '09:00:00'
order by amount DESC
limit 100;

select   m.name, count(t.amount) as "COUNT_lessthan_two"
from transaction t
left join merchant m on t.id_merchant = m.id
where t.amount <2
group by m.name
order by count(t.amount) desc
limit 5;