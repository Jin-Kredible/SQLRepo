-- 문제집 두번째

--1번 문제

SELECT MAX (salary) AS "최고임금",
       MIN (salary) AS "최저임금",
       MAX (salary) - MIN (salary) AS "최고임금 - 최저임금"
  FROM employees;

--2번 문제

SELECT TO_CHAR (MAX (hire_date), 'yyyy"년" mm"월" dd"일"') FROM employees;

--3번 문제

  SELECT department_id,
         AVG (salary),
         MAX (salary),
         MIN (salary)
    FROM employees
GROUP BY department_id
ORDER BY AVG (salary) DESC;

--4번 문제

  SELECT job_id,
         AVG (salary),
         MAX (salary),
         MIN (salary)
    FROM employees
GROUP BY job_id
ORDER BY AVG (salary) DESC;

--5번 문제

SELECT employee_id AS "회사원 번호",
       TO_CHAR (employees.hire_date, 'yyyy/mm/dd') AS "입사일"
  FROM employees
 WHERE employee_id =
          (SELECT employee_id
             FROM (  SELECT employee_id, SUM (j.END_DATE - j.START_DATE)
                       FROM JOB_HISTORY j
                   GROUP BY employee_id
                   ORDER BY SUM (j.END_DATE - j.START_DATE) DESC)
            WHERE ROWNUM = 1);


SELECT employees.hire_date
  FROM employees
 WHERE employees.employee_id =
          (SELECT *
             FROM (  SELECT e.employee_id
                       FROM employees e, job_history j
                      WHERE e.employee_id = j.EMPLOYEE_ID
                   GROUP BY j.employee_id
                   ORDER BY MAX (j.end_date - j.start_date) DESC)
            WHERE ROWNUM = 1);

SELECT employees.hire_date
  FROM employees
 WHERE employees.employee_id =
          (SELECT *
             FROM (  SELECT e.employee_id
                       FROM employees e, job_history j
                      WHERE e.employee_id = j.EMPLOYEE_ID
                   GROUP BY j.employee_id
                   ORDER BY MAX (j.end_date - j.start_date) DESC)
            WHERE ROWNUM = 1);


--6번 문제

  SELECT department_id,
         AVG (salary),
         MIN (salary),
         AVG (salary) - MIN (salary)
    FROM employees
  HAVING AVG (salary) - MIN (salary) < 2000
GROUP BY department_id
ORDER BY AVG (salary) - MIN (salary) DESC;

--7번 문제

  SELECT job_title AS "직위", SUM (max_salary - min_salary) AS "임금차액"
    FROM jobs
GROUP BY job_title;

SELECT *
  FROM (  SELECT job_title AS "직위",
                 SUM (max_salary - min_salary) AS "최고 임금차액"
            FROM jobs
        GROUP BY job_title
        ORDER BY SUM (max_salary - min_salary) DESC)
 WHERE ROWNUM = 1;