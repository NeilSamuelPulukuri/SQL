-- drop table if exists goldusers_signup;
CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 

INSERT INTO goldusers_signup(userid,gold_signup_date) 
 VALUES (1,'22-09-2017'),
(3,'21-04-2017');

drop table if exists users;
CREATE TABLE users(userid integer,signup_date date); 

INSERT INTO users(userid,signup_date) 
 VALUES (1,'02-09-2014'),
(2,'15-01-2015'),
(3,'11-04-2014');

drop table if exists sales;
CREATE TABLE sales(userid integer,created_date date,product_id integer); 

INSERT INTO sales(userid,created_date,product_id) 
 VALUES (1,'19-04-2017',2),
(3,'18-12-2019',1),
(2,'20-07-2020',3),
(1,'23-10-2019',2),
(1,'19-03-2018',3),
(3,'20-12-2016',2),
(1,'09-11-2016',1),
(1,'20-06-2016',3),
(2,'24-09-2017',1),
(1,'11-03-2017',2),
(1,'11-03-2016',1),
(3,'10-11-2016',1),
(3,'07-12-2017',2),
(3,'15-12-2016',2),
(2,'08-11-2017',2),
(2,'10-09-2018',3);


drop table if exists product;
CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);


select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;


-- Analysis

--1.what is total amount each customer spent on zomato ?

select userid,sum(price) as total_amount_spent from sales s
inner join product p 
on s.product_id = p.product_id 
group by userid


--2.How many days has each customer visited zomato?

select userid ,count(created_date) as total_days from sales
group by userid 


--3.what was the first product purchased by each customer?


/* entire ranking code
select *,
rank () over(partition by userid order by created_date) as rnk
from sales
*/

select * from 
(select *,
rank () over(partition by userid order by created_date) as rnk from sales) a where rnk = 1


-- 4.what is most purchased item on menu & how many times was it purchased by all customers ?

/* To find top product
select product_id,count(product_id) as count from sales
group by product_id 
order by count desc 
limit 1
*/

select userid,count(product_id) as total_count from sales where product_id in 
(select product_id from sales
group by product_id 
order by count(product_id) desc
limit 1)
group by userid 
limit 1



-- 5.which item was most popular for each customer?

with cte as
(
select userid,product_id,count(product_id),
rank() over(partition by userid order by count(product_id) desc) as rnk from sales 
group by userid,product_id
)
select * from cte 
where rnk = 1

-- 6.which item was purchased first by customer after they become a gold member ?

with gold_cte as
(select s.userid,s.created_date,s.product_id,gs.gold_signup_date  from sales s inner join goldusers_signup gs 
on s.userid = gs.userid 
and created_date >= gold_signup_date
)

select  * from 
(select *,
rank() over(partition by userid order by created_date) as rnk from gold_cte) t 
where rnk = 1 

--7.which item was purchased just before the customer became a member?

with gold_cte1 as
(select s.userid,s.created_date,s.product_id,gs.gold_signup_date  from sales s inner join goldusers_signup gs 
on s.userid = gs.userid 
and created_date <= gold_signup_date
)

select  * from 
(select *,
rank() over(partition by userid order by created_date) as rnk from gold_cte1) t 
where rnk = 1 


--8. what is total orders and amount spent for each member before they become a member?

with gold_product_cte as
(select s.userid,s.created_date,p.product_id,p.product_name,p.price,gs.gold_signup_date from sales s inner join 
product p  
on s.product_id = p.product_id 
inner join goldusers_signup gs 
on s.userid = gs.userid 
and s.created_date <= gs.gold_signup_date)

select userid,count(created_date) as total_orders,sum(price) as total_amount from gold_product_cte
group by userid


-- 9. If buying each product generates points for eg 5rs=2 zomato point and each product has different purchasing points \
--    for eg for p1 5rs=1 zomato point,for p2 10rs=zomato point and p3 5rs=1 zomato point  2rs =1zomato point, 
--    calculate points collected by each customer and for which product most points have been given till now.
-- rs --> Indian Rupees

select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;

-- customer
select f.userid,sum(total_points)*2.5 as total_amt_earned from  
(select e.*,sum/points as total_points from
(select d.*,case when d.product_id = 1 then 5 when d.product_id = 2 then 2 when d.product_id = 3 then 5 else 0 end as points from 
(select c.userid,c.product_id,sum(price) from
(select s.*,p.price from sales s 
inner join product p 
on s.product_id  = p.product_id) c
group by userid,product_id)d)e)f
group by userid


-- product
select h.* from
(select g.*,rank() over(order by total_amt_earned desc) as rnk from
(select f.product_id,sum(total_points) as total_amt_earned from  
(select e.*,sum/points as total_points from
(select d.*,case when d.product_id = 1 then 5 when d.product_id = 2 then 2 when d.product_id = 3 then 5 else 0 end as points from 
(select c.userid,c.product_id,sum(price) from
(select s.*,p.price from sales s 
inner join product p 
on s.product_id  = p.product_id) c
group by userid,product_id)d)e)f
group by product_id)g)h
where rnk=1


-- 10  In the first year after a customer joins the gold program (including the join date ) irrespective of what customer has 
--     purchased earn 5 zomato points for every 10rs spent who earned more more 1 or 3 what int earning in first yr ? 1zp = 2rs
--     rs = Indian Rupees

select a.*,p.price * 0.5 as total_points_earned from
(select s.userid,s.created_date,s.product_id,gs.gold_signup_date  from sales s inner join goldusers_signup gs 
on s.userid = gs.userid 
and created_date >= gold_signup_date and created_date <= gold_signup_date + 365)a 
inner join product p 
on a.product_id = p.product_id 


-- 11 rnk all transaction of the customers

select *,rank() over(partition by userid order by created_date) rnk from sales 



-- 12 rank all transaction for each member whenever they are zomato gold member for every non gold member transaction mark as na

select b.*,case when b.rnk = '0' then 'NA' else rnk end as rnk_without_na from 
(select a.*,cast((case when a.gold_signup_date is null then 0
		   else rank() over(partition by userid order by created_date desc) end) as varchar) as rnk from
(select s.userid,s.created_date,s.product_id,gs.gold_signup_date  from sales s left join goldusers_signup gs 
on s.userid = gs.userid 
and created_date >= gold_signup_date)a)b


















