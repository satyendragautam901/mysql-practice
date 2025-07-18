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
city varchar(50),
money int
);


INSERT INTO customer(customer_id, customer, payment_mode, city, money) VALUES
(121, 'Ramu', 'Net Banking', 'Delhi',10),
(122, 'Sita', 'Credit Card', 'Mumbai',50),
(123, 'Karan', 'Debit Card', 'Bangalore',60),
(124, 'Priya', 'PayPal', 'Chennai',10),
(125, 'Amit', 'Net Banking', 'Kolkata',30),
(126, 'Neha', 'Cash', 'Hyderabad',90),
(127, 'Raj', 'Credit Card', 'Pune',50),
(128, 'Ravi', 'Debit Card', 'Ahmedabad',70),
(129, 'Meera', 'PayPal', 'Lucknow',150),
(130, 'Vikram', 'Net Banking', 'Jaipur',200);

INSERT INTO customer(customer_id, customer, payment_mode, city, money) VALUES
(131, 'Ramu', 'Net Banking', 'Delhi',50);

drop table customer;
-- based on customer table here are practise

-- customer name who use netbanking
select customer, payment_mode from customer where payment_mode ="Net Banking";

-- customer who spend more than 50
select customer from customer where (money)>=50;



-- basic operation on this table
select * from customer;

-- find number of customer on each city
select city, count(*) as Customers from customer group by city;

-- customer whose city ends with 'D'
select customer, city from customer where city like '%D';

-- customer whose city starts with 'D'
select customer, city from customer where city like 'D%';

-- sort all the customer according to money in decreasing way
select customer, money from customer order by money desc;

-- find total money collected from all customers
select sum(money) as total_money from customer;

-- find total payment according to each payment method
select count(*), payment_mode as mode from customer group by payment_mode;

-- pracatise joins

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create projects table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) on delete cascade on update cascade
);

drop table projects;

-- Insert sample data into departments
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales');

-- Insert sample data into employees
INSERT INTO employees (employee_id, first_name, last_name, department_id)
VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Alice', 'Brown', 3),
(4, 'Bob', 'Johnson', 1),
(5, 'Charlie', 'Davis', NULL);

-- Insert sample data into projects
INSERT INTO projects (project_id, project_name, employee_id)
VALUES
(101, 'Project A', 1),
(102, 'Project B', 1),
(103, 'Project C', 2),
(104, 'Project D', 3),
(105, 'Project E', 6);

show tables;


