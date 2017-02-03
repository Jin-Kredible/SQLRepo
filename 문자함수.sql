-- 문자열 함수

select lower ('Database Management System') from dual;

select upper(first_name) from employees;

SELECT initcap('database management system') from dual;
SELECT first_name || ' ' || last_name from employees;

SELECT concat(concat(first_name, ' '), last_name) from employees;

select substr( 'Database Management System', 2, 4) from dual;

select length('Database Management System') from dual;

select instr('Database Management System', 'Sys' ) from dual;

select employee_id, lpad(salary, 10, ' ') from employees;

select trim( ' ' from '   Database Management System    ') from dual;

select ltrim('     Database Management System   ',' ') from dual;

select rtrim(' Database Management System      ', ' ') from dual;

select replace ('Database Management System', 'a', 'A') from dual;

