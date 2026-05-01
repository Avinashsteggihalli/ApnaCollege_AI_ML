/* 
Create a table to store stdent info (roll_no, name, city , marks)

Insert following data in the table
(110, "adam", "Karnataka", 76)
(108, "bob", "Goa", 65)
(124, "casey", "Pune", 94)
(112, "duke", "Pune", 80)

* select all students who scored 75+.
* find names of cities where students are from.
* find the max marks of students from th city.
* find the avg of the class.
* add new col grade, assign grade such that :
    marks > 80, grade = O (not zero)
    marks > 70-80, grade = A
    marks > 60-70, grade = B

*/

create table if not exists student (
	roll_no int Primary key,
    name varchar(25),
    city varchar(50),
    marks int
);
    
select * from student;

insert into student
(roll_no, name, city, marks)
values
(110, "adam", "Karnataka", 76),
(108, "bob", "Goa", 65),
(124, "casey", "Pune", 94),
(112, "duke", "Pune", 80);

select * from student
where marks > 75;

select distinct city from student;

select city
from student
group by city

select city,max(marks) from student
group by city;

select avg(marks) from student;

alter table student
add column grade int;

alter table student
modify column grade varchar(5);

update student
set grade = 'O'
where marks > 80;

update student
set grade = 'A'
where marks between 70 and 80; -- marks >= 70 and marks <= 80;

update student
set grade = 'B'
where marks between 60 and 70; -- marks >= 60 and marks <= 70;








