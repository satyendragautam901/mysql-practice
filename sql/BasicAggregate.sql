create database joins;
use joins;



show tables;

select * from employees;
select * from departments;
select * from projects;

-- total number of employee in each department
select D.department_name, count(E.employee_id) as total_employees from departments as D
inner join employees as E on E.department_id = D.department_id group by D.department_id;

-- department with max number of employees
select D.department_name, count(E.employee_id) as total_employees from departments as D
inner join employees as E on E.department_id = D.department_id group by D.department_id limit 1;

-- find total number of project
select count(*) as total_project from projects;



