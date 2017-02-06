-- 문제 1

SELECT COUNT (employee_id)
  FROM employees
 WHERE salary < (SELECT AVG (salary) FROM employees);

--문제 2

SELECT employee_id, last_name, salary
  FROM employees a
 WHERE salary = (SELECT MAX (salary)
                   FROM employees b
                  WHERE b.department_id = a.department_id);
				  
select employee_id, last_name, salary from employees a where (salary, department_id) in 
(select max(salary), department_id from employees group by department_id) 	;		  


-- 문제3

  SELECT j.job_title, SUM (e.salary)
    FROM employees e, jobs j
   WHERE e.job_id = j.job_id
GROUP BY job_title
ORDER BY SUM (e.salary) DESC;

-- group by job_id;

--문제 4

SELECT employee_id,
       last_name,
       salary,
       AVG
  FROM employees e,
       (  SELECT AVG (salary) AS AVG, department_id
            FROM employees
        GROUP BY department_id) a
 WHERE e.DEPARTMENT_ID = a.department_id AND e.salary > a.AVG;