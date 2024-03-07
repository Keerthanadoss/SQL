--                                                        Courier_Management_System
-- Assignment 3
-- Task 1
use courier_management;

insert into user (name, email, password, contact_num, address)
 values('novak djokovic', 'djokovic@gmail.com', '941', '5678', 'belgrade'),
('rafael nadal', 'rafa@gmail.com', '654', '1234', 'madrid'),
('serena williams', 'serena@gmail.com', '298', '91011', 'new york'),
('roger federer', 'roger@gmail.com', '259', '121314', 'basel');

select *from user;

insert into courier (sender_name, sender_address, receiver_name, receiver_address, weight, status, tracking_num, delivery_date) values
('Eleven', '1983 Hawkins Lab', 'Mike Wheeler', 'Castle Byers', 0.5 , 'pending', 'ST123', '2024-03-07'),
('Will Byers', 'Castle Byers', 'Joyce Byers', '321 Maple Street', 1, 'in transit', 'ST456', '2024-03-08'),
('Dustin Henderson', '456 Elm Street', 'Lucas Sinclair', '789 Cherry Lane', 0.8 , 'delivered', 'ST789', '2024-03-09'),
('Jim Hopper', 'Hawkins Police Department', 'Nancy Wheeler', '1011 Oak Avenue', 1.2, 'pending', 'ST1011', '2024-03-10');

select *from courier;

insert into orders (user_id, courier_id) values
(2, 4),
(3, 2),
(1, 3),
(4, 2),
(3, 1);

select *from orders;

insert into location (name, address) values
('hawkins lab', '123 main st'),
('castle byers', '456 elm st'),
('maple street', '789 maple st'),
('cherry lane', '1011 cherry ln');

select * from location;


insert into employee (name, email, contact_num, role, salary, location_id) values
('virat kohli', 'virat@example.com', '1234567890', 'courier', 1000000, 1),
('sachin tendulkar', 'sachin@example.com', '9876543210', 'courier', 1500000, 2),
('ms dhoni', 'dhoni@example.com', '1231231234', 'courier', 1200000, 3),
('rohit sharma', 'rohit@example.com', '9876543210', 'courier', 1400000, 4);

select *from employee;

insert into payment (amount, date, location_id, courier_id) values
(500, '2024-03-01', 3, 4),
(750, '2024-03-02', 2, 3),
(600, '2024-03-03', 4, 1),
(800, '2024-03-04', 1, 2);

select *from payment;

insert into courier_service (service_name, cost) values
('express delivery', 100),
('standard delivery', 50),
('same-day delivery', 150),
('overnight delivery', 80);

select *from courier_service;

-- Task 2

 -- 1. List all customers
 
 select * 
 from user;
/*
+----+-----------------+--------------------+----------+-------------+----------+
| id | name            | email              | password | contact_num | address  |
+----+-----------------+--------------------+----------+-------------+----------+
|  1 | novak djokovic  | djokovic@gmail.com | 941      | 5678        | belgrade |
|  2 | rafael nadal    | rafa@gmail.com     | 654      | 1234        | madrid   |
|  3 | serena williams | serena@gmail.com   | 298      | 91011       | new york |
|  4 | roger federer   | roger@gmail.com    | 259      | 121314      | basel    |
+----+-----------------+--------------------+----------+-------------+----------+
*/
--  2.List all orders for a specific customer

select * 
from orders 
where user_id = 2;
/*
+---------+------------+--------------+
| user_id | courier_id | order_status |
+---------+------------+--------------+
|       2 |          4 | NULL         |
+---------+------------+--------------+
*/

-- 3.List all couriers

select * 
from courier;
/*
+----+------------------+---------------------------+----------------+------------------+--------+------------+--------------+---------------+
| id | sender_name      | sender_address            | receiver_name  | receiver_address | weight | status     | tracking_num | delivery_date |
+----+------------------+---------------------------+----------------+------------------+--------+------------+--------------+---------------+
|  1 | Eleven           | 1983 Hawkins Lab          | Mike Wheeler   | Castle Byers     |   0.50 | pending    | ST123        | 2024-03-07    |
|  2 | Will Byers       | Castle Byers              | Joyce Byers    | 321 Maple Street |   1.00 | in transit | ST456        | 2024-03-08    |
|  3 | Dustin Henderson | 456 Elm Street            | Lucas Sinclair | 789 Cherry Lane  |   0.80 | delivered  | ST789        | 2024-03-09    |
|  4 | Jim Hopper       | Hawkins Police Department | Nancy Wheeler  | 1011 Oak Avenue  |   1.20 | pending    | ST1011       | 2024-03-10    |
+----+------------------+---------------------------+----------------+------------------+--------+------------+--------------+---------------+
*/
-- 4. List all packages for a specific order

