-- Step 1: Create database and import csv  -> choose database to quer
Create database hr_projects;

-- choose database to query
use hr_projects;
select * from hr_project;

-- Step 2: Data cleaning
select count(*) from hr_project;
-- Check null -> non null but contain a lot of empty string or ''
SELECT 
    SUM(CASE WHEN emp_id IS NULL THEN 1 ELSE 0 END) AS emp_id_nulls,
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS first_name_nulls,
    SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS last_name_nulls,
    SUM(CASE WHEN birthdate IS NULL THEN 1 ELSE 0 END) AS birthdate_nulls,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
    SUM(CASE WHEN race IS NULL THEN 1 ELSE 0 END) AS race_nulls,
    SUM(CASE WHEN department IS NULL THEN 1 ELSE 0 END) AS department_nulls,
    SUM(CASE WHEN jobtitle IS NULL THEN 1 ELSE 0 END) AS jobtitle_nulls,
    SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS location_nulls,
    SUM(CASE WHEN hire_date IS NULL THEN 1 ELSE 0 END) AS hire_date_nulls,
    SUM(CASE WHEN termdate IS NULL THEN 1 ELSE 0 END) AS termdate_nulls,
    SUM(CASE WHEN location_city IS NULL THEN 1 ELSE 0 END) AS location_city_nulls,
    SUM(CASE WHEN location_state IS NULL THEN 1 ELSE 0 END) AS location_state_nulls
FROM hr_project;

-- check empty string
SELECT 
    SUM(CASE WHEN emp_id = '' THEN 1 ELSE 0 END) AS emp_id_empty,
    SUM(CASE WHEN first_name = '' THEN 1 ELSE 0 END) AS first_name_empty,
    SUM(CASE WHEN last_name = '' THEN 1 ELSE 0 END) AS last_name_empty,
    SUM(CASE WHEN birthdate = '' THEN 1 ELSE 0 END) AS birthdate_empty,
    SUM(CASE WHEN gender = '' THEN 1 ELSE 0 END) AS gender_empty,
    SUM(CASE WHEN race = '' THEN 1 ELSE 0 END) AS race_empty,
    SUM(CASE WHEN department = '' THEN 1 ELSE 0 END) AS department_empty,
    SUM(CASE WHEN jobtitle = '' THEN 1 ELSE 0 END) AS jobtitle_empty,
    SUM(CASE WHEN location = '' THEN 1 ELSE 0 END) AS location_empty,
	SUM(CASE WHEN hire_date = '' THEN 1 ELSE 0 END) AS hire_date_empty,
    SUM(CASE WHEN termdate = '' THEN 1 ELSE 0 END) AS termdate_empty,
    SUM(CASE WHEN location_city = '' THEN 1 ELSE 0 END) AS location_city_empty,
    SUM(CASE WHEN location_state = '' THEN 1 ELSE 0 END) AS location_state_empty
FROM hr_project;

-- Now, remove all rows where all columns have empty string ;
DELETE FROM hr_project
WHERE 
    emp_id = '' AND
    first_name = '' AND
    last_name = '' AND
    birthdate = '' AND
    gender = '' AND
    race = '' AND
    department = '' AND
    jobtitle = '' AND
    location = '' AND
    hire_date = '' AND
    termdate = '' AND
    location_city = '' AND
    location_state = '';

-- check empty string again
SELECT 
    SUM(CASE WHEN emp_id = '' THEN 1 ELSE 0 END) AS emp_id_empty,
    SUM(CASE WHEN first_name = '' THEN 1 ELSE 0 END) AS first_name_empty,
    SUM(CASE WHEN last_name = '' THEN 1 ELSE 0 END) AS last_name_empty,
    SUM(CASE WHEN birthdate = '' THEN 1 ELSE 0 END) AS birthdate_empty,
    SUM(CASE WHEN gender = '' THEN 1 ELSE 0 END) AS gender_empty,
    SUM(CASE WHEN race = '' THEN 1 ELSE 0 END) AS race_empty,
    SUM(CASE WHEN department = '' THEN 1 ELSE 0 END) AS department_empty,
    SUM(CASE WHEN jobtitle = '' THEN 1 ELSE 0 END) AS jobtitle_empty,
    SUM(CASE WHEN location = '' THEN 1 ELSE 0 END) AS location_empty,
	SUM(CASE WHEN hire_date = '' THEN 1 ELSE 0 END) AS hire_date_empty,
    SUM(CASE WHEN termdate = '' THEN 1 ELSE 0 END) AS termdate_empty,
    SUM(CASE WHEN location_city = '' THEN 1 ELSE 0 END) AS location_city_empty,
    SUM(CASE WHEN location_state = '' THEN 1 ELSE 0 END) AS location_state_empty
FROM hr_project;

-- export the file and check again -> there are 53 rows with only job title but no other attributes provided 
-- -> delete these t3 rows too
DELETE FROM hr_project
WHERE 
    emp_id = '' AND
    first_name = '' AND
    last_name = '' AND
    -- birthdate = '' AND
    gender = '' AND
    race = '' AND
    department = '' AND
    location = '' AND
    -- hire_date = '' AND
    -- termdate = '' AND
    location_city = '' AND
    location_state = '';

