--                                              Electronic Gadget Assignment
-- Assignment:5
-- Task 1

use electronic_gadget;

insert into customer(first_name,last_name,email,phone,address) 
values('walter', 'white', 'walter@gmail.com', '1234567890', 'chennai'),
('jesse', 'pinkman', 'jesse@gmail.com', '9876543210', 'mumbai'),
('skylar', 'white', 'skylar@gmail.com', '4567890123', 'mumbai'),
('hank', 'schraeder', 'hank@gmail.com', '2345678901', 'ranchi'),
('saul', 'goodman', 'saul@gmail.com', '7890123456', 'cochin'),
('gus', 'fring', 'gus@gmail.com', '3456789012', 'chennai');

select *from customer;

insert into product(name,description,price) values
('smartphone', 'device with touchscreen interface', 18000),
('laptop', 'A portable computer', 40000),
('smartwatch', 'smart monitoring', 5000),
('wireless headphones', 'Headphones with bluetooth', 2000),
('tablet', 'larger smartphone', 10000);
select *from product;

insert into orders(customer_id,product_id,date,total_amount,quantity)
values(6,1,'2023-01-11', 18000,1),
(1,2,'2023-12-23', 80000,2),
(2,4,'2023-03-13', 4000,2),
(5,1,'2023-10-04', 18000,1),
(3,3,'2023-05-27', 5000,1),
(2,5,'2023-01-18', 20000,2),
(4,4,'2023-07-10', 4000,2),
(3,2,'2023-03-08', 40000,1);

select *from orders;

insert into inventory(quantityinstock, last_stock_update, product_id) values
(100,'2023-05-20',3),
(150,'2023-03-10',1),
(200,'2023-08-15',2),
(120,'2023-04-30',4),
(180,'2023-07-25',1),
(0,'2023-06-12',4),
(220,'2023-02-18',2),
(170,'2023-09-05',5);

select *from inventory;

-- Task 2

-- 1.Write an SQL query to retrieve the names and emails of all customers.

select first_name,email
from customer;
/*
+------------+------------------+
| first_name | email            |
+------------+------------------+
| walter     | danger@gmail.com |
| jesse      | jesse@gmail.com  |
| skylar     | skylar@gmail.com |
| hank       | hank@gmail.com   |
| saul       | saul@gmail.com   |
| gus        | gus@gmail.com    |
| novak      | novak@gmail.com  |
+------------+------------------+
*/
-- 2.Write an SQL query to list all orders with their order dates and corresponding customer names.

select c.first_name,p.name,o.date
from customer c join orders o on c.id=o.customer_id join product p on p.id=o.product_id;
/*
+------------+---------------------+------------+
| first_name | name                | date       |
+------------+---------------------+------------+
| gus        | smartphone          | 2023-01-11 |
| saul       | smartphone          | 2023-10-04 |
| saul       | smartphone          | 2023-01-11 |
| walter     | laptop              | 2023-12-23 |
| skylar     | laptop              | 2023-03-08 |
| skylar     | smartwatch          | 2023-05-27 |
| jesse      | wireless headphones | 2023-03-13 |
| hank       | wireless headphones | 2023-07-10 |
| jesse      | tablet              | 2023-01-18 |
+------------+---------------------+------------+
*/

-- 3.Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.

insert into customer(first_name,last_name,email,phone,address) 
values('novak', 'djokovic', 'novak@gmail.com', '1592657890', 'serbia');

-- 4.Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

update product
set price=(0.1*price)+price
where id =1;

select *from product;

-- 5.Write an SQL query to delete a specific order and Its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

delete from orders
where order_id=3;

-- 6.Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.

insert into orders(customer_id,product_id,date,total_amount,quantity)
values(5,1,'2023-01-11', 18000,1);

-- 7.Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. 

update customer
set email='danger@gmail.com' 
where id =1;

update customer
set address='pondicherry' 
where id =1;

select *from customer;

-- 8.Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.

select o.customer_id,(p.price*o.quantity) as total_price
from product p join orders o on p.id=o.product_id;

-- 9.Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. 

delete from orders
where customer_id=1;

-- 10.Write an SQL query to insert a new electronic gadget product into the "Products" table

insert into product(name,description,price) values
('headset', 'music player', 8000);

-- 11.Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). 

update orders
set status='shipped'
where id=3;

-- Task 3

-- 1.Write an SQL query to retrieve a list of all orders along with customer information (eg.. customer name) for each order

select c.first_name,o.date,o.total_amount,o.quantity
from customer c join orders o on c.id=o.customer_id;
/*
+------------+------------+--------------+----------+
| first_name | date       | total_amount | quantity |
+------------+------------+--------------+----------+
| walter     | 2023-12-23 |        80000 |        2 |
| jesse      | 2023-03-13 |         4000 |        2 |
| jesse      | 2023-01-18 |        20000 |        2 |
| skylar     | 2023-05-27 |         5000 |        1 |
| skylar     | 2023-03-08 |        40000 |        1 |
| hank       | 2023-07-10 |         4000 |        2 |
| saul       | 2023-10-04 |        18000 |        1 |
| saul       | 2023-01-11 |        18000 |        1 |
| gus        | 2023-01-11 |        18000 |        1 |
+------------+------------+--------------+----------+
*/
-- 2.Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.

select p.name,sum(o.total_amount) as total_revenue
from product p join orders o on p.id=o.product_id
group by o.product_id;
/*
+---------------------+---------------+
| name                | total_revenue |
+---------------------+---------------+
| smartphone          |         54000 |
| laptop              |        120000 |
| smartwatch          |          5000 |
| wireless headphones |          8000 |
| tablet              |         20000 |
+---------------------+---------------+
*/

-- 3.Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.

select distinct c.first_name,c.phone
from customer c join orders o on c.id=o.customer_id;
/*
+------------+------------+
| first_name | phone      |
+------------+------------+
| walter     | 1234567890 |
| jesse      | 9876543210 |
| skylar     | 4567890123 |
| hank       | 2345678901 |
| saul       | 7890123456 |
| gus        | 3456789012 |
+------------+------------+
*/

-- 4.Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.

select p.name,sum(quantity) as quantity_ordered
from product p join orders o on p.id=o.product_id
group by o.product_id
order by quantity_ordered desc
limit 0,1;
/*
+---------------------+------------------+
| name                | quantity_ordered |
+---------------------+------------------+
| wireless headphones |                4 |
+---------------------+------------------+
*/
-- 5.Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

select *
from product;
/*
+----+---------------------+-----------------------------------+-------+
| id | name                | description                       | price |
+----+---------------------+-----------------------------------+-------+
|  1 | smartphone          | device with touchscreen interface | 19800 |
|  2 | laptop              | A portable computer               | 40000 |
|  3 | smartwatch          | smart monitoring                  |  5000 |
|  4 | wireless headphones | Headphones with bluetooth         |  2000 |
|  5 | tablet              | larger smartphone                 | 10000 |
|  6 | headset             | music player                      |  8000 |
+----+---------------------+-----------------------------------+-------+
*/

-- 6.Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.

select c.first_name,count(o.customer_id) as average_order
from customer c join orders o on c.id=o.customer_id
group by o.customer_id;
/*
+------------+---------------+
| first_name | average_order |
+------------+---------------+
| walter     |             1 |
| jesse      |             2 |
| skylar     |             2 |
| hank       |             1 |
| saul       |             2 |
| gus        |             1 |
+------------+---------------+
*/

-- 7.Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.

select o.customer_id,c.first_name,max(total_amount) as highest_revenue
from customer c join orders o on c.id=o.customer_id;
/*
+-------------+------------+-----------------+
| customer_id | first_name | highest_revenue |
+-------------+------------+-----------------+
|           1 | walter     |           80000 |
+-------------+------------+-----------------+
*/

-- 8.Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

select p.name,count(o.product_id) as ordered_times
from product p join orders o on p.id=o.product_id
group by o.product_id;

/*
+---------------------+---------------+
| name                | ordered_times |
+---------------------+---------------+
| smartphone          |             3 |
| laptop              |             2 |
| smartwatch          |             1 |
| wireless headphones |             2 |
| tablet              |             1 |
+---------------------+---------------+
*/

-- 9.Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.

select c.first_name
from customer c join orders o on c.id=o.customer_id join product p on p.id=o.product_id
where p.id=3;
/*
+------------+
| first_name |
+------------+
| skylar     |
+------------+
*/

-- 10.Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.

select sum(total_amount) as total_revenue
from orders 
where date between '2023-02-01' and '2023-05-31';
/*
+---------------+
| total_revenue |
+---------------+
|         49000 |
+---------------+
*/

-- Task 4

-- 1.Write an SQL query to find out which customers have not placed any orders.

select first_name
from customer
where id not in(select customer_id
				from orders);
/*
+------------+
| first_name |
+------------+
| novak      |
+------------+
*/

-- 2.Write an SQL query to find the total number of products available for sale

select sum(QuantityInStock) as for_sale
from Inventory 
where QuantityInStock > 0;

/*
----------+
| for_sale |
+----------+
|     1140 |
+----------+
*/

-- 3. Write an SQL query to calculate the total revenue generated by TechShop.

select sum(total_amount) as total_revenue
from orders;
/*
+---------------+
| total_revenue |
+---------------+
|        207000 |
+---------------+*/
-- 5.Write an SQL query to calculate the total revenue generated by a specific customer.

select sum(total_amount)
from orders
where customer_id in(select customer_id
                     from orders
					 where customer_id=2);
                     /*
/*
+-------------------+
| sum(total_amount) |
+-------------------+
|             24000 |
+-------------------+
*/
                     
-- 6.Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.

select c.first_name,count(o.customer_id) as no_of_order
from customer c join orders o on c.id=o.customer_id
group by o.customer_id
order by no_of_order desc
limit 0,2;
/*
+------------+-------------+
| first_name | no_of_order |
+------------+-------------+
| jesse      |           2 |
| skylar     |           2 |
+------------+-------------+
*/

-- 7.Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.

select p.name,count(p.id) as quantities_sold
from product p join orders o on p.id=o.product_id
group by p.id
order by quantities_sold desc
limit 0,1;
/*
+------------+-----------------+
| name       | quantities_sold |
+------------+-----------------+
| smartphone |               3 |
+------------+-----------------+
*/

-- 8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets.

select o.customer_id,c.first_name,max(total_amount) as highest_spent
from customer c join orders o on c.id=o.customer_id;

/*
+-------------+------------+---------------+
| customer_id | first_name | highest_spent |
+-------------+------------+---------------+
|           1 | walter     |         80000 |
+-------------+------------+---------------+
*/