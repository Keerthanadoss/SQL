--                                                            Banking 
-- Assignment 2           
-- Task 1

use banking;
show tables;
insert into customer(first_name,last_name,dob)values
('harry','potter','2002-03-21'),
('ronald','weasley','2001-02-10'),
('hermione','granger','2002-11-15');
select *from customer;
insert into account(account_type,balance,customer_id) values
('savings','50000',1),
('current',120000,2),
('zero_balance',100000,3),
('current',150000,1),
('savings',30000,2);
select *from account;
insert into transaction(transaction_type,amount,transaction_date,account_id) 
values 
('deposit', 10000, '2024-02-01',6),
('withdrawal', 5000, '2024-02-02',6),
('deposit', 20000, '2024-02-02',7),
('withdrawal', 8000, '2024-02-02',8),
('transfer', 20000, '2024-02-01',9),
('transfer', 7000, '2024-02-05',10);
select *from transaction;

-- Task 2
/* 
1. Write a SQL query to retrieve the name, account type and email of all customers. */

select c.first_name,c.email,a.account_type
from customer c join account a on c.id=a.customer_id
/*
/*
+------------+--------------------+--------------+
| first_name | email              | account_type |
+------------+--------------------+--------------+
| harry      | harry@gmail.com    | savings      |
| ronald     | ronald@gmail.com   | current      |
| hermione   | hermione@gmail.com | zero_balance |
| harry      | harry@gmail.com    | current      |
| ronald     | ronald@gmail.com   | savings      |
+------------+--------------------+--------------+
*/

-- 2. Write a SQL query to list all transaction corresponding customer.*/

select c.first_name,t.transaction_type,t.transaction_date,t.amount
from customer c join account a on c.id=a.customer_id join transaction t on a.id=t.account_id
/*
+------------+------------------+------------------+--------+
| first_name | transaction_type | transaction_date | amount |
+------------+------------------+------------------+--------+
| harry      | deposit          | 2024-02-01       |  10000 |
| harry      | withdrawal       | 2024-02-02       |   5000 |
| harry      | transfer         | 2024-02-01       |  20000 |
| ronald     | deposit          | 2024-02-02       |  20000 |
| ronald     | transfer         | 2024-02-05       |   7000 |
| hermione   | withdrawal       | 2024-02-02       |   8000 |
+------------+------------------+------------------+--------+
*/
/*

3. Write a SQL query to increase the balance of a specific account by a certain amount.*/

update account
set balance='35000'
where id=10;
select *from account;
/*
4. Write a SQL query to Combine first and last names of customers as a full_name.*/

select CONCAT(first_name, ' ', last_name) as full_name
from customer;
/*
+------------------+
| full_name        |
+------------------+
| harry potter     |
| ronald weasley   |
| hermione granger |
+------------------+
*/

/*
5. Write a SQL query to remove accounts with a balance of zero where the account 
type is savings.*/

delete from account
where balance = 0 and account_type = 'savings';
-- doubt throwing error saying safe update mode
/*

6. Write a SQL query to Find customers living in a specific city.*/

select * 
from customer 
where city = 'chennai';
/*
+----+------------+-----------+------------+---------+--------------------+
| id | first_name | last_name | dob        | city    | email              |
+----+------------+-----------+------------+---------+--------------------+
|  1 | harry      | potter    | 2002-03-21 | chennai | harry@gmail.com    |
|  3 | hermione   | granger   | 2002-11-15 | chennai | hermione@gmail.com |
+----+------------+-----------+------------+---------+--------------------+
*/
/*
7. Write a SQL query to Get the account balance for a specific account.*/

select account_type,balance
from account
where id = 7;
/*
+--------------+---------+
| account_type | balance |
+--------------+---------+
| current      |  120000 |
+--------------+---------+
*/
/*
8. Write a SQL query to List all current accounts with a balance greater than $1,000.*/

select *
from account
where account_type = 'current' and balance > 1000;
/*
+----+--------------+---------+-------------+
| id | account_type | balance | customer_id |
+----+--------------+---------+-------------+
|  7 | current      |  120000 |           2 |
|  9 | current      |  150000 |           1 |
+----+--------------+---------+-------------+
*/
/*
9. Write a SQL query to Retrieve all transactions for a specific account.*/

select *
from transaction
where account_id = '6';
/*
+----+------------------+--------+------------------+------------+
| id | transaction_type | amount | transaction_date | account_id |
+----+------------------+--------+------------------+------------+
|  7 | deposit          |  10000 | 2024-02-01       |          6 |
|  8 | withdrawal       |   5000 | 2024-02-02       |          6 |
+----+------------------+--------+------------------+------------+
*/

/*
10. Write a SQL query to Calculate the interest accrued on savings accounts based on a 
given interest rate.*/

