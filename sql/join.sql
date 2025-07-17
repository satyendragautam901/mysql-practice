create database joins;
use joins;

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
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert sample data into departments
INSERT INTO departments (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales');

INSERT INTO departments (department_id, department_name)
VALUES
(5, 'Health');

-- Insert sample data into employees
INSERT INTO employees (employee_id, first_name, last_name, department_id)
VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Alice', 'Brown', 3),
(4, 'Bob', 'Johnson', 1),
(5, 'Charlie', 'Davis', NULL);

INSERT INTO employees (employee_id, first_name, last_name, department_id)
VALUES (6, 'Eve', 'Miller', 4);

-- Insert sample data into projects
INSERT INTO projects (project_id, project_name, employee_id)
VALUES
(101, 'Project A', 1),
(102, 'Project B', 1),
(103, 'Project C', 2),
(104, 'Project D', 3),
(105, 'Project E', 6);

INSERT INTO projects (project_id, project_name, employee_id)
VALUES
(106, 'Project A', 2);

show tables;

select * from employees;
select * from departments;
select * from projects;

-- Returns only the rows that have matching values in both tables (Inner join)

-- retrieve the name of name of each employee with their department name
select E.first_name, E.last_name, D.department_name from employees as E inner join departments as D on E.department_id = D.department_id;

-- get the name of employee and their respective project name
select E.first_name, P.project_name from employees as E inner join projects as P on E.employee_id = P.employee_id;

-- count number of employee working on each project
select project_name , count(*) as employees from projects group by project_name;

-- inner join
-- employee who have department id
select E.first_name , D.department_name from employees as E inner join departments as D on E.department_id = D.department_id;

-- left join
-- employee even who don't have department id
select E.first_name , D.department_name from employees as E left join departments as D on E.department_id = D.department_id;

-- left join with exclusive(only who don't have department id)
select E.first_name , D.department_name from employees as E left join departments as D on E.department_id = D.department_id where d.department_id is null;

-- right join
-- list all the department even they don't have employee
select D.department_name, E.first_name from employees as E right
 join departments as D  on D.department_id = E.department_id;

-- right join with exclusive(who don't have employee)
select D.department_name, E.first_name from employees as E right
 join departments as D  on D.department_id = E.department_id where E.department_id is null;
 
 -- full join
-- list all the employee name and department name even they don't have employee or department
select D.department_name, E.first_name from employees as E left
 join departments as D  on D.department_id = E.department_id
 union
 select D.department_name, E.first_name from employees as E right
 join departments as D  on D.department_id = E.department_id;
 
 -- cross join
 -- find in howmany department a employee can work 
 select E.first_name, E.last_name , D.department_name from employees as E cross join departments as D;
 
 
 
 
 


