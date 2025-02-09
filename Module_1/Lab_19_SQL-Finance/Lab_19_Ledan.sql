
use olist;

-- 1. From the order_items table, find the price of the highest priced order and lowest price order.

select max(price) as 'Max price', min(price) as 'Min price' from olist.order_items;

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?

select datediff(max(shipping_limit_date),min(shipping_limit_date)) as 'Date difference'
from olist.order_items;

-- 3. From the customers table, find the states with the greatest number of customers.

select customer_state, count(customer_unique_id)
from olist.customers
group by customer_state
order by count(customer_unique_id) desc
limit 10;

-- 4. From the customers table, within the state with the greatest number of customers,
-- find the cities with the greatest number of customers.

select distinct customer_city as 'City with most customers', count(customer_id)
from olist.customers
where customer_state = 'TO'
group by customer_city
order by count(customer_id) desc
limit 10
;

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?

select business_segment, count(distinct business_segment) as 'Business Segments'
FROM olist.closed_deals
WHERE business_segment IS NOT NULL
group by business_segment
order by count(business_segment) desc
;

-- 6. From the closed_deals table, 
-- sum the declared_monthly_revenue
-- for duplicate row values in business_segment
-- and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).

select business_segment , sum(declared_monthly_revenue)
from olist.closed_deals
group by business_segment
order by sum(declared_monthly_revenue) desc
;

-- 7. From the order_reviews table,    find the total number of     distinct review score     values.

select distinct count(review_score)
from olist.order_reviews
;

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5,
-- then find the review score and category occurring most frequently in the table.

select review_score,
        case when review_score = 1 then "Lame"
             when review_score = 2 then "Meh"
             when review_score = 3 then "Okay"
             when review_score = 4 then "Good"
             else "Great"
        end as review_score_category 
from olist.order_reviews
group by review_score
order by review_score desc;


-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.

select review_score,  count(review_id)
from olist.order_reviews
group by review_score
order by review_score desc
;