/*
	뷰(view)
    - select문을 저장할 수 있는 객체
    - 가상 테이블 (실제 데이터가 담겨 있는 건 X => 논리적인 테이블)
    - DML (INSERT, UPDATE, DELETE) 작업 가능
    
    * 사용 목적
    - 편리성 : select문의 복잡도를 완화
    - 보안성 : 테이블의 특정 열을 노출하고 싶지 않은 경우
*/
-- employee, department, location, national
select * from employee
join department on (dept_code = dept_id)
join location on (location_id = local_code)
join national using (national_code);

-- '한국'에서 근무하는 사원들의 사번, 이름, 부서명, 급여, 근무국가명 조회
select emp_id, emp_name, dept_title, salary, national_name 
from employee
join department on (dept_code = dept_id)
join location on (location_id = local_code)
join national using (national_code)
where national_name = '한국';

-- '러시아'에서 근무하는 사원들의 사번, 이름 부서명, 급여, 근무국가명 조회
select emp_id, emp_name, dept_title, salary, national_name 
from employee
join department on (dept_code = dept_id)
join location on (location_id = local_code)
join national using (national_code)
where national_name = '러시아';

-- '일본'에서 근무하는 사원들의 사번, 이름, 부서명, 급여, 근무국가명 조회
select emp_id, emp_name, dept_title, salary, national_name 
from employee
join department on (dept_code = dept_id)
join location on (location_id = local_code)
join national using (national_code)
where national_name = '일본';




/*
	1. VIEW 생성
    CREATE [or replace] VIEW 뷰명
	AS 서브쿼리;
    
    - or replace : 뷰 생성 시 깆ㄴ에 중복된 이름의 뷰가 없다면 새로 뷰 생성,
				   기존에 중복된 이름의 뷰가 있다면 해당 뷰 수정
*/
create or replace view vw_employee
as select emp_id, emp_name, dept_title, salary, national_name 
from employee
join department on (dept_code = dept_id)
join location on (location_id = local_code)
join national using (national_code);

select * from vw_employee;

-- '한국'에서 근무하는 사원들의 사번, 이름, 부서명, 급여, 근무국가명 조회
select *
from vw_employee
where national_name = '한국';

-- '러시아'에서 근무하는 사원들의 사번, 이름 부서명, 급여, 근무국가명 조회
select *
from vw_employee
where national_name = '러시아';

-- '일본'에서 근무하는 사원들의 사번, 이름, 부서명, 급여, 근무국가명 조회
select *
from vw_employee
where national_name = '일본';


/*
	2. 뷰 컬럼에 별칭 부여
    - 서브쿼리의 SELECT절에 함수식이나 산술연산식이 기술되어 있을 경우 반드시 별칭 지정
*/
-- 사원의 사번, 사원명, 직급명, 성별(남/여), 근무년수를 조회할 수 있는
-- SELECT 문을 뷰(vw_emp_job) 생성
create or replace view vw_emp_job as 
select emp_id 사번, emp_name 사원명, job_name 직급명, 
if(substr(emp_no, 8, 1)=1, '남','여') 성별,
timestampdiff(year, hire_date, now()) 근무년수
from employee
join job using (job_code);

-- 성별이 남자인 사원의 사원명과 직급명 조회
select * from vw_emp_job
where 성별 = '남';

-- 근무년수가 20년 이상인 사원 조회
select * from vw_emp_job
where 근무년수 >= '20';

/*
	3. VIEW를 이용해서 DML(INSERT, UPDATE, DELETE) 사용
    - 뷰를 통해 조작하게 되면 실제 데이터가 담겨 있는 테이블에 반영됨
    
*/
create or replace view vw_job
as select job_code, job_name
from job;

-- 뷰를 통해서 INSERT
insert into vw_job
values ('J8', '인턴');

-- 뷰를 통해서 UPDATE
update vw_job
set job_name = '알바'
where job_code = 'J8';

-- 뷰를 통해서 DELETE
delete from vw_job
where job_code = 'J8';


select * from vw_job; -- 논리적인 테이블 (실제 데이터가 담겨있지 X)
select * from job; -- 베이스 테이블 (실제 데이터가 담겨있음)

/*
	4. DML 구문으로 VIEW 조작이 불가능한 경우
*/
-- 1) 뷰 정의에 포함되지 않는 컬럼을 조작하는 경우
create or replace view vw_job
as select job_code from job;

-- insert 에러
insert into vw_job (job_code, job_name)
values ('J8', '인턴');

insert into vw_job
values ('J8'); -- 가능

-- update 에러
update vw_job
set job_name = '인턴'
where job_code = 'J8'; 

update vw_job
set job_code = 'J0'
where job_code = 'J8'; -- 가능

delete from vw_job
where job_name = '사원';

delete from vw_job
where job_code = 'J0';

-- 2) 뷰에 포함되지 않는 컬럼 중에 베이스가 되는 컬럼이 NOT NULL 제약조건이 지정된 경우
create or replace view vw_job
as select job_name from job;
-- job_code가 primary key, 즉 not null 제약조건에 걸림
insert into vw_job
values ('인턴');

update vw_job
set job_name = '인턴'
where job_name = '사원';

-- 자식 데이터가 존재하지 않은 경우만 삭제 가능
delete from vw_job
where job_name = '인턴';

select * from vw_job;
select * from job;
select * from employee;

-- 3. 산술표현식 또는 함수식으로 정의된 경우
-- 사번, 사원명, 급여, 연봉(salary * 12)을 조회한 SELECT 문으로 vw_emp_sal 뷰 정의
create or replace view vw_emp_sal
as select emp_id 사번, emp_name 사원명, salary 급여, (salary * 12) 연봉
from employee;

-- 산술연산식으로 정의된 컬럼은 데이터 추가 불가능
insert into vw_emp_sal
values(300, '홍길동', 3000000, 36000000);

insert into vw_emp_sal (사번, 사원명, 급여)
values(300, '홍길동', 3000000); -- 확인 필요

-- 산술연산으로 정의된 컬럼은 데이터 변경 불가능
update vw_emp_sal
set 연봉 = 8000000
where 사번 = 200;

update vw_emp_sal
set 급여 = 9000000
where 사번 = 200; -- 산술연산과 무관한 컬럼은 데이터 변경 가능

-- delete 가능
delete from vw_emp_sal
where 연봉 = 72000000;

select * from vw_emp_sal;
select * from employee;

-- 4. 그룹함수나 GROUP BY 절을 포함한 경우
-- 부서별 급여의 합계, 평균을 조회한 select 문을 vw_groupdept 뷰 정의
create or replace view vw_groupdept
as select format(sum(salary),0) 급여합계, format(avg(salary),0) 평균급여 from employee;

select * from vw_groupdept;








