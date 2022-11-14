# Read Me file for Module 7

## Overview

This assignment uses SQL to build a handful of databases to use in an analysis.

## Files

## Output

## Part 1

### cards with multiple $2 or less spend
I isolated the credit cards using the following code
<pre><code>
select card, count(amount) AS Transaction_count
from transaction
where amount<2
group by  card
order by Transaction_count DESC
</code></pre>

![number of $2 trasnactions](images/cards%202d%20trans.png)


This query counts the transactions above $2 and groups them by credit card. 

The output makes it uncertain if a credit card has been hacked. The most number of transactions over $2 in the data set is 13. This would equate to, at most, $26 dollars, a low value to hack a credit card for. However, this could be something we would want to monitor.

### top 100 transactions made between 7AM and 9AM 
This outputs the top 100 transactions made between 7AM and 9AM 
<pre><code>
select card, amount, date, cast(date as time)
from transaction
where cast(date as time) between '07:00:00' AND '09:00:00'
order by amount DESC
limit 100;
</code></pre>
Based on this query, there are nine large transactions that seem out of pattern with the rest of the purchases. These nine could be fraud
![top 100 largest trans](/images/top%20100%20trans.png)

### Top 5 merchants with a high number of $2 or fewer transactions
The top 5 merchants with small transactions are created below

<pre><code>
select   m.name, count(t.amount) as "COUNT_lessthan_two"
from transaction t
left join merchant m on t.id_merchant = m.id
where t.amount <2
group by m.name
order by count(t.amount) desc
limit 5;
</code></pre>
![top 5 merchants](/images/top%20five%20merch%20less%20than%202.png)


## Part 2

In part 2 we look at linking python and SQL.

cardholder #2 and #18 were questioned. It looks like there is a possibility of fraud in cardholder 18. There are several significant outliers, but it could also indicate a spending patern
![top 5 merchants](/images/bokeh_plot_both_card_holders.png)


The average transaction is very small, with the outliers significantly outside the box. It is interesting that in February, there was no outside transaction. This could have led the CEO to notice the spending change and question their card's security. 
![top 5 merchants](/images/bokeh_plot_cardholder_25.png)