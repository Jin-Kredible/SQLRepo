-- subquery

SELECT first_name, salary
  FROM employees
 WHERE salary > (SELECT salary
                   FROM employees
                  WHERE first_name = 'Lex');

SELECT first_name, salary
    FROM employees
   WHERE salary > (SELECT AVG   (salary) FROM employees)
ORDER BY salary DESC;

--SELECT avg(salary)
--   FROM employees
--  having avg(salary) > 2000;


