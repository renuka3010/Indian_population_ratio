---- Indian State and district population ratio Data Analysis Project using SQL ----


--1.tables 
select * from project1.dbo.data1;
select * from project1.dbo.data2;

--2.population of India
select State ,sum(Population) as Population , Area_km2 from project1..data2 where state IS NOT NULL 
group by state,area_km2;

select State,sum(Population) as Population from project1..data2  where State  IS NOT NULL
group by State;


select State,MAX(Population) as Population from project1..data2  where State  IS NOT NULL
group by State;



--3.district in Maharashtra. 
select district from project1..data1 where state = 'Maharashtra';





--4. find the function in the column
select state,max(sex_ratio) as sex_ratio from project1.dbo.data1 group by state ;
select count(*) from project1..data1;
select count(*) from project1..data2;


--5. avg sex ratio
select avg(sex_ratio) as sex_ratio  from project1..data1 

--6.avg growth 
select avg(growth)*100 as growth  from project1..data1 where state in('West Bengal','Maharashtra')

--7.function literacy rate
select avg(literacy)as literacy from project1..data1

select state, growth,max(literacy)as literacy from project1..data1 
group by state, growth order by state


--8.top 3 state showing highest growth ratio
select round(max(growth),0)as growth from project1..data1 
--9.join
select d1.district,d2.Population from project1..data1 d1 join project1..data2 d2
on d1.State = d2.State

--10. join And aggregate function
select d1.district,d2.Population,d2.Area_km2 from project1..data1 d1 join project1..data2 d2
on d1.State = d2.State 


select d1.district,d2.Population,d2.Area_km2 from project1..data1 d1 join project1..data2 d2
on d1.State = d2.State 
where  d1.Literacy in (select max(d1.Literacy) from project1..data1 d1) 



select d1.district,d2.Population,d2.Area_km2 from project1..data1 d1 Right join project1..data2 d2
on d1.State = d2.State where d1.district IS NOT NULL






--11.bottom 3 state showing lowest sex ratio
select top 3 state,round(avg(sex_ratio),0) avg_sex_ratio from project1..data1
group by state order by avg_sex_ratio 

--12.states starting with letter a
select * from project1..data1 where district like 'a%' and district like '%d'  

select * from project1..data1 where district like 'a%'

--13.range between sex_ratio 
select *  from project1..data1 where sex_ratio between 100 and 978 order by sex_ratio

--14.find the total literay rate tin the total india 
select p.*,max(literacy) over() as max_literacy from project1..data1 p
select p.*,max(literacy) over(partition by state ) as max_literacy from project1..data1 p

--15. fetch the first 2 District  from each State of india  
select * from(
select p.*,row_number() over(partition by state order by state  ) as 
row_no from project1..data1 p ) x
where x.row_no <3  

--16. fetch the top 3 district in each state in india  having max literacy rate 
 select * from (
 select p.* ,dense_rank() over(partition by state order by state )  as ra
 from project1..data1 p) x 
 where x.ra<4;


