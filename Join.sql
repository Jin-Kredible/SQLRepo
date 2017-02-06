-- Inner join 중 equi join

  SELECT a.first_name, a.last_name
    FROM employees a, departments b, job_history j
   WHERE                                                      --join 조건이 들어가야함
        a    .department_id = b.department_id
         AND a.EMPLOYEE_ID = j.EMPLOYEE_ID
         AND b.department_name LIKE 'P%'                            --row 선택조건
ORDER BY a.EMPLOYEE_ID ASC;

-- Inner join 중 (self join, equi join)

SELECT *
  FROM employees e, employees a
 WHERE e.MANAGER_ID = a.employee_id;

-- outer join

SELECT NVL (e.FIRST_NAME, '소속 직원없음'), d.department_name
  FROM employees e, departments d
 WHERE e.department_id(+) = d.DEPARTMENT_ID;

SELECT e.first_name,
       NVL (d.department_name, '소속 부서 없음') AS "department"
  FROM employees e, departments d
 WHERE d.department_id(+) = e.department_id