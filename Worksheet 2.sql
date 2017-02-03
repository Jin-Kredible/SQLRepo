-- where

select first_name, salary from EMPLOYEES
where salary < 20000;

SELECT first_name, salary
from employees
where 10000 <= salary and salary <= 15000;

SELECT first_name, salary
from employees
where salary between 10000 and 15000;

select first_name, manager_id from employees where manager_id is not null;


select first_name, (salary + salary*nvl(commission_pct, 0)) as 
"이번달 월급"
 from employees;