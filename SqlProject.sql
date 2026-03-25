

--Netflix Project--

--Create Table--
DROP TABLE IF EXISTS NETFLIX;


CREATE TABLE NETFLIX
(
show_id	VARCHAR(7) PRIMARY KEY,
type VARCHAR(10)	,
title VARCHAR(150),
director VARCHAR(500),
casts VARCHAR(1000),
country VARCHAR(150),
date_added VARCHAR(50),	
release_year INT,	
rating	VARCHAR(10),
duration VARCHAR(15),
listed_in VARCHAR(100),
description VARCHAR(250)
)

--VIEWING DATA--
SELECT*FROM NETFLIX
LIMIT 10;

--COUNTING DATA--
SELECT  COUNT(*)  AS TOTAL_CONTENT 
FROM NETFLIX

--DIFFERENT CONTENT/MOVIES WE HAVE--
SELECT DISTINCT TYPE
FROM NETFLIX


--BUSINESS PROBLEMS--
--1 COUNT NUMBER OF MOVIES VS NUM OF SHOWS--
SELECT TYPE,COUNT(*)
FROM NETFLIX
GROUP BY TYPE

--2 MOST COMMON RATING FOR MOVIES AND TV SHOW--
SELECT TYPE,rating,
count(*) as total_ratings
from netflix
group by type,rating
order by type desc;

--3 list all movies released in a specific year--
select type ,title, release_year
from netflix
where type='Movie'
and release_year=2020

--4 top 5 countries with most content on netflix--
select country,count(*) as total_content
from netflix
where country is not null
group by country
order by total_content desc
limit 5;

--5 longest movie or tv show duration--

select title,duration from netflix
where duration is not null
order by
cast(split_part(duration,' ',1)as int)desc
limit 5; 

--6 find the content added in last 5 years--
select type,title,director,date_added
from netflix
where to_date(date_added,'Month DD,YYYY')>=current_date-interval '5 years' and  date_added is not null
order by to_date(date_added,'Month DD,YYYY') desc;

--7 all the tv /movies show by director 'rajiv chilaka'--
select type,title,director,duration from netflix
where director='Rajiv Chilaka'
order by duration desc

--8 list all the tv shows with more then 5 season--
select title,duraton
from netflix
where type='TV Show'
and CAST(SPLIT_PART(duratio,' ',1)AS INT)>5;


--9 Count number of content items in each genre--

select 
unnest(string_to_array(listed_in,',')) as genre,
count(show_id)as total_content
from netflix
group by 1

--10 Find each year and the average number of content release by india on netflix,return top 5 year with highest avg content release--
select
extract(year from to_date(date_added,'Month DD, YYYY')) AS year,
count(*),
Round(count(*)::numeric/(select count(*) from netflix where country='India')*100,2) as average_content_per_year
from netflix
where country='India'
group by 1

--11 List all Movies that are documenteries--
select *from netflix
where listed_in ILIKE '%documentaries%'

--12 Content without a director--

select*from netflix
where director is Null

--13 how many movies actor salman khan appear in last 10 year--
select *from netflix 
where casts ilike '%Salman Khan%'
and release_year>extract(year from current_date)-10


--14 top 10 actors who have appeared in the highst number of movies produced in india--
select
--show_id,
--casts,
unnest(string_to_array(casts,',')),
count(*) as total_content
from netflix
group by 1