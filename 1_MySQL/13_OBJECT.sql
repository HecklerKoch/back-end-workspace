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

-- 매개변수가 있는 프로시저
delimiter //

create procedure del_all_emp(in id int)
begin
	delete from emp_copy
    where emp_id = id;
end //

delimiter ;

-- 프로시저 실행
call del_all_emp(200);
call del_all_emp(205);

insert into emp_copy select * from employee;
select * from emp_copy;

/*
	함수(FUNCTION)
    - 프로시저와 거의 유사한 용도로 값을 반환하는 재사용 가능한 코드 블록
    - 특정 계산이나 로직을 함수로 묶어 사용한다
    
    DELIMITER //
    
    create function 함수명(매개변수)
    retunrs 자료형
    deterministic
    begin
		declare 반환값 자료형
        결과에 해당하는 SQL문 등 계산식 (result로 처리)
        return 반환값
    end //
    
    DELIMITER ;
*/
-- 사번을 입력받아 해당 사원의 연봉을 계산하고 리턴하는 함수 생성
delimiter //

create function salary_calc(id int)
returns int
deterministic 
begin
	declare result int;
    
    
    select salary * 12 result
    into result
    from employee
    where emp_id = id ;
    
    return result;
end //
delimiter ;

-- 함수 호출
select salary_calc (200);

-- 방금 만든 salary_calc 함수를 이용해서 연봉이 4000만원 이상인
-- 사원의 사버, 사원명, 급여, 연봉 조회 (정렬 높은 순)
select emp_idm emp_name, salary, salary_calc(emo) 연봉
from employee
where salary_calc(emp_id) >=;

-- 함수 삭제
drop function if exists salary_calc;

/*
	트리거 (trigger)
    - 특정 이벤트가 발생할 때 자동으로 실행될 내용을 정의하여 저장

	ex)
    - 회원탈퇴시 기존 회원테이블에 데이터 delete 후
      곧바로 탈퇴된 회원들만 따로 보관하는 테이블에 자동으로 insert 처리
	- 신고횟수가 일정 수를 넘었을 때 해당 회원을 블랙리스트로 처리
    - 입출고에 대한 데이터가 기록(insert) 될 때마다
	  해당 상품에 대한 재고수량을 매번 수정( update) 해야되는 경우
      
      dmlimiter //
      
      create trigger (트리검)
      before|after insert|update|delete on
      for each 
      
      delimiter ;
      
*/
show triggers;

create table log(
log_code int auto_increment primary key,
event_type varchar(50),
event_desc text,
event_timestamp timestamp default(current_time)
);

-- employee 테이블에 새로운 행이 insert 될 때마다 '신입사원이 입사했습니다' 라는
-- 메세지를 log 테이블에 자동으로 insert 되는 트리거 생성
delimiter //

create trigger trg_1
after insert on employee
for each row
begin 
	insert into (event_tpe, event_desc)
    values( 'insert', '신입사원이 입사했습니다')
end //
delimiter ;

insert into employee (emp_id, emp_name, emp_no)
values (1000, '서동문', '000000-1111111');

select * from employee;
select * from log;

-- employee 테이블에서 UPDATE 수행 후 '업데이트 실행' 메세지를 log에 담는 trg_02 트리거 생성


-- OLD : 수정, 삭제 전 데이터에 접근 가능
-- NEW : 추가, 수정 후 데이터에 접근 가능
delimiter //

create trigger trg_02
after update on employee
for each row
begin
	insert into log(event_type, event_desc)
    values ('update', concat('변경 전 : ', OLD.dept_code, '변경 후 :', new.dept_code));
end //

delimiter ;

-- 트리거 삭제
drop trigger if exists trg_02;

-- employee 테이블에서 부서 코드가 D6인 직원들의 부서 코드를 D3으로 변경
update employee
set dept_code = 'D6'
where dept_code = 'D3';

select * from log;

-- 상품 입/출고
-- 1. 상품에 대한 데이터 보관할 테이블 생성(product)
/*
	컬럼 : pcode / int / 기본키 / auto_increment
		  pname / varchar (30) / not null
          brand / varchar (30) / not null
          price / int
          stock / int / 기본값 )
*/

drop table product;
create table product (
pcode int primary key auto_increment,
pname varchar (30) not null,
brand varchar (30) not null,
price int,
stock int default 0
);
-- 데이터 3개 추가
insert into product(pname, brand, price) values ('갤럭시S24','삼성',1910000);
insert into product(pname, brand, price, stock) values ('갤럭시Z 플립4','삼성',1780000, 10);
insert into product(pname, brand, price, stock) values ('아이폰15','애플',1250000, 20);

select * from product;

-- 2. 상품 입/출고 상세 이력 테이블 생성 (prodetail)
/*
	컬럼 : dcode / int / 기본키 / auto_increment
		  pcode / int / 외래키
          pdate / date / 기본값 현재날짜
          amount / int / not null
          status / char(2) / 입고, 출고 둘 중 하나
*/
drop table prodetail;
create table prodetail (
dcode int auto_increment primary key,
pcode int, foreign key (pcode) references product(pcode),
pdate date default(current_date),
amount int not null,
status char(2) check(status in ('입고', '출고'))
);

-- 1번 상품이 오늘날짜로 10개 입고 (prodetail)
insert into prodetail(pcode, amount, status) values(1, 10, '입고');
-- 1번 상품의 재고수량 10 증가 (product)
update product
set stock = stock + 10
where pcode = 1;

-- 3번 상품이 오늘날짜로 5개 출고
insert into prodetail(pcode, amount, status) values(3, 5, '출고');
-- 3번 상품의 재고수량 5 감소
update product
set stock = stock - 5
where pcode = 3;

/*
	prodetail 테이블에 insert 발생시
    product 테이블에 매번 자동으로 재고수량 update 되게끔 트리거 정의
    
    트리거명 : trg_03
    if 조건
    then SQL문
    else SQL문
    end if;
*/
delimiter //

create trigger trg_03
if 


delimiter ;

select * from product;
select * from prodetail;