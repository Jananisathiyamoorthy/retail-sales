

create database retail_sales;

create table sales2 (transactions_id	int, sale_date date, sale_time time,
customer_id	int, gender varchar(15), age int, category varchar(25),
quantity int, price_per_unit float,
cogs float,
total_sale float );

#import table 
show databases;
show tables;
select * from sales2;
#record count
select count(*) from sales2;
#unique customer  count
select count(distinct customer_id) from sales2;
#unique category count
select distinct category from sales2;

#delete null rows
#null value check 
select * from sales2 
where
sale_date is null or sale_time is null or customer_id is null or gender is null or age is null or  
category is null or price_per_unit is null or cogs is null or total_sale is null ;

#retrive all columns for sale made on 05-11-2022
select * from sales2
where sale_date='05-11-2022';

#category-clothing in month nov 2022

select * from sales2
where category='clothing'
and sale_date between
'01-11-2022' and '30-11-2022';

#total sales

select category, sum(total_sale) as net_sale, count(*) as total_orders
from sales2 group by 1;

#average age of customers -beauty products

select avg(age) as average_age from sales2
where category='Beauty';

#total sale >1000

select * from
 sales2 where total_sale>1000;
 
#total transcation made by each gender in each category

select  category, gender,
count(*) as total from sales2 group by category,gender
order by 1;

#average sale of each month


with cte as( 
select year (sale_date) as years,
month (sale_date) as months,
sum(total_sale) as avg_sale, 
dense_rank() over(partition by year(sale_date)
order by sum(total_sale) desc) as ranksales 
from sales2 
group by year(sale_date), month(sale_date)
order by years, months desc) 
select * from cte where ranksales=1;

#top 5 high total sales
select customer_id, sum(total_sale) as total from sales2
group by 1 order by 2 desc
limit 5;

#unique customer who purchased from each category
select category, count(distinct customer_id) as uniquecust
from sales2
group by category;

#no of orders morning and evening
with hourlysale as
(
select *, case
           when extract(hour from sale_time) < 12 then 'morning'
           when extract(hour from sale_time) between 12 and 17 then 'afternoon'
           else 'evening'
          end as shift
         from sales2)
select
    shift, count(*) as totalorders from hourlysale
    group by shift;
