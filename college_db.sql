-- create database 
create database college_database;

-- delete database 
-- drop database temp_db;

-- use command will let you use that named db
use college_database;

-- this will create a student table
-- drop table Student;

CREATE TABLE Student (
	rollnumber int primary key,
    stu_name varchar(50) not null,
    marks int not null,
    grade varchar(1), -- 'A' or 'B' etc
    city varchar(50)
);

-- insert data into this table
insert into Student(rollnumber,stu_name,marks,grade,city) values 
(1,"Ram Kumar",150,'A',"Kushinagar"),
(2,"Ram Kumar",100,'B',"Gorakhpur"),
(3,"Ram Kumar",150,'C',"Deoria")
;

-- insert multiple values at the same time

insert into Student values
(8,"Ramesh Kumar",65,'A',"Prayagraj"),
(9,"Ramesh Kumar",70,'A',"Lucknow"),
(10,"Ramesh Kumar",80,'A',"Kanpur");

INSERT INTO Student(rollnumber, stu_name, marks, grade, city) VALUES
(11, 'Priya', 78, 'B', 'Mumbai'),
(12, 'Ravi', 90, 'A', 'Bangalore'),
(13, 'Neha', 65, 'B', 'Kolkata'),
(14, 'Vikram', 88, 'A', 'Chennai'),
(15, 'Sanya', 92, 'A', 'Hyderabad'),
(16, 'Ravi', 72, 'B', 'Pune'),
(17, 'Amit', 81, 'A', 'Ahmedabad'),
(18, 'Meera', 77, 'B', 'Lucknow'),
(19, 'Karan', 95, 'A', 'Jaipur'),
(20, 'Simran', 84, 'A', 'Delhi');


-- select all the records from db
select * from Student;

-- where clause is like condition . in c++ as we use if just like it also checks
select * from Student where marks>60;

-- destinct will return only distinct record from the table
select  distinct Stu_name from Student;

-- limit will apply on when record is fetch from db
select * from Student limit 5;

-- in and not in 
select * from Student where city not in ("Gorakhpur", "Deoria");

-- between both values is inclusive
select * from Student where marks between 60 and 90;

-- order by used to arrange record during 
select * from Student where marks between 60 and 90 order by marks desc;

-- aggregate function , max, min, avg, count, sum etc.

select count(*) from Student; -- count all the record in that table
select max(marks) from student; -- return max marks in the table
select sum(marks) from student; -- return sum of all the marks

-- group by clause
-- select all the record based on city

select city, avg(marks) from Student group by city;

-- find number of students with grade wise

select grade , count(*) from Student group by(grade);
select * from Student;

-- having clause is similar to where but it is not applied

-- find the data of student based on city whose city max marks greater than 70

select city, count(*) from Student group by city having max(marks)>60;

-- alter table : basically perform operation on table. used to rename, modify constraint, add column

select * from Student;

-- add a column age in student table
alter table Student add column age int not null default 18;

-- delete column age
alter table Student drop age;

-- rename stu_name to stuent name
alter table Student change stu_name studentName varchar(100) not null ;

-- rename rollnumber
alter table Student change rollnumber roll int ;

-- find percentage of marks of each student
select studentName, count(studentName) as cnt, sum(marks) as total_marks, round(sum(marks)/500*100,2) as percentage from Student group by studentName order by cnt;




