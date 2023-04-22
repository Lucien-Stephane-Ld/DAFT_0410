USE lab_20;

drop table cars;
drop table customers;
drop table invoices;
drop table salesperson;


CREATE TABLE cars(
id int,
car_id VARCHAR(20) primary key,
manufactor VARCHAR(20),
model VARCHAR(20),
car_year VARCHAR(4),
color VARCHAR(10)
);


create table salesperson(
id int,
salesperson_id int(10) primary key,
f_name VARCHAR (30),
store VARCHAR(20)
);

drop table invoices;

create table invoices(
id int,
invoice_id int(10) primary key,
sales_date datetime,
car_id int,
customer_id int(10),
salesperson_id int(10)
);


create table customers(
id int,
customer_id int(10) primary key,
f_name VARCHAR (30),
phone VARCHAR (20),
email VARCHAR (30),
address VARCHAR (30),
city VARCHAR (30),
state VARCHAR (30),
country VARCHAR (30),
zip_code VARCHAR (30)
);



