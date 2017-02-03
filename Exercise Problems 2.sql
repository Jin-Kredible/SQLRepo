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

SELECT employees.hire_date
  FROM employees
 WHERE employee_id =
          (SELECT employee_id
             FROM (  SELECT employee_id, SUM (j.END_DATE - j.START_DATE)
                       FROM JOB_HISTORY j
                   GROUP BY employee_id
                   ORDER BY SUM (j.END_DATE - j.START_DATE) DESC)
            WHERE ROWNUM = 1);

--6번 문제

select department_id, avg(salary), min(salary), avg(salary)-min(salary) from employees having 
avg(salary)-min(salary)<2000 group by department_id order by avg(salary)-min(salary) desc;

--7번 문제

select job_title, sum(max_salary-min_salary) from jobs group by job_title;

	select * from (select job_title, sum(max_salary-min_salary) from jobs 
	group by job_title order by sum(max_salary-min_salary) desc) where rownum=1;

