--                                             Ticket Booking System
-- Assignment 1
-- Task 1
 
use ticket_booking_system;
 insert into venue(name,address) values 
('mumbai', 'marol andheri(w)'),
('chennai', 'IT Park'),
('pondicherry ', 'state beach');

select * from venue;

insert into customer(name,email,phone_num) 
values
('harry potter','harry@gmail.com','45454545'),
('ronald weasley','ron@gmail.com','45454545'),
('hermione granger','her@gmail.com','45454545'),
('draco malfoy','drac@gmail.com','45454545'),
('ginni weasley','ginni@gmail.com','45454545');

select * from customer; 

insert into event(name,date,time,total_seats,available_seats,ticket_price,event_type,venue_id)
values 
('Late Ms. Lata Mangeshkar Musical', '2021-09-12','20:00',320,270,600,'concert',3),
('CSK vs RCB', '2024-04-11','19:30',23000,3,3600,'sports',2),
('CSK vs RR', '2024-04-19','19:30',23000,10,3400,'sports',2),
('MI vs KKR', '2024-05-01','15:30',28000,100,8000,'sports',1);

select * from event; 

insert into booking values 
(4,1,2,640,'2021-09-12'),
(4,4,3,960,'2021-09-12'),
(1,1,3,10800,'2024-04-11'),
(3,3,5,18000,'2024-04-10');

insert into booking values
(2,2,2,640,'2021-09-12'),
(1,5,3,960,'2021-09-12');

select *from booking;

-- Task 2

-- 2. Write a SQL query to list all Events.
select * from event; 

delete from event
where id>=5 and id<=8;

-- 3. Write a SQL query to select events with available tickets.
select *
from event
where available_seats > 0;
/*
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+------------+----------+
| id | name                             | date       | time  | total_seats | available_seats | ticket_price | event_type | venue_id |
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+------------+----------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00 |         320 |             270 |          600 | concert    |        3 |
|  2 | CSK vs RCB                       | 2024-04-11 | 19:30 |       23000 |               3 |         3600 | sports     |        2 |
|  3 | CSK vs RR                        | 2024-04-19 | 19:30 |       23000 |              10 |         3400 | sports     |        2 |
|  4 | MI vs KKR                        | 2024-05-01 | 15:30 |       28000 |             100 |         8000 | sports     |        1 |
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+-----------
*/

update event SET name='Conferece CUP' where id=4;

--  4.Write a SQL query to select events name partial match with ‘cup’.
select * 
from event
where name LIKE '%cup%';
/*
+----+---------------+------------+-------+-------------+-----------------+--------------+------------+----------+
| id | name          | date       | time  | total_seats | available_seats | ticket_price | event_type | venue_id |
+----+---------------+------------+-------+-------------+-----------------+--------------+------------+----------+
|  4 | Conferece CUP | 2024-05-01 | 15:30 |       28000 |             100 |         8000 | sports     |        1 |
+----+---------------+------------+-------+-------------+-----------------+--------------+------------+----------+
*/


-- 5.Write a SQL query to retrieve events with dates falling within a specific range

select * 
from event
where event_date BETWEEN '2024-04-11' AND '2024-05-01';

/*
+----+---------------+------------+------------+-------------+-----------------+--------------+------------+----------+
| id | event_name    | event_date | event_time | total_seats | available_seats | ticket_price | event_type | venue_id |
+----+---------------+------------+------------+-------------+-----------------+--------------+------------+----------+
|  5 | CSK vs RCB    | 2024-04-11 | 19:30:00   |       23000 |               3 |         3600 | sports     |        2 |
|  6 | CSK vs RR     | 2024-04-19 | 19:30:00   |       23000 |              10 |         3400 | sports     |        2 |
|  7 | Conferece CUP | 2024-05-01 | 15:30:00   |       28000 |             100 |         8000 | sports     |        1 |
+----+---------------+------------+------------+-------------+-----------------+--------------+------------+----------+
*/
-- 6. Write a SQL query to select events with ticket price range is between 1000 to 2500.

