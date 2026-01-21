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