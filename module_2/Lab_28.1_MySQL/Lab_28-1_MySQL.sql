use sakila;

/*
1. find the running total of rental payments for each customer in the payment table,
ordered by payment date.
By selecting the customer_id, payment_date, and amount columns from the payment table,
and then applying the SUM function to the amount column within each customer_id partition,
ordering by payment_date.
*/

select date_format(payment_date, '%Y-%m-%d' ) as date from payment;

select customer_id, date_format(payment_date, '%Y-%m-%d' ) as date, amount,
sum(amount) over (order by payment_date) as running_amount
from payment
;


/*
2.  find the rank and dense rank of each payment amount within each payment date
by selecting the payment_date and amount columns from the payment table, 
and then applying the RANK and DENSE_RANK functions to the amount column
within each payment_date partition, ordering by amount in descending order.
*/

select date_format(payment_date, '%Y-%m-%d' ) as date, amount,
rank() over (partition by payment_date order by amount desc) as rnk, 
dense_rank() over (partition by payment_date order by amount desc) as dense_rnk
from payment
;

select date(payment_date) as payment_date2, amount
, rank() over (partition by date(payment_date) order by amount desc) as rank_payment
, dense_rank() over (partition by date(payment_date) order by amount desc) as dense_rank_payment
from payment limit 50;

/*
3. find the ranking of each film based on its rental rate, within its respective category.
Hint: you need to extract the information from
film, film_category and category tables after applying join on them.
*/

select f.title, film_id, name,
rank() over (partition by category_id order by rental_rate) as rnk,
dense_rank() over (partition by category_id order by rental_rate) as dense_rnk
from film f
inner join film_category fc using (film_id) -- on a.au_id = ta.au_id
left join category using (category_id)
;

select * from category;

/*
4.(OPTIONAL) update the previous query from above to retrieve only the top 5 films within each category
*/

With john as
(
select f.title, film_id, name,
row_number() over (partition by category_id order by rental_rate ) as row_num,
rank() over (partition by category_id order by rental_rate) as rnk,
dense_rank() over (partition by category_id order by rental_rate) as dense_rnk
from film f
inner join film_category fc using (film_id)
left join category using (category_id)
)
select * from john
where row_num <= 5
;


/*
5. find the difference between the current and previous payment amount and
the difference between the current and next payment amount,
for each customer in the payment table

Hint: select the payment_id, customer_id, amount, and payment_date columns from the payment table,
and then applying the LAG and LEAD functions to the amount column,
partitioning by customer_id and ordering by payment_dat
*/

select payment_id, customer_id, date(payment_date) as date_of_payment,
amount - lag(amount) over (partition by customer_id order by payment_date) as lag_amount,
amount - lead(amount) over (partition by customer_id order by payment_date) as lead_amount
from payment;
