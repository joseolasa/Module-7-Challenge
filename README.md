# Read Me fild for Module 7

## Overview

This assignment uses SQL to build a handfull of databases to then use in an analysis

## Files

## Output

### Part 1

I isolated the credit cards using the following code

select card, count(amount) AS Transaction_count
from transaction
where amount<2
group by  card
order by Transaction_count DESC

this counts the transactions above $2 and groups it by credit card

based on the output it is uncertain if a credit card has been hacked. The most number of transactions over $2 in the data set is 13. This would equate to at most $26 dollars, a low value to hack a credit card for. However this could be something we would want to moniter.


This ouputs the top 100 transactions made between 7AM and 9AM 

select card, amount, date, cast(date as time)
from transaction
where cast(date as time) between '07:00:00' AND '09:00:00'
order by amount DESC
limit 100;

Baed on the this query, there are a ~9 large transactions that that seem out of pattern with the rest of the purchasres. These 9 could be fraud



The top 5 merchants with small trans actions are created below

select   m.name, count(t.amount) as "COUNT_lessthan_two"
from transaction t
left join merchant m on t.id_merchant = m.id
where t.amount <2
group by m.name
order by count(t.amount) desc
limit 5;