select *
from event
where ticket_price between 1000 and 5000;
/*
+----+------------+------------+-------+-------------+-----------------+--------------+------------+----------+
| id | name       | date       | time  | total_seats | available_seats | ticket_price | event_type | venue_id |
+----+------------+------------+-------+-------------+-----------------+--------------+------------+----------+
|  2 | CSK vs RCB | 2024-04-11 | 19:30 |       23000 |               3 |         3600 | sports     |        2 |
|  3 | CSK vs RR  | 2024-04-19 | 19:30 |       23000 |              10 |         3400 | sports     |        2 |
+----+------------+------------+-------+-------------+-----------------+--------------+------------+----------+
*/
-- 7.Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.

select *
from event
where event_type like '%concert%' and available_seats > 0;
/*
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+------------+----------+
| id | name                             | date       | time  | total_seats | available_seats | ticket_price | event_type | venue_id |
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+------------+----------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00 |         320 |             270 |          600 | concert    |        3 |
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+-----------
*/

-- 8. Write a SQL query to retrieve customers in batches of 5, starting from the 6th user.

select * 
from customer
limit 3,2;
/*
+----+---------------+-----------------+-----------+
| id | name          | email           | phone_num |
+----+---------------+-----------------+-----------+
|  4 | draco malfoy  | drac@gmail.com  | 45454545  |
|  5 | ginni weasley | ginni@gmail.com | 45454545  |
+----+---------------+-----------------+-----------+
*/

-- 9.Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.

select *
from booking
where num_tickets > 4;


-- 10. Write a SQL query to retrieve customer information whose phone number end with ‘000’

select * 
from customer 
where phone_number LIKE '%000'; # ends number with 000 
-- empty set

-- 11.Write a SQL query to retrieve the events in order whose seat capacity more than 15000.

select * 
from event
where total_seats > 15000
order by total_seats ASC ; 
/*
+----+---------------+------------+-------+-------------+-----------------+--------------+------------+----------+
| id | name          | date       | time  | total_seats | available_seats | ticket_price | event_type | venue_id |
+----+---------------+------------+-------+-------------+-----------------+--------------+------------+----------+
|  2 | CSK vs RCB    | 2024-04-11 | 19:30 |       23000 |               3 |         3600 | sports     |        2 |
|  3 | CSK vs RR     | 2024-04-19 | 19:30 |       23000 |              10 |         3400 | sports     |        2 |
|  4 | Conferece CUP | 2024-05-01 | 15:30 |       28000 |             100 |         8000 | sports     |        1 |
+----+---------------+------------+-------+-------------+-----------------+--------------+------------+----------+
*/

-- 12. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’

select * 
from event
where name NOT LIKE 'c%' AND name NOT LIKE 'x%'; 
/*
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+------------+----------+
| id | name                             | date       | time  | total_seats | available_seats | ticket_price | event_type | venue_id |
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+------------+----------+
|  1 | Late Ms. Lata Mangeshkar Musical | 2021-09-12 | 20:00 |         320 |             270 |          600 | concert    |        3 |
+----+----------------------------------+------------+-------+-------------+-----------------+--------------+-----------
*/




-- display list of events hosted by venue 'chennai'.

select e.id,e.name,e.time
from event e,venue v
where v.id=e.venue_id and v.id=2;
/*
+----+------------+-------+
| id | name       | time  |
+----+------------+-------+
|  2 | CSK vs RCB | 19:30 |
|  3 | CSK vs RR  | 19:30 |
+----+------------+-------+
*/

-- select customers that have booked tickes for event 'csk v rcb'  game with id=2;

select c.name,c.email,c.phone_num
from customer c,booking b
where c.id=b.customer_id and
b.event_id=2;
/*
+----------------+---------------+-----------+
| name           | email         | phone_num |
+----------------+---------------+-----------+
| ronald weasley | ron@gmail.com | 45454545  |
+----------------+---------------+-----------+
*/
-- display event details that have booking num_tickets > 1000

select b.event_id,b.num_tickets
from event e,booking b
where e.id=b.event_id and
b.num_tickets>1;
/*
+----------+-------------+
| event_id | num_tickets |
+----------+-------------+
|        1 |           3 |
|        1 |           3 |
|        2 |           2 |
|        3 |           5 |
|        4 |           2 |
|        4 |           3 |
+----------+-------------+
*/
-- Display the names of venues visited by customer with email 'harry@gmail.com'

select v.name,c.name
from venue v,event e,booking b,customer c
where v.id=e.venue_id and
e.id=b.event_id and
c.id=b.customer_id and
c.email='harry@gmail.com';

/*
+--------------+--------------+
| name         | name         |
+--------------+--------------+
| mumbai       | harry potter |
| pondicherry  | harry potter |
+--------------+--------------+
*/

-- Task 3

 -- 1. Write a SQL query to calculate the average Ticket Price for Events in Each Venue.

select v.name,avg(e.ticket_price) as average_price
from event e,venue v
where v.id=e.venue_id
group by v.id;

/* output
+--------------+---------------+
| name         | average_price |
+--------------+---------------+
| mumbai       |          8000 |
| chennai      |          3500 |
| pondicherry  |           600 |
+--------------+---------------+
*/
-- 2.Write a SQL query to Calculate the Total Revenue Generated by Events.

select sum((total_seats-available_seats)*ticket_price) as total_revenue
from event;

-- o/p 384185200

-- 3.Write a SQL query to find the event with the highest ticket sales

select name,max(total_seats-available_seats) as max_ticket_sales
from event
group by id
order by id desc
limit 0,1;

/*o/p
+-----------+------------------+
| name      | max_ticket_sales |
+-----------+------------------+
| MI vs KKR |            27900 |
+-----------+------------------+
*/
-- 4.Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.

select name,sum(total_seats-available_seats) as tickets_sold
from event
group by id
order by id desc;

/*o/p
+----------------------------------+--------------+
| name                             | tickets_sold |
+----------------------------------+--------------+
| MI vs KKR                        |        27900 |
| CSK vs RR                        |        22990 |
| CSK vs RCB                       |        22997 |
| Late Ms. Lata Mangeshkar Musical |           50 |
+----------------------------------+--------------+
*/

-- 5.Write a SQL query to Find Events with No Ticket Sales.

select name
from event
where total_seats=available_seats;

-- o/p Empty set (0.01 sec)

-- 6.Write a SQL query to Find the Customer Who Has Booked the Most Tickets.

select c.name,sum(num_tickets) as most_tickets
from customer c,booking b
where c.id=b.event_id
group by b.customer_id
order by most_tickets desc
limit 0,1;

/*op
+--------------+--------------+
| name         | most_tickets |
+--------------+--------------+
| harry potter |            5 |
+--------------+--------------+
*/

-- 7.Write a SQL query to List Events and the total number of tickets sold for each month.
-- Doubt
-- 8.Write a SQL query to calculate the average Ticket Price for Events in Each Venue.

select v.name,avg(e.ticket_price) as average_price
from event e,venue v
where v.id=e.venue_id
group by v.id;
/*
+--------------+---------------+
| name         | average_price |
+--------------+---------------+
| mumbai       |          8000 |
| chennai      |          3500 |
| pondicherry  |           600 |
+--------------+---------------+
*/

-- 9.Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.

select event_type,sum(total_seats-available_seats) as tickets_sold
from event
group by event_type
order by tickets_sold desc;
/* o/p
+------------+--------------+
| event_type | tickets_sold |
+------------+--------------+
| sports     |        73887 |
| concert    |           50 |
+------------+--------------+ 
*/
-- 10. Write a SQL query to calculate the total Revenue Generated by Events in Each Year.

select extract(year from b.booking_date) as year,SUM(b.num_tickets * e.ticket_price) as total_revenue
from event e join booking b on e.id = b.event_id
group by extract(year from b.booking_date);
/*
+------+---------------+
| year | total_revenue |
+------+---------------+
| 2021 |         49000 |
| 2024 |         18800 |
+------+---------------+
*/

-- 11. Write a SQL query to list users who have booked tickets for multiple events.

