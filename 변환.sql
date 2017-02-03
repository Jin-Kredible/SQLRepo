-- date --> 문자열

select to_char(sysdate, 'yyyy/mm/dd hh:mi:ss') from dual;

select employee_id, hire_date from employees;

select employee_id, to_char(hire_date, 'yyyy"년"/mm"월"/dd"일" PM hh24"시":mi"분":ss"초"') from employees;

select employee_id, to_char(hire_date, 'yyyy"년"/mm"월"/dd"일" dy"요일" ddd"째 되는날"') from employees;

--- number -->문자열

select employee_id, to_char(salary, '99999') from employees;

select employee_id, to_char(salary, 'FM999,999') from employees;


select to_char(3.134343545, '9.999') from dual;

select to_char(-1000, '99999PR') from dual;


--- 기타 함수( NVL)

select employee_id, salary, nvl(commission_pct, 0) from employees;
select nvl2(null, 10, 0) from dual;
select nvl2(1, 10, 0) from dual;

select employee_id , salary + nvl(salary*commission_pct, 0) from employees;

-- null if

select nullif(1, 1) from dual;
select nullif(2, 1) from dual;

select coalesce(1,2,3,4,5,6) from dual;

-- 주의사항 (대체값은 타입이 같아야 한다 --> ex) 밑에 manager_id 가 number이기 때문에 String 이 들어갈 수 없음)

select employee_id, nvl(manager_id, 'No manager') from employees;

select employee_id, nvl(to_char(manager_id), 'No Manager') from employees; -- number 를 char로 바꿈

