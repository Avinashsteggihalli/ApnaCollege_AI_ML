SELECT @@autocommit;

create database if not exists prime;

use prime;

create table accounts (
	id int primary key auto_increment, -- auto increment will assign id value from 1 to increasing order.
    name varchar(50),
    balance decimal(10, 2) -- 10 digits before, 2 after (ex; 12345678.99)
);

select * from accounts;

insert into accounts
(name, balance)
values
('Adam', 500.00),
('Bob', 300.00),
('Charlie', 1000.00);

select * from accounts;

-- transaction
-- 50 Rs from id1 t0 id2
start transaction;

update accounts set balance = balance - 50 where id = 1;
update accounts set balance = balance + 50 where id = 2;

commit;

-- rollback

START  TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE id = 1;
COMMIT;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;

ROLLBACK;

--savepoint

START  TRANSACTION;

UPDATE accounts SET balance = balance + 1000 WHERE id = 1;
SAVEPOINT after_wallet_topup;
UPDATE accounts SET balance = balance + 10 WHERE id = 1;

ROLLBACK TO after_wallet_topup ;

COMMIT;

----- JOINS

create table customers (
    customer_id int primary key,
    name varchar(50),
    city varchar(50)
);

insert into customers values
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Banglore'),
(4, 'David', 'Mumbai');

create table orders (
    order_id int primary key,
    customer_id int,
    ammount int
);

insert into orders values
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);
-- 1.  Inner Join

select *
from customers c
inner join orders o
on c.customer_id = o.customer_id;

-- or 

select c.customer_id, o.order_id, c.name
from customers c
inner join orders o
on c.customer_id = o.customer_id;

-- left join

select *
from customers c
left join orders o
on c.customer_id = o.customer_id;

-- right join

select *
from customers c
right join orders o
on c.customer_id = o.customer_id;

-- outer(union) join

select *
from customers c
left join orders o
on c.customer_id = o.customer_id
UNION
select *
from customers c
right join orders o
on c.customer_id = o.customer_id;

-- cross join

select *
from customers
cross join orders

-- self join

select *
from customers as A
join cutomers as B
on A.customer_id = B.customer_id;

-- left exclusive join

select *
from customers as A
left join orders as B
on A.customer_id = B.customer_id
where B.customer_id IS NULL;

-- right exclusive join

select *
from customers as A
right join orders as B
on A.customer_id = B.customer_id
where A.customer_id IS NULL;

--   SUB-Queries
--(with WHERE)
select * 
from orders
where amount > (
    select avg(amount)
    from orders
);

-- (with SELECT) 

select name ,
    (
    select count(*)
    from orders o
    where c.customer_id = o.cutomer_id
    ) as order_count
from customers c;

--(with FROM)

select
summary.customer_id,
summary.avg_amount
from (
select customer_id, avg(ammount) as avg_amount
from orders
group by customer_id
) as summary;

-- VIEWS

CREATE VIEW view1 AS
SELECT customer_id, name from customers;


select * from view1 where name = 'Alice';

-- or

create view view2 as
select c.customer_id, c.name, o.order_id
from customer c
inner join orders o
on c.customer_id = o.customer_id;


select * from view2;

-- to drop view command

DROP VIEW view1;

-- INDEX

create table accounts1 (
	account_id int primary key,
    name varchar(50),
    balance decimal(10,2),
    branch varchar(50)
    );

insert into accounts1 values
(1, 'Adam', 500.0, 'Mumbai'),
(2, 'Bob', 300.0, 'Delhi'),
(3, 'Charlie', 700.0, 'Banglore'),
(4, 'David', 1000.0, 'Noida');


select * from accounts1;

create index dx_branch on accounts1(branch);

show index from accounts1;

select *
from accounts1
where branch = 'Banglore' -- it will retrieve the data faster in large data sets

-- example for multi-col(composite index)

create index idx2 on accounts1(branch, balance);

show index from accounts1;

-- to drop it

drop index idx2 on accounts1;

-- Stored Procedures
-- (to create)
DELIMITER $$ -- to make understand th sql interpreter that '$$' is end/delimiter of code

CREATE PROCEDURE check_balance(IN acc_id INT)
BEGIN
    SELECT balance
    FROM accounts1
    WHERE account_id = acc_id;
END $$

DELIMITER ; -- after end of th code , make it as it was before (to semicolon)

-- (to call)

CALL check_balance(2);