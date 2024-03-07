--                                       School Management System
-- Assignment:4
-- Task 1

use school_m_system;

insert into students(first_name,last_name,dob,email,phone_num)
values('ronald','weasley','2001-11-23','ronald@gmail.com','526416'),
('harry','potter','2001-03-13','harry@gmail.com','552616'),
('hermione','granger','2002-12-09','hermione@gmail.com','235866'),
('neville','longbottom','2001-06-14','neville@gmail.com','748625'),
('luna','lovegood','2001-01-01','luna@gmail.com','516576'),
('ginny','weasley','2002-07-12','ginny@gmail.com','941845'),
('fred','weasley','2002-11-18','fred@gmail.com','754256');

select *from students;

insert into teacher(first_name,last_name,email)
values('severus','snape','HalfBloodPrince@gmail.com'),
('minerva','mcgonagall','meow@gmail.com'),
('rubeus','hagrid','buckbeak@gmail.com'),
('remus','lupin','werewolf@gmail.com');

select *from teacher;


insert into courses(name,credits,teacher_id)
values('potions',3,1),
('transfiguration',1,2),
('magical_creature',3,3),
('defence',2,4),
('divination',3,2),
('herbology',3,3);

select *from courses;

insert into payment(amount,date,students_id)
values(25000,'2024-02-14',2),
(24000,'2024-03-06',1),
(18000,'2024-09-12',3),
(21000,'2024-04-02',4),
(25000,'2024-07-12',6),
(24000,'2024-03-06',5),
(10000,'2024-02-15',1),
(20000,'2024-11-01',7);

select *from payment;
update payment
set date='2024-11-01'
where id=8;

insert into enrollment(students_id,courses_id,date)
values(1,6,'2024-09-12'),
(3,1,'2023-04-12'),
(1,3,'2023-03-13'),
(4,2,'2023-03-10'),
(7,6,'2023-12-02'),
(5,3,'2023-12-11'),
(1,5,'2023-03-09'),
(6,2,'2023-03-25'),
(3,4,'2023-07-30'),
(2,6,'2023-09-06'),
(3,4,'2023-09-19'),
(6,5,'2023-02-26'),
(2,4,'2023-04-12');

select *from enrollment;

-- Task 2

-- 2.Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.

insert into enrollment(students_id,courses_id,date)
values(4,6,'2024-05-12');

 -- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.

update teacher
set email='fluffy@gmail.com'
where id=3;

-- 4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.
delete id
from students
where id in(select id
		    from courses
			having id=7);
-- 5.Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

update courses
set teacher_id=4
where id=5;

select *from courses;

-- Task 3

-- 1. Write an SQL query to calculate the total payments made by a specific student. You will need to Join the "Payments" table with the "Students" table based on the student's ID.

select s.first_name,sum(p.amount) as total_payment
from payment p join students s on s.id=p.students_id
group by p.students_id
having p.students_id=2;

/*
+------------+---------------+
| first_name | total_payment |
+------------+---------------+
| harry      |         25000 |
+------------+---------------+
*/

-- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select c.name,count(students_id) as count_of_student
from courses c join enrollment e on c.id=e.courses_id
group by courses_id;

/*
+------------------+------------------+
| name             | count_of_student |
+------------------+------------------+
| potions          |                1 |
| transfiguration  |                2 |
| magical_creature |                2 |
| defence          |                3 |
| divination       |                2 |
| herbology        |                4 |
+------------------+------------------+
*/

-- 3.Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.

select s.first_name
from students s left join enrollment e on s.id=e.students_id
where e.students_id not in(select students_id
                        from enrollment);
-- Empty set (0.01 sec)

-- 4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. 

select s.first_name,s.last_name,c.name as course_name
from students s join enrollment e on s.id=e.students_id join courses c on c.id=e.courses_id;
/*
+------------+------------+------------------+
| first_name | last_name  | course_name      |
+------------+------------+------------------+
| ronald     | weasley    | herbology        |
| ronald     | weasley    | magical_creature |
| ronald     | weasley    | divination       |
| harry      | potter     | herbology        |
| harry      | potter     | defence          |
| hermione   | granger    | potions          |
| hermione   | granger    | defence          |
| hermione   | granger    | defence          |
| neville    | longbottom | transfiguration  |
| neville    | longbottom | herbology        |
| luna       | lovegood   | magical_creature |
| ginny      | weasley    | transfiguration  |
| ginny      | weasley    | divination       |
| fred       | weasley    | herbology        |
+------------+------------+------------------+
*/

-- 5.Create a query to list the names of teachers and the courses they are assigned to. 

select t.first_name,c.name
from teacher t join courses c on t.id=c.teacher_id;
/*
+------------+------------------+
| first_name | name             |
+------------+------------------+
| severus    | potions          |
| severus    | quiditch         |
| minerva    | transfiguration  |
| rubeus     | magical_creature |
| rubeus     | herbology        |
| remus      | defence          |
| remus      | divination       |
+------------+------------------+
*/

-- 6. Retrieve a list of students and their enrollment dates for a specific course. 

select s.first_name,e.date
from students s join enrollment e on s.id=e.students_id join courses c on c.id=e.courses_id
where c.name='herbology';
/*
+------------+------------+
| first_name | date       |
+------------+------------+
| ronald     | 2024-09-12 |
| harry      | 2023-09-06 |
| neville    | 2024-05-12 |
| fred       | 2023-12-02 |
+------------+------------+
*/
-- 7.Find the names of students who have not made any payments. 

select s.first_name
from students s left join payment p on s.id=p.students_id
where s.id not in(select students_id
				  from payment);

-- Empty set (0.01 sec)

-- 8.Write a query to identify courses that have no enrollments. 

insert into courses(name,credits,teacher_id)
values('quiditch',3,1);
select *from courses;

select c.name
from courses c left join enrollment e on c.id=e.courses_id
where c.id not in(select courses_id
				  from enrollment);
/*
+----------+
| name     |
+----------+
| quiditch |
+----------+
*/

-- 9 Identify students who are enrolled in more than one course.use self join on the enrollment table to find student with multiple enrollment record.

select distinct e1.students_id
from enrollment e1 inner join enrollment e2 on e1.students_id = e2.students_id
where e1.courses_id <> e2.courses_id;
/*
+-------------+
| students_id |
+-------------+
|           1 |
|           3 |
|           4 |
|           6 |
|           2 |
+-------------+
*/


-- 10.Find teacher who are not assigned to any courses

select t.*
from teacher t left join courses c on t.id = c.teacher_id;
 

-- Task 4

-- 1.Write an SQL query to calculate the average number of students enrolled in each course. 

select avg(num_students) as average_enrollment
from (
    select courses_id, count(distinct students_id) as num_students
    from enrollment
    group by courses_id
) as course_enrollment;

/*
+--------------------+
| average_enrollment |
+--------------------+
|             2.1667 |
+--------------------+
*/

-- 2.Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
 
 select first_name 
from students
where id in(select distinct students_id
            from payment 
			where amount = (select max(amount)
                            from payment));
                            
/*
+------------+
| first_name |
+------------+
| harry      |
| ginny      |
+------------+
*/
            
-- 3.Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.

select c.name,count(students_id) as num_student
from courses c join enrollment e on c.id=e.courses_id
group by courses_id
order by num_student desc
limit 0,1;
/*
+-----------+-------------+
| name      | num_student |
+-----------+-------------+
| herbology |           4 |
+-----------+-------------+
*/

-- 4.Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.

select t.first_name,sum(p.amount) as total_amount
from payment p join students s on s.id=p.students_id join enrollment e on s.id=e.students_id join courses c on c.id=e.courses_id join teacher t on t.id=c.teacher_id
group by t.id;
/*
+------------+--------------+
| first_name | total_amount |
+------------+--------------+
| severus    |        18000 |
| minerva    |        46000 |
| rubeus     |       158000 |
| remus      |       120000 |
+------------+--------------+
*/

-- 5.Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

select distinct students_id
from enrollment
where exists (select *
                  from courses
                  where not exists (select *
                                    from enrollment e,courses c
                                    where e.students_id = e.students_id
                                    and e.courses_id = c.id));
-- Empty set (0.00 sec)

-- 6.Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

select first_name
from teacher
where id not in(select teacher_id
                from courses);
-- Empty set (0.00 sec)

-- 7.Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth
 
select avg(age) AS average_age
from(select timestampdiff(year, dob, curdate()) as age
    from students
) as student_ages;

/*
+-------------+
| average_age |
+-------------+
|     21.7143 |
+-------------+
*/

-- 8.Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

select name
from courses
where id not in(select courses_id
				from enrollment);
                
/*
+----------+
| name     |
+----------+
| quiditch |
+----------+
*/










