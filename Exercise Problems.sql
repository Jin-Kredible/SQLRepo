--1번 문제
select first_name as "이름", email as "이메일", phone_number as "전화번호" from employees order by hire_date asc;


--2번 문제
select job_title, max_salary from jobs order by max_salary desc;

--3번 문제
select count(employee_id) from employees where manager_id is null;

--4번 문제

select job_title from jobs order by max_salary desc, job_title desc;

--5번 문제
select count(department_id) as "not manager" from departments;

--6번 문제

select department_name from departments order by length(department_name) desc;

--7번 문제

select count(department_id) from departments where manager_id is null;

--8번 문제

select upper(country_name) from countries where region_id is not null order by country_name asc;

--9번 문제

select count(region_id) from regions;
select region_name from regions order by length(region_name) asc;

--10번 문제

select lower(city) from locations order by city asc; 
