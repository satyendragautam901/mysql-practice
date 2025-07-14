-- create database Employee;
-- drop database Employee;

-- use Employee;

-- create table if not exists employee(
-- emp_id int primary key,
-- name varchar(50),
-- salary int
-- );

-- insert into employee values(1,"Rohan", 15000);
-- insert into employee(emp_id, name, salary) values
-- (2,"Vipin",10000),
-- (3,"Vikas",1000);

-- create database for customer and perform operation on them 

create database Order_db;
use Order_db;

create table customer(
customer_id int primary key,
customer varchar(50) not null,
payment_mode varchar(20)  not null,
city varchar(50)
);


INSERT INTO customer(customer_id, customer, payment_mode, city) VALUES
(121, 'Ramu', 'Net Banking', 'Delhi'),
(122, 'Sita', 'Credit Card', 'Mumbai'),
(123, 'Karan', 'Debit Card', 'Bangalore'),
(124, 'Priya', 'PayPal', 'Chennai'),
(125, 'Amit', 'Net Banking', 'Kolkata'),
(126, 'Neha', 'Cash', 'Hyderabad'),
(127, 'Raj', 'Credit Card', 'Pune'),
(128, 'Ravi', 'Debit Card', 'Ahmedabad'),
(129, 'Meera', 'PayPal', 'Lucknow'),
(130, 'Vikram', 'Net Banking', 'Jaipur');

-- find total payment according to each payment method
select count(*), payment_mode as mode from customer group by payment_mode;