-- check empty string again
SELECT 
    SUM(CASE WHEN emp_id = '' THEN 1 ELSE 0 END) AS emp_id_empty,
    SUM(CASE WHEN first_name = '' THEN 1 ELSE 0 END) AS first_name_empty,
    SUM(CASE WHEN last_name = '' THEN 1 ELSE 0 END) AS last_name_empty,
    SUM(CASE WHEN birthdate = '' THEN 1 ELSE 0 END) AS birthdate_empty,
    SUM(CASE WHEN gender = '' THEN 1 ELSE 0 END) AS gender_empty,
    SUM(CASE WHEN race = '' THEN 1 ELSE 0 END) AS race_empty,
    SUM(CASE WHEN department = '' THEN 1 ELSE 0 END) AS department_empty,
    SUM(CASE WHEN jobtitle = '' THEN 1 ELSE 0 END) AS jobtitle_empty,
    SUM(CASE WHEN location = '' THEN 1 ELSE 0 END) AS location_empty,
	SUM(CASE WHEN hire_date = '' THEN 1 ELSE 0 END) AS hire_date_empty,
    SUM(CASE WHEN termdate = '' THEN 1 ELSE 0 END) AS termdate_empty,
    SUM(CASE WHEN location_city = '' THEN 1 ELSE 0 END) AS location_city_empty,
    SUM(CASE WHEN location_state = '' THEN 1 ELSE 0 END) AS location_state_empty
FROM hr_project;

-- 2.1 change column name 
alter table hr_project
change column id emp_id varchar(20) null;

-- 2.2 Check data type
describe hr_project;
select birthdate from hr_project;

-- 2.3 change format and data type of birthdate, hire_date and termdate from m d Y to Y m d, as well as from m-d-Y format
update hr_project
set birthdate = CASE
	when birthdate like '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    when birthdate like '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
    
alter table hr_project
modify column birthdate DATE;

-- Same thing, change date type and format for hireday
update hr_project
set hire_date = CASE
	when hire_date like '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;
    
alter table hr_project
modify column hire_date DATE;

--  Modify term date
SET sql_mode = 'ALLOW_INVALID_DATES';

UPDATE hr_project
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d')), '0000-00-00')
WHERE true;

SELECT termdate from hr_project;

ALTER TABLE hr_project
MODIFY COLUMN termdate DATE;

-- 2.4 Create age column, add value by caculating the year different between current date and birthdate
alter table hr_project add column age int;

update hr_project
set age = timestampdiff(YEAR, birthdate, CURDATE());
select birthdate, age from hr_project;

-- check for the age of employee
select min(age), max(age) from hr_project;

select min(birthdate), max(birthdate) from hr_project;

select count(*) from hr_project where age < 18;


select * from hr_project;
-- Step 3: Analysis
-- 3.1 Gender distibution
select gender, count(gender) from hr_project
where termdate = '0000-00-00'
group by gender;

-- 3.2 Race distribution
select race, count(gender) as number from hr_project
where termdate = '0000-00-00'
group by race
order by count(gender);

--  3.3 Age distribution
select 
	case 
		when age >= 21 and age <= 30 then '21 to 30'
		when age >= 31 and age <= 40 then '31 to 40'
		when age >= 41 and age <= 50 then '41 to 50'
		when age >= 51 and age <= 60 then '51 to 60'
        else 'not reported'
	end as 'age_group'
	,count(age) as count
from hr_project
where termdate = '0000-00-00'
group by age_group;

-- 3.4 Gender and age
select 
	case 
		when age >= 21 and age <= 30 then '21 to 30'
		when age >= 31 and age <= 40 then '31 to 40'
		when age >= 41 and age <= 50 then '41 to 50'
		when age >= 51 and age <= 60 then '51 to 60'
        else 'not reported'
	end as 'age_group'
    ,gender
	,count(age) as count
from hr_project
where termdate = '0000-00-00'
group by age_group, gender;

-- 3.5 Location
select location, count(location) from hr_project
where termdate = '0000-00-00'
group by location;

-- 3.6 Average working time before eliminated
select avg(timestampdiff(year, hire_date,termdate)) as average_length_employ
from hr_project
where termdate != '0000-00-00' and termdate <= curdate()
;

-- 3.7 Gender distribution across departments 
select department, gender, count(*) as count
from hr_project
where termdate = '0000-00-00' 
group by department, gender
order by department;

-- 3.8 Department which has highest turn over

-- inner query return the total count and terminated count by deparment -> compute the termination rate

select department, total_count, terminated_count, terminated_count/total_count as termination_rate
from (
	select department, count(*) as total_count,
    SUM(CASE WHEN termdate != '0000-00-00' and termdate <= curdate() then 1 else 0 end) as terminated_count
    from hr_project
    group by department
	) as sub
order by termination_rate DESC
;

-- 3.9 Distribution of employee across state 
select location_state, count(emp_id) as no_employee from hr_project
where termdate != '0000-00-00'
group by location_state
order by count(emp_id) desc;

-- 3.10 Employee hired and terminated changes over years
-- inner query - find the employee hired and terminated each year
select year_hired, no_employee_hired, terminated_sum, (no_employee_hired - terminated_sum) as net_change, 
		concat( round(((no_employee_hired - terminated_sum)/no_employee_hired)*100,2), '%') as net_change_percentage
from (
	select year(hire_date) as year_hired, count(emp_id) as no_employee_hired,
		   SUM(case when termdate != '0000-00-00' and termdate < curdate() then 1 else 0 end) as terminated_sum
	from hr_project 
    where hire_date is not null
	group by year(hire_date)
	order by year(hire_date)
    ) as hired_terminated
group by year_hired
order by year_hired
;

-- 3.11 Tenure distribution of each department
SELECT department, round(avg(datediff(termdate, hire_date)/365),0) AS avg_tenure
FROM hr_project
WHERE termdate <= curdate() AND termdate <> '0000-00-00'
GROUP BY department;