select * 
from orders 
where user_id = 4;
/*
+---------+------------+--------------+
| user_id | courier_id | order_status |
+---------+------------+--------------+
|       4 |          2 | NULL         |
+---------+------------+--------------+
*/

-- 5.List all deliveries for a specific courier

select *
from orders o join courier c on c.id=o.courier_id
where courier_id = 2;
/*
+---------+------------+--------------+----+-------------+----------------+---------------+------------------+--------+------------+--------------+---------------+
| user_id | courier_id | order_status | id | sender_name | sender_address | receiver_name | receiver_address | weight | status     | tracking_num | delivery_date |
+---------+------------+--------------+----+-------------+----------------+---------------+------------------+--------+------------+--------------+---------------+
|       3 |          2 | NULL         |  2 | Will Byers  | Castle Byers   | Joyce Byers   | 321 Maple Street |   1.00 | in transit | ST456        | 2024-03-08    |
|       4 |          2 | NULL         |  2 | Will Byers  | Castle Byers   | Joyce Byers   | 321 Maple Street |   1.00 | in transit | ST456        | 2024-03-08    |
+---------+------------+--------------+----+-------------+----------------+---------------+------------------+--------+------------+--------------+---------------+
*/
-- 6.List all undelivered packages

select * 
from courier 
where status = 'pending';
/*
+----+-------------+---------------------------+---------------+------------------+--------+---------+--------------+---------------+
| id | sender_name | sender_address            | receiver_name | receiver_address | weight | status  | tracking_num | delivery_date |
+----+-------------+---------------------------+---------------+------------------+--------+---------+--------------+---------------+
|  1 | Eleven      | 1983 Hawkins Lab          | Mike Wheeler  | Castle Byers     |   0.50 | pending | ST123        | 2024-03-07    |
|  4 | Jim Hopper  | Hawkins Police Department | Nancy Wheeler | 1011 Oak Avenue  |   1.20 | pending | ST1011       | 2024-03-10    |
+----+-------------+---------------------------+---------------+------------------+--------+---------+--------------+---------------+
*/

-- 7. List all packages that are scheduled for delivery today

select * 
from courier 
where delivery_date = current_date;
/*
+----+-------------+----------------+---------------+------------------+--------+------------+--------------+---------------+
| id | sender_name | sender_address | receiver_name | receiver_address | weight | status     | tracking_num | delivery_date |
+----+-------------+----------------+---------------+------------------+--------+------------+--------------+---------------+
|  2 | Will Byers  | Castle Byers   | Joyce Byers   | 321 Maple Street |   1.00 | in transit | ST456        | 2024-03-08    |
+----+-------------+----------------+---------------+------------------+--------+------------+--------------+---------------+
*/

-- 8.List all packages with a specific status

select * 
from courier
where status = 'delivered';
/*
+----+------------------+----------------+----------------+------------------+--------+-----------+--------------+---------------+
| id | sender_name      | sender_address | receiver_name  | receiver_address | weight | status    | tracking_num | delivery_date |
+----+------------------+----------------+----------------+------------------+--------+-----------+--------------+---------------+
|  3 | Dustin Henderson | 456 Elm Street | Lucas Sinclair | 789 Cherry Lane  |   0.80 | delivered | ST789        | 2024-03-09    |
+----+------------------+----------------+----------------+------------------+--------+-----------+--------------+---------------+
*/

-- 9.Calculate the total number of packages for each courier.

select courier_id, count(*) as total_packages
from orders
group by courier_id;
/*
+------------+----------------+
| courier_id | total_packages |
+------------+----------------+
|          1 |              1 |
|          2 |              2 |
|          3 |              1 |
|          4 |              1 |
+------------+----------------+
*/

-- 10.Find the average delivery time for each courier

select id, avg(datediff(delivery_date, CURRENT_DATE)) as average_delivery_time
from courier
group by id;
/*
+----+-----------------------+
| id | average_delivery_time |
+----+-----------------------+
|  1 |               -1.0000 |
|  2 |                0.0000 |
|  3 |                1.0000 |
|  4 |                2.0000 |
+----+-----------------------+*/
-- 11.List all packages with a specific weight range

select *
from courier
where weight >= 1 and weight <= 2;
/*
+----+-------------+---------------------------+---------------+------------------+--------+------------+--------------+---------------+
| id | sender_name | sender_address            | receiver_name | receiver_address | weight | status     | tracking_num | delivery_date |
+----+-------------+---------------------------+---------------+------------------+--------+------------+--------------+---------------+
|  2 | Will Byers  | Castle Byers              | Joyce Byers   | 321 Maple Street |   1.00 | in transit | ST456        | 2024-03-08    |
|  4 | Jim Hopper  | Hawkins Police Department | Nancy Wheeler | 1011 Oak Avenue  |   1.20 | pending    | ST1011       | 2024-03-10    |
+----+-------------+---------------------------+---------------+------------------+--------+------------+--------------+---------------+
*/

-- 12.Retrieve employees whose names contain 'John'

select *
from employee
where name like '%dhoni%';
/*
+----+----------+-------------------+-------------+---------+------------+-------------+
| id | name     | email             | contact_num | role    | salary     | location_id |
+----+----------+-------------------+-------------+---------+------------+-------------+
|  7 | ms dhoni | dhoni@example.com | 1231231234  | courier | 1200000.00 |           3 |
+----+----------+-------------------+-------------+---------+------------+-------------+
*/

-- 13.Retrieve all courier records with payments greater than 100.

select *
from payment
where amount > 590;
/*
+----+--------+------------+-------------+------------+
| id | amount | date       | location_id | courier_id |
+----+--------+------------+-------------+------------+
|  2 |    750 | 2024-03-02 |           2 |          3 |
|  3 |    600 | 2024-03-03 |           4 |          1 |
|  4 |    800 | 2024-03-04 |           1 |          2 |
+----+--------+------------+-------------+------------+
*/
-- Task 3

-- 14.Calculate the total revenue generated by each location

select l.name as location_name, SUM(p.amount) as total_revenue
from payment p join courier c on p.courier_id = c.id join location l on l.id = p.location_id
group by l.name;
/*
+---------------+---------------+
| location_name | total_revenue |
+---------------+---------------+
| castle byers  |           750 |
| cherry lane   |           600 |
| hawkins lab   |           800 |
| maple street  |           500 |
+---------------+---------------+
*/

-- 15.Find the total number of couriers delivered to each location

select l.name as location_name, COUNT(*) as total_couriers_delivered
from courier c join payment p on c.id=p.courier_id join location l on l.id = p.location_id
group by l.name;
/*
+---------------+--------------------------+
| location_name | total_couriers_delivered |
+---------------+--------------------------+
| castle byers  |                        1 |
| cherry lane   |                        1 |
| hawkins lab   |                        1 |
| maple street  |                        1 |
+---------------+--------------------------+
*/

-- 16.Find the courier with the highest average delivery time

select c.id as courier_id, avg(datediff(c.delivery_date,p.date)) as average_delivery_time
from orders o join courier c on c.id = o.courier_id join payment p on c.id=p.courier_id
group by c.id
order by avg(datediff(c.delivery_date,p.date)) desc
limit 1;
/*
+------------+-----------------------+
| courier_id | average_delivery_time |
+------------+-----------------------+
|          4 |                9.0000 |
+------------+-----------------------+
*/

-- 17.Find Locations with Total Payments Less Than a Certain Amount

select l.name as location_name, sum(p.amount) as total_payments
from courier c join payment p on p.courier_id = c.id join location l on p.location_id = l.id
group by l.name
having sum(p.amount) < 600;
/*
+---------------+----------------+
| location_name | total_payments |
+---------------+----------------+
| maple street  |            500 |
+---------------+----------------+
*/

-- 18.Calculate Total Payments per Location

select l.name as location_name, sum(p.amount) as total_payments
from courier c join payment p on p.courier_id = c.id join location l on p.location_id = l.id
group by l.name;
/*
+---------------+----------------+
| location_name | total_payments |
+---------------+----------------+
| castle byers  |            750 |
| cherry lane   |            600 |
| hawkins lab   |            800 |
| maple street  |            500 |
+---------------+----------------+
*/

-- 19.Retrieve couriers who have received payments totaling more than $1000 in a specific location 

select c.id as courier_id, c.sender_name
from courier c join payment p on p.courier_id = c.id join location l on p.location_id = l.id
where l.name = 'specific_location_name'
group by c.id
having sum(p.amount) > 1000;

-- Empty set (0.00 sec)






















