-- like 
-- search words that have 'ma' in it whether it's it the beg / midd/ or at the end
select first_name from employees;
SELECt first_name from employees where first_name like '%ma%';



--specific characters defined in the condition
select first_name from employees where first_name like '%ma__';
select first_name from employees where first_name like '_a_';
select first_name from employees where first_name like '_a%';


select first_name from employees where first_name='Pat';


-- null (or and and) 
select commission_pct from employees where commission_pct is null  AND 2 = 10-8 ;

-- ordre by
select employee_id, salary from employees where salary > 1000 order by salary desc;

select first_name, salary from employees where salary > 1000 order by salary desc, first_name asc;

select first_name, hire_date from employees order by hire_date desc;


