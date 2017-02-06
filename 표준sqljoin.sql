-- ansi join sql 문

-- Inner join 중 natural join 테이블의 컬럼 이름이 같으면 자동으로 조인
-- 조인대상 테이블에 같은 컬럼이 있는 경우에만

select * from employees natural join departments;

--inner join 표준 SQL 문 ( equi 조인) 

select*from employees a join departments b on  a.department_id = b.department_id AND a.first_name = 'Steven';

select*from employees a join departments b using (department_id);

select*from departments a join employees b using (department_id);


--outer join 표준 SQL 문

select a.FIRST_NAME, b.department_id
	from employees a 
full join departments b  -- 오른쪽의 null 값이 다 출력되도록 테이블 출력 (left일 경우 그 반대)
	on a.department_id = b.department_id;
	

