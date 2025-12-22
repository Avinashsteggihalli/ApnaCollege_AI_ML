/* Create a database for your collge
Create a table name Teacher to store (id, name, subject , salary)
Insert following data in the table
(23, "ajey", "math", 50,000)
(47, "bharat", "english", 60,000)
(18, "chetan", "chetan", 45,000)
(9, "divya", "physics", 75,000) 

* select teacher whose salary is more than 55k.
* rename the salary column of the teacher table to ctc.
* update salary of all teacher by giving them an increment of 25%.
* all a new column for called city. the default city should be "Haveri".
* delete the salary column for teacher table.

*/

Create database if not exists college;

Create table teacher (
    id int primary key,
    name varchar(50),
    subject varchar(50),
    salary int;
);

insert into teacher
(id, name, subjct, salary)
values
(23, "ajey", "math", 50000),
(47, "bharat", "english", 60000),
(18, "chetan", "chemistry", 45000),
(9, "divya", "physics", 75000);

select * from table;

select * from teacher
where salary > 55000;

alter table teacher
change column salary ctc int;

update teacher
set ctc = ctc + (ctc * 0.25);

alter table teacher
add column city varchar(50) default "Haveri";

alter table teacher
drop column ctc;