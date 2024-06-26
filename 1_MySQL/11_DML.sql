/*
	DML(Data Manipulation Language)
    - 데이터 조작 언어로 테이블에 값을 삽입(INSERT) 하거나,
      수정(UPDATE)하거나, 삭제(DELETE)하는 구문
	
    INSERT
    - 테이블에 새로운 행을 추가하는 구문
    
    1) INSERT INTO 테이블명 VALUES (값, 값, ....);
	   - 테이블에 모든 컬럼에 대한 값을 INSERT 하고자 할 때 사용한다.
       - 컬럼 순번을 지켜서 VALUES 값을 나열해야 한다.
	2) INSERT INTO 테이블명(컬럼명, 컬럼명, ...) VALUES (값, 값,....);
       - 테이블의 특정 컬럼에 대한 값만 INSERT 하고자 할 때 사용한다.
       - 선택이 안된 컬럼들은 기본적으로 NULL값이 들어간다.
       (NOT NULL 조건이 걸려 있는 컬럼은 반드시 값을 입력해야 한다.
       - 기본값(DEFAULT)이 지정되어 있으면 NULL이 아닌 기본값이 들어간다.
	3) INSERT INTO 테이블명 서브쿼리;
	   - VALUES 대신 서브쿼리 조회한 결과값이 통쨰로 INSERT 한다.
       - 서브쿼리 결과값이 INSERT 문에 지정된 테이블 컬럼 개수와 같아야 한다.
*/
-- 사용할 테이블 생성
create table emp(
	emp_id INT primary key auto_increment,
    emp_name varchar(30) not null,
    dept_title varchar (30) default '개발팀',
    hire_date date default (current_date)
);

-- 1)
insert into emp 
values (1, '윤대훈', '서비스 개발팀', default);

-- 모든 컬럼값을 지정하지 않아서 에러
insert into emp
values ('이동엽', '개발 지원팀', default);

-- 에러는 발생하지 않지만 데이터가 잘못 저장
insert into emp
values (2, '개발 지원팀', '이동엽', default);

-- 데이터 타입이 맞지 않아서 에러
insert into emp
values ('개발 지원팀', 3, '이동엽', default);

-- 2)
insert into emp (emp_id, emp_name, dept_title, hire_date)
values(3, '이준용', '보안팀', null);

insert into emp(emp_name)
values ('윤유진');

insert into emp(dept_title, emp_name)
values ('인사팀', '유영민');

-- emp_name 컬럼에 not null 제약조건으로 인한 에러 
insert into emp (dept_title)
values ('마케팅팀');

-- 3)
-- kh.employee 테이블에서 사번, 이름, 부서명, 입사일 가져오기
insert into emp
select emp_id, emp_name, dept_title, hire_date from kh.employee
join kh.department on (dept_code = dept_id);

-- 컬럼명을 명시
insert into emp (dept_title, emp_name, emp_id, hire_date)
select dept_title, emp_name, emp_id, hire_date
from kh.employee
join kh.department on (dept_code = dept_id);

select * from emp;

-- 테이블 구조만 복사
CREATE TABLE emp_dept
select emp_id, emp_name, dept_code, hire_date
from kh.employee
where 1 = 0;

create table emp_manager 
select emp_id, emp_name, manager_id
from kh.employee
where 1 = 0;

select * from emp_dept;
select * from emp_manager;

-- emp_dept 테이블에 employee에서 부서 코드가 D1인 직원의 사번, 이름, 부서코드, 입사일 추가하고
-- emp_manager 테이블에 employee에서 부서 코드가 D1인 직원의 사번, 이름, 관리자 사번 추가
insert into emp_dept
select emp_id, emp_name, dept_code, hire_date 
from kh.employee
where dept_code = 'D1';

insert into emp_manager
select emp_id, emp_name, manager_id 
from kh.employee
where dept_code = 'D1';

select * from emp_dept;
select * from emp_manager;

/*
	UPDATE
    - 테이블에 기록된 데이터를 수정하는 구문
    
    UPDATE 테이블명
    SET 컬럼명 = 변경하려는값,
        컬럼명 = 변경하려는값, ...
	where 조건;
    
    - set 절에서 여러 개의 컬럼을 콤마(,)로 나열해서 값을 동시에 변경할 수 있다.
    - where 절을 생략하면 모든 행의 데이터가 변경된다. (MySQL 방지)
    - 사실 서브쿼리 사용 가능, 잘 쓰이지도 않고 버전마다 상황이 다름
*/
select * from dept_copy;
select * from emp_salary;


-- emp_salary에서 이태림 사원의 급여를 3000000원으로, 보너스를 0.4로 변경
UPDATE emp_salary set salary = 3000000, bonus = 0.4 where emp_name = '이태림';

-- 모든 사원의 급여를 기존 급여에서 10프로 인상한 금액 (기존 급여 * 1.1)으로 변경
UPDATE emp_salary set salary = salary * 1.1;

-- 사번이 201인 사원의 사원번호를 null로 변경
UPDATE emp_salary set emp_id = null where emp_id = 201;
-- >> emp_id 주요키(primary key) 제약조건 위배(not null 위배)

-- 아시아 지역에 근무하는 직원들의 보너스를 0.3으로 변경
select * from kh.employee;
select * from kh.department;
select * from kh.location;

select emp_id from kh.employee
join kh.department on (dept_code = dept_id)
join kh.location on (location_id = local_code)
where local_name like 'ASIA%';

update emp_salary 
set bonus = 0.3 
where emp_id in (select emp_id from kh.employee
join kh.department on (dept_code = dept_id)
join kh.location on (location_id = local_code)
where local_name like 'ASIA%');

rollback;

/*
	DELETE
    - 테이블에 기록된 데이터를 삭제하는 구문
    
	DELETE FROM 테이블명
    where 조건식;
    
    - where 절을 제시하지 않으면 전체 행이 삭제된다.
*/
-- emp_salary에서 dept_code가 D5인 직원들을 삭제
delete from emp_salary where dept_code = 'D5';

/*
	TRUNCATE
    - 테이블 전체 행을 삭제할 때 사용되는 구문
    - DELETE 보다 수행 속도가 빠르다.
    - 별도의 조건을 제시할 수 없고 ROLLBACK이 불가능하다.
    
    TRUNCATE TABLE 테이블명;
*/
start transaction;

DELETE FROM emp_salary;
DELETE FROM dept_copy;

rollback; -- delete는 rollback 가능

TRUNCATE table emp_salary;
truncate table dept_copy;

rollback; -- truncate는 rollback 불가능

select * from emp_salary;
select * from dept_copy;