select id, balance * (5 / 100) AS interest_accrued
from account
where account_type = 'savings';
/*
+----+------------------+
| id | interest_accrued |
+----+------------------+
|  6 |             2500 |
| 10 |             1750 |
+----+------------------+
*/


/*
11. Write a SQL query to Identify accounts where the balance is less than a specified 
overdraft limit.*/

select *
from account
where balance < 100000;
/*
+----+--------------+---------+-------------+
| id | account_type | balance | customer_id |
+----+--------------+---------+-------------+
|  6 | savings      |   50000 |           1 |
| 10 | savings      |   35000 |           2 |
+----+--------------+---------+-------------+
*/

/*
12. Write a SQL query to Find customers not living in a specific city.*/

select * 
from customer 
where city <> 'chennai';
/*
+----+------------+-----------+------------+--------+------------------+
| id | first_name | last_name | dob        | city   | email            |
+----+------------+-----------+------------+--------+------------------+
|  2 | ronald     | weasley   | 2001-02-10 | mumbai | ronald@gmail.com |
+----+------------+-----------+------------+--------+------------------+
*/

-- Task 3

 /* 1. Write a SQL query to Find the average account balance for all customers.  */

select c.first_name,avg(balance) as average_balance
from customer c join account a on c.id=a.customer_id
group by a.customer_id;
/*
+------------+-----------------+
| first_name | average_balance |
+------------+-----------------+
| harry      |          100000 |
| ronald     |           75000 |
| hermione   |          100000 |
+------------+-----------------+
*/
-- 2. Write a SQL query to Retrieve the top 10 highest account balances.

select balance
from account
order by balance desc
limit 0,3;
/*
+---------+
| balance |
+---------+
|  150000 |
|  120000 |
|  100000 |
+---------+
*/

-- 3. Write a SQL query to Calculate Total Deposits for All Customers in specific date. Also display name of the customer

select c.first_name,t.transaction_type,t.amount
from customer c join account a on c.id=a.customer_id join transaction t on a.id=t.account_id
where t.transaction_type='withdrawal' and t.transaction_date='2024-02-02'
/*
+------------+------------------+--------+
| first_name | transaction_type | amount |
+------------+------------------+--------+
| harry      | withdrawal       |   5000 |
| hermione   | withdrawal       |   8000 |
+------------+------------------+--------+ */
-- 4. Write a SQL query to Find the Oldest and Newest Customers.

(select first_name,dob,'oldest' as status
from customer
order by dob
limit 0,1)
union
(select first_name,dob,'newest' as status
from customer
order by dob desc
limit 0,1);
/*
+------------+------------+--------+
| first_name | dob        | status |
+------------+------------+--------+
| ronald     | 2001-02-10 | oldest |
| hermione   | 2002-11-15 | newest |
+------------+------------+--------+ */

-- 5.Write a SQL query to Retrieve transaction details along with the account type.

select t.transaction_type,t.amount,t.transaction_date,a.account_type
from account a join transaction t on a.id=t.account_id

/*
+------------------+--------+------------------+--------------+
| transaction_type | amount | transaction_date | account_type |
+------------------+--------+------------------+--------------+
| deposit          |  10000 | 2024-02-01       | savings      |
| withdrawal       |   5000 | 2024-02-02       | savings      |
| deposit          |  20000 | 2024-02-02       | current      |
| withdrawal       |   8000 | 2024-02-02       | zero_balance |
| transfer         |  20000 | 2024-02-01       | current      |
| transfer         |   7000 | 2024-02-05       | savings      |
+------------------+--------+------------------+--------------+
*/

-- 6.Write a SQL query to Get a list of customers along with their account details.

select c.first_name,a.account_type,a.balance
from customer c join account a on c.id=a.customer_id
/*
+------------+--------------+---------+
| first_name | account_type | balance |
+------------+--------------+---------+
| harry      | savings      |   50000 |
| ronald     | current      |  120000 |
| hermione   | zero_balance |  100000 |
| harry      | current      |  150000 |
| ronald     | savings      |   30000 |
+------------+--------------+---------+
*/

-- 7.Write a SQL query to Retrieve transaction details along with customer information for a specific account.

select c.first_name,c.last_name,t.transaction_type,t.amount,a.account_type
from customer c join account a on c.id=a.customer_id join transaction t on a.id=t.account_id
where a.account_type='savings'
/*
+------------+-----------+------------------+--------+--------------+
| first_name | last_name | transaction_type | amount | account_type |
+------------+-----------+------------------+--------+--------------+
| harry      | potter    | deposit          |  10000 | savings      |
| harry      | potter    | withdrawal       |   5000 | savings      |
| ronald     | weasley   | transfer         |   7000 | savings      |
+------------+-----------+------------------+--------+--------------+*/

-- 8. Write a SQL query to Identify customers who have more than one account.

select c.first_name,count(a.customer_id) as no_of_accounts
from customer c join account a on c.id=a.customer_id
group by a.customer_id
having no_of_accounts>1;
/*
+------------+----------------+
| first_name | no_of_accounts |
+------------+----------------+
| harry      |              2 |
| ronald     |              2 |
+------------+----------------+*/
-- 9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.

select
((select sum(amount) 
from transaction 
where transaction_type='deposit') -
(select sum(amount) 
from transaction 
where transaction_type='withdrawal')) as diff;
/*
+-------+
| diff  |
+-------+
| 17000 |
+-------+
*/
-- 10  Write a SQL query to Calculate the average daily balance for each account over a specified period.

select a.account_type,avg(a.balance) as average_balance
from account a join transaction t on a.id=t.account_id
where t.transaction_date='2024-02-02'  or  t.transaction_date=' 2024-02-01'
group by a.id
order by average_balance desc
/*
+--------------+-----------------+
| account_type | average_balance |
+--------------+-----------------+
| current      |          150000 |
| current      |          120000 |
| zero_balance |          100000 |
| savings      |           50000 |
+--------------+-----------------+*/
-- 11.Calculate the total balance for each account type.

select account_type,sum(balance) as total_balance
from account
group by account_type;
/*
+--------------+---------------+
| account_type | total_balance |
+--------------+---------------+
| current      |        270000 |
| savings      |         80000 |
| zero_balance |        100000 |
+--------------+---------------+
*/
-- 12.Identify accounts with the highest number of transactions order by descending order.

select c.first_name,count(a.id) as num_of_transaction
from customer c join account a on c.id=a.customer_id join transaction t on a.id=t.account_id
group by c.first_name
/*
+------------+--------------------+
| first_name | num_of_transaction |
+------------+--------------------+
| harry      |                  3 |
| hermione   |                  1 |
| ronald     |                  2 |
+------------+--------------------+
*/

-- 13.List customers with high aggregate account balances, along with their account types.

select c.first_name,sum(a.balance) as account_balance,a.account_type
from customer c join account a on c.id=a.customer_id
group by c.id
order by account_balance desc
/*

-- 14.Identify and list duplicate transactions based on transaction amount, date, and account
+------------+-----------------+--------------+
| first_name | account_balance | account_type |
+------------+-----------------+--------------+
| harry      |          200000 | savings      |
| ronald     |          150000 | current      |
| hermione   |          100000 | zero_balance |
+------------+-----------------+--------------+
*/

ALTER TABLE customer
ADD email varchar(255);

select *from customer;

DELETE FROM customer WHERE id=4;

update customer
set email='hermione@gmail.com'
where id=3;

-- Tasks 4

-- 1. Retrieve the customer(s) with the highest account balance.

select first_name
from customer
where id in (select customer_id
            from account
            having max(balance));
/*
+------------+
| first_name |
+------------+
| harry      |
+------------+
*/

-- 2. Calculate the average account balance for customers who have more than one account.
select avg(balance)
from account
where customer_id in(select customer_id
                     from account
					group by customer_id
                    having count(id)>1);
/*
+--------------+
| avg(balance) |
+--------------+
|        88750 |
+--------------+
*/
-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

select *
from transaction
having amount > (select avg(amount) as average
				  from transaction);
/*
+----+------------------+--------+------------------+------------+
| id | transaction_type | amount | transaction_date | account_id |
+----+------------------+--------+------------------+------------+
|  9 | deposit          |  20000 | 2024-02-02       |          7 |
| 11 | transfer         |  20000 | 2024-02-01       |          9 |
+----+------------------+--------+------------------+------------+
*/
-- 4.Identify customers who have no recorded transactions.

select first_name
from customer
where id not in (select customer_id
             from account
             where id in(select account_id
						        from transaction));
-- output

-- 5.Calculate the total balance of accounts with no recorded transactions.
                        
insert into customer(first_name,last_name,dob)
values('luna','lovegood','2002-03-04');

select* from customer;
update customer
set email='luna@gmail.com'
where id=4;

insert into account(account_type,balance,customer_id)
values('current',47000,4);
select *from account;

select customer_id,sum(balance) as balance
from account
where id not in(select account_id
				from transaction);
/*\+-------------+---------+
| customer_id | balance |
+-------------+---------+
|           4 |   47000 |
+-------------+---------+
*/

-- 6.Retrieve transactions for accounts with the lowest balance.

select min(balance)
from account

update account
set account_type='zero_balance'
where id=10;
select *from account;

-- answer
select *
from transaction
where account_id in(select id
                    from account
					where balance in (select min(balance)
	                                   from account));
/*
+----+------------------+--------+------------------+------------+
| id | transaction_type | amount | transaction_date | account_id |
+----+------------------+--------+------------------+------------+
| 12 | transfer         |   7000 | 2024-02-05       |         10 |
+----+------------------+--------+------------------+------------+
*/