--LeetCode SQL 50 Challenge

--1. Write a solution to find the ids of products that are both low fat and recyclable. Return the result table in any order.

select product_id
from products
where low_fats = "Y" and recyclable = "Y"


--2. Find the names of the customer that are not referred by the customer with id = 2. Return the result table in any order.

select name
from customer
where referee_id != 2 or referee_id is null

--3. Write a solution to find the name, population, and area of the big countries. A country is big if: it has an area of at least three million (i.e., 3000000 km2), or it has a population of at least twenty-five million (i.e., 25000000).

select 
        name, 
        population,
        area 
from world
where area >= 3000000 or population >= 25000000

--4. Write a solution to find all the authors that viewed at least one of their own articles. Return the result table sorted by id in ascending order.

Select distinct author_id as id
from views
where author_id = viewer_id
order by author_id

--5. Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15. Return the result table in any order.

select tweet_id 
from tweets
where length(content) > 15


--6. Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

select EU.unique_id, name
from Employees as E
left join EmployeeUNI as EU
on eu.id = e.id


--7. Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

select p.product_name, s.year, s.price
from Sales as s
inner join product as p
on p.product_id = s.product_id
order by p.product_name


--8. Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

select v.customer_id, count(v.visit_id) as count
from visits as v
left join Transactions as T
on v.visit_id = t.visit_id
where transaction_id is null
group by v.customer_id
order by 2 DESC

--9. Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

select w2.id 
from weather w1 
inner join weather w2
on DATEDIFF(day, w1.recordDate, w2.recordDate ) = 1 and w2.temperature > w1.temperature

--10. There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process. The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
--The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
--Return the result table in any order.


select a1.machine_id, round(avg(a2.timestamp-a1.timestamp), 3) as processing_time 
from Activity a1
join Activity a2 
on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id
and a1.activity_type='start' and a2.activity_type='end'
group by a1.machine_id