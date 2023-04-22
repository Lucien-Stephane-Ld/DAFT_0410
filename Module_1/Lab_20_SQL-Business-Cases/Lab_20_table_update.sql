use lab_20;

/* SALESPERSON */

update salesperson
set store = 'Miami'
where salesperson_id = 5;



/* CUSTOMERS */

update customers
set email = 'ppicasso@gmail.com'
where customer_id = 10001;

update customers
set email = 'lincoln@us.gov'
where customer_id = 20001;

update customers
set email = 'hello@napoleon.me'
where customer_id = 30001;



/* CARS */

-- Noticed the error earlier on, updated the VIN while inserting values

