-- 문제1

SELECT e.employee_id,
       e.first_name,
       d.department_name,
       e.MANAGER_ID,
       b.first_name
  FROM employees e, departments d, employees b
 WHERE e.department_id = d.department_id AND e.manager_id = b.employee_id;


-- 문제 2

  SELECT r.REGION_NAME, c.country_name
    FROM regions r, countries c
   WHERE r.region_id = c.region_id
ORDER BY r.region_name DESC, c.country_name DESC;

-- 문제 3

  SELECT d.department_id,
         d.department_name,
         e.FIRST_NAME,
         l.city,
         c.COUNTRY_NAME,
         r.REGION_NAME
    FROM departments d,
         employees e,
         locations l,
         countries c,
         regions r
   WHERE     d.department_id = e.department_id
         AND d.location_id = l.location_id
         AND l.country_id = c.country_id
         AND c.region_id = r.region_id
ORDER BY d.department_name DESC;

--문제 4

SELECT e.EMPLOYEE_ID,
       (e.FIRST_NAME || ' ' || e.last_name) AS "public accountant"
  FROM JOB_HISTORY j, EMPLOYEES e, jobs j1
 WHERE     e.EMPLOYEE_ID = j.employee_id
       AND j.JOB_ID = j1.job_id
       AND j1.job_title = 'Public Accountant';

--문제 5

SELECT e.employee_id, (e.FIRST_NAME || ' ' || e.last_name), d.DEPARTMENT_NAME
  FROM employees e
       LEFT JOIN departments d ON e.department_id = d.DEPARTMENT_ID;

--문제 6

SELECT (a.first_name || ' ' || a.last_name) AS "똒똑이들"
  FROM employees a, employees b
 WHERE a.MANAGER_ID = b.employee_id AND a.HIRE_DATE < b.HIRE_DATE;
 
 