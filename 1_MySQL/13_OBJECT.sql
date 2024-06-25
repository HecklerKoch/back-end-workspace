/*
	인덱스(INDEX)
    - SQL 명령문에 처리 속도를 향상시키기 위해 행들의 위치 정보를 가지고 있다.
    
    * 데이터 검색 방식
    Table Full Scan : 테이블 데이터를 처음부터 끝까지 검색하여 원하는 데이터를 찾는 방식
    Index Scan : 인덱스를 통해 데이터를 찾는 방식
    
    기본키(PRIMARY KEY)는 테이블의 각 행을 고유하게 식별한다.
    실제 테이블 데이터가 모두 인덱스 구조로 저장된다.
*/
-- 테이블에서 인덱스 조회
show index from employee;

-- 특정 스키마에 있는 인덱스를 한꺼번에 조회
select * from information_schema.statistics
where table_schema = 'kh'
order by index_name desc;


/*
	INDEX 생성
    
    CREATE INDEX 인덱스명
    on 테이블명(컬럼,컬럼,....);
*/

select *
from sakila.payment
where amount = 0.99;

create index idx_amount
on sakila.payment(amount); -- 비고유 인덱스 생성

create index idx_amount_id
on sakila.payment(amount, payment_id);

SHOW INDEX FROM sakila.payment;
select * from sakila.payment;

/*
	INDEX 삭제
    
    DROP INDEX 인덱스명
    ON 테이블명;
*/

drop index idx_amount on sakila.payment;
drop index idx_amount_id on sakila.payment;

/*
	프로시저(procedure)
    - SQL 문을 저장하여 필요할 때마다 다시 입력할 필요없이
      간단하게 호출해서 사용 가능하게 하는 코드 블록
      
	DELIMITER // 
    
    CREATE PROCEDURE 프로시저명(매개변수)
    BEGIN
		저장할 SQL문
	END //
    
    DELIMITER ;
*/
CREATE TABLE emp_copy
select * from employee;

-- emp_copy 테이블의 모든 데이터를 삭제하는 프로시저 생성
DELIMITER //

create procedure del_all_emp()
begin
	delete from emp_copy;
end//

delimiter ;

-- 만들어진 프로시저 확인
show procedure status;

-- del_all_emp 프로시저 호출
call del_all_emp();

-- 프로시저 삭제
drop procedure del_all_emp;

select * from emp_copy;