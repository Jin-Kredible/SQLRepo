--top k query (주로 게시판 페이징 처리에 사용됨)

SELECT hire_date FROM employees;

-- 2001년도 입사한 직원중 월급이 가장 많은 3명

SELECT *
  FROM (  SELECT salary
            FROM employees
           WHERE hire_date LIKE '02%'
        ORDER BY salary DESC)
 WHERE ROWNUM < 4;

-- rownum 으로 rank 후에 order by 에 의해서 rank 가 섞여버림 --> rownum 항상 마지막

-- 문제점 : row 하니씩 출력하면서 rownum 숫자가 매겨지는 것이므로  where 조건에 맞는 row는 출력이
-- 현상이 나타남 (1보다 클경우)

SELECT *
  FROM (  SELECT salary
            FROM employees
           WHERE hire_date LIKE '02%'
        ORDER BY salary DESC)
 WHERE ROWNUM <= 5 and rownum >= 2;

--해결법

SELECT *
  FROM (SELECT ROWNUM AS num, a.*
          FROM (  SELECT salary
                    FROM employees
                   WHERE hire_date LIKE '02%'
                ORDER BY salary DESC) a)
 WHERE 4 <= num AND num <= 5;
 
 
 
 --rank 관련 함수
 
 select employee_id, first_name, salary, 
	rank() over( order by salary desc) as rank,
	dense_rank() over (order by salary desc) as d_rank,
	row_number() over (order by salary desc) as row_number
from employees;
 
 
 