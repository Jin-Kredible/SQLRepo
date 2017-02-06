-- single row subquery ( = , <, > , <=, >=)

SELECT first_name, salary
  FROM employees
 WHERE salary <= (SELECT AVG (salary) FROM employees);

-- error ( <, >, <=, >=, != 연산자 뒤에 서브쿼리는 결과가 하나의 row 만 나와야한다)

SELECT first_name, salary
  FROM employees
 WHERE salary <= (  SELECT AVG (salary)
                      FROM employees
                  GROUP BY department_id);


-- multip row selection

-- job_id 가 'IT_PROG'인 직원들의 월급보다 많은 월급을 받는 직원들의 이름과 월급 출력

SELECT first_name, salary
  FROM employees
 WHERE salary > ALL (SELECT salary
                       FROM employees
                      WHERE job_id = 'IT_PROG');

-- alternative (single row 로 하든 multi row로 하든 상관없음)

SELECT first_name, salary
  FROM employees
 WHERE salary > (SELECT MAX (salary)
                   FROM employees
                  WHERE job_id = 'IT_PROG');

-- job_id 가 'IT_PROG'인 직원들의 월급과 같은 월급을 받는 직원들의 이름과 월급 출력



SELECT first_name, salary
  FROM employees
 WHERE salary = ANY (SELECT salary
                       FROM employees
                      WHERE job_id = 'IT_PROG');

--alter

SELECT first_name, salary, job_id
  FROM employees
 WHERE salary IN (SELECT salary
                    FROM employees
                   WHERE job_id = 'IT_PROG');  --having job_id != 'IT_PROG';


-- 각 부서별로 최고 월급을 받고있는 직원의 이름과 급여 출력
--multi row subquery로 해결한 문제

  SELECT first_name as "이름", salary
    FROM employees
   WHERE (department_id, salary) IN ( SELECT department_id, MAX (salary)
                        FROM employees
                    GROUP BY department_id);
--Correlated subquery로 해결한 문제

select first_name, salary, department_id from employees outer where salary = 
						(select max(salary) from employees
						where department_id = outer.department_id
						) order by department_id desc;
						
-- join 로 해결
select first_name, a.salary from employees a ,
	(select department_id, max(salary) as max_salary  from employees group by department_id) b		
	where a.department_id = b.department_id
	and a.salary = b.max_salary
	;
					
					