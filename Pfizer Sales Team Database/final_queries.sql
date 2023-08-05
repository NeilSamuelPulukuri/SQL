--1 Total number of orders placed by each account
SELECT o.accountid, a.accountname, COUNT(orderid) as total_orders 
FROM "Order" o
inner join account a
on o.accountid = a.accountid 
GROUP BY o.accountid, a.accountname 
ORDER BY total_orders DESC;

--2 Average order value by account
SELECT o2.accountid, a.accountname, round(AVG(price),2) as avg_order_value
FROM orderline o
inner join product p on o.productid = p.productid
inner join "Order" o2 on o2.orderid = o.orderid
inner join account a on a.accountid = o2.accountid
GROUP BY o2.accountid, a.accountname
ORDER BY avg_order_value DESC;

--3 Top 3 best-selling products
SELECT p.productname, sum(quantity) as total_volume
FROM product p
INNER JOIN orderline o ON o.productid = p.productid
GROUP BY p.productname
ORDER BY total_volume desc
limit 3;

--4 Accounts with the highest lifetime value
select accountid , accountname, sum(total_price) as total_price from
(
	SELECT a.accountid , a.accountname, o2.quantity, p.price, o2.quantity * p.price as total_price
	FROM "Order" o
	inner join account a on o.accountid = a.accountid
	inner join orderline o2 on o2.orderid = o.orderid
	inner join product p on p.productid = o2.productid
) as D
GROUP BY d.accountid, d.accountname
order by total_price desc;

--5 Top 3 Employee with max goals in 2023 (all combined)
select employeeid, territoryname, sum(amount) as total_goal
from goal g 
inner join territory t 
on g.employeeid = t.managerid 
group by employeeid , territoryname
order by total_goal desc
limit 3;

--6 top territories based on total orders/ goals

SELECT t.territoryname , count(o.orderid) AS total_orders
FROM territory t 
INNER JOIN "Order" o 
ON t.managerid  = o.employeeid 
GROUP BY t.territoryname
ORDER BY total_orders DESC;

--7 botom territories and business recommendation

SELECT t.territoryname , count(o.orderid) AS total_orders
FROM territory t 
INNER JOIN "Order" o 
ON t.managerid  = o.employeeid 
GROUP BY t.territoryname
ORDER BY total_orders ASC
LIMIT 3;


--8 top employees based on total amount they made (Achievement - expense)
SELECT DISTINCT e.employeeid, e2.firstname, e2.lastname, (sum(ach.amount) - sum(e.amount)) AS amnt_made
FROM achievement ach
INNER JOIN expense e 
ON ach.employeeid = e.employeeid 
INNER JOIN employee e2
ON e2.employeeid = e.employeeid 
GROUP BY e.employeeid, e2.firstname , e2.lastname 
ORDER BY amnt_made DESC ;


