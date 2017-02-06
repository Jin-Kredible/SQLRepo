-- 문제1

SELECT first_name,
       last_name,
       salary,
       department_name
  FROM (  SELECT *
            FROM employees e, departments d
           WHERE e.department_id = d.department_id
        ORDER BY hire_date DESC)
 WHERE ROWNUM = 1;

--문제 2

SELECT employee_id, last_name, salary
  FROM employees e
 WHERE salary > (SELECT AVG (salary)
                   FROM employees b
                  WHERE e.department_id = b.department_id);

--문제 3


SELECT employee_id,
       first_name,
       last_name,
       salary
  FROM employees c
 WHERE c.department_id = (SELECT department_id
                            FROM (  SELECT AVG (salary), a.department_id
                                      FROM employees a, departments d
                                     WHERE a.department_id = d.department_id
                                  GROUP BY a.department_id
                                  ORDER BY AVG (a.salary) DESC)
                           WHERE ROWNUM = 1);

--문제 4

SELECT *
  FROM (  SELECT AVG (salary), department_name
            FROM employees e, departments d
           WHERE e.department_id = d.department_id
        GROUP BY department_name
        ORDER BY AVG (salary) DESC)
 WHERE ROWNUM = 1;

 --문제 5

select*from (
select avg(salary), l.city
	from employees e, departments d, locations l 
	where e.DEPARTMENT_ID = d.department_id and d.location_id = l.location_id 
	group by l.city order by avg(salary) desc ) where rownum=1;


--문제 6
select*from(
select avg(salary), j.job_title from employees e, jobs j where e.JOB_ID = j.JOB_ID group by j.job_title
order by avg(salary) desc) where rownum=1;