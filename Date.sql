-- 기분 데이터 타입 출력 포맷 알아보기

SELECT hire_date FROM employees;


SELECT VALUE
  FROM nls_session_parameters
 WHERE parameter = 'NLS_DATE_FORMAT';

--Date 함수

SELECT ADD_MONTHS (SYSDATE, 1) FROM DUAL;

SELECT ADD_MONTHS ('16/01/31', 1) FROM DUAL;

SELECT LAST_DAY ('17/01/01') FROM DUAL;

SELECT MONTHS_BETWEEN ('17/09/01', SYSDATE) FROM DUAL;

SELECT NEXT_DAY ('17/02/02', 1) FROM DUAL; -- 1 is sunday, 2 is monday ~~~~ 7 is saturday


select count(distinct first_name) from employees;

select distinct * from employees where first_name = 'Michael';