select c.name,count(c.id) as events_booked
from customer c,booking b,event e
where c.id=b.customer_id and
e.id=b.event_id
group by c.name
having events_booked>1
/*
+--------------+---------------+
| name         | events_booked |
+--------------+---------------+
| harry potter |             2 |
+--------------+---------------+
*/
-- 12.Write a SQL query to calculate the Total Revenue Generated by Events for Each Customer.

use ticket_booking_system;

select c.name,sum(total_cost) as revenue
from customer c join booking b on c.id=b.customer_id join event e on e.id=b.event_id
group by c.name
order by revenue desc;
/*o/p
+------------------+---------+
| name             | revenue |
+------------------+---------+
| hermione granger |   18000 |
| harry potter     |   11440 |
| ginni weasley    |     960 |
| draco malfoy     |     960 |
| ronald weasley   |     640 |
+------------------+---------+
*/
-- 13.Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue.
 
select e.event_type,avg(e.ticket_price) as average_price
from event e,venue v
where v.id=e.venue_id
group by e.event_type;
/*
+------------+---------------+
| event_type | average_price |
+------------+---------------+
| concert    |           600 |
| sports     |          5000 |
+------------+---------------+
*/

-- 14. Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days.

select c.name,b.booking_date
from customer c join booking b on c.id=b.customer_id 
where b.booking_date between DATE_SUB('2024-04-30',INTERVAL 30 DAY) and  '2024-04-30'
group by c.name
-- now() gives todays date 

/*o/p
+------------------+--------------+
| name             | booking_date |
+------------------+--------------+
| harry potter     | 2024-04-11   |
| hermione granger | 2024-04-10   |
+------------------+--------------+
*/

-- Task 4


-- 1. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery


select venue_id,AVG(ticket_price) as Avg_Price
from event
where venue_id IN (select id from venue) 
group by venue_id;
/*
+----------+-----------+
| venue_id | Avg_Price |
+----------+-----------+
|        1 |      8000 |
|        2 |      3500 |
|        3 |       600 |
+----------+-----------+
*/
 
-- 2. Find Events with More Than 50% of Tickets Sold using subquery.
 
select name
from event
where id IN ( select id 
			  from event 
              where (total_seats - available_seats) > (total_seats/2));
/*
+---------------+
| name          |
+---------------+
| CSK vs RCB    |
| CSK vs RR     |
| Conferece CUP |
+---------------+
*/
 
-- 3. Find Events having ticket price more than average ticket price of all events  
 

select name
from event 
where ticket_price >  (select avg(ticket_price) from event); 
 
 /*
 +---------------+
| name          |
+---------------+
| Conferece CUP |
+---------------+
*/
 -- 4. Find Customers Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.
 
 insert into customer(name,email,phone_num) 
 values ('severus snape', 'severus@gmail.com','56463456');
 
 select * from customer; 

 select name
 from customer
 where NOT EXISTS (select distinct c.name
				from customer c join booking b ON b.customer_id = c.id);
 
 
 select distinct c.name
				from customer c join booking b ON b.customer_id = c.id; 
                
                
                
/* 
Display customer details having email 'harry@gmail.com' provided this customer  
has attended atleast 1 event. 
*/     
 
select * 
from customer 
where EXISTS (select distinct c.id 
			  from customer c join booking b ON c.id=b.customer_id 
              where c.email='harry@gmail.com')  
AND email='harry@gmail.com';
/*
+----+--------------+-----------------+-----------+
| id | name         | email           | phone_num |
+----+--------------+-----------------+-----------+
|  1 | harry potter | harry@gmail.com | 45454545  |
|  6 | harry potter | harry@gmail.com | 45454545  |
+----+--------------+-----------------+-----------+
*/

select * 
from customer 
where EXISTS (select distinct c.id 
			  from customer c join booking b ON c.id=b.customer_id 
              where c.email='severus@gmail.com')  
AND email='severus@gmail.com';

-- outputs to null because the gmail with severus@gmail.com does not done any booking and his id is not there in the booking table.

-