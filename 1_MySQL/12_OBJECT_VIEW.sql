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
as select emp_id 사번, emp_name 사원명, emp_no 주민번호,salary 급여 , (salary * 12) 연봉
from employee;

-- 산술연산식으로 정의된 컬럼은 데이터 추가 불가능
insert into vw_emp_sal
values(300, '홍길동', 3000000, 36000000);

-- 산술연산식이 컬럼에 같이 들어간 경우도 데이터 추가 불가능
insert into vw_emp_sal (사번, 사원명, 주민번호, 급여)
values(300, '홍길동', '000000-0000000', 3000000); -- 가능 / 산술연산식을 컬럼에서 지울시

delete from vw_emp_sal
where 사번 = 300;

select * from vw_emp_sal;

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
as select dept_code 부서코드, format(sum(salary),0) 급여합계, format(avg(salary),0) 평균급여 
from employee
group by dept_code;

-- insert (에러)
insert into vw_groupdept
values ('D11', 80, 40);

-- update (에러)
update vw_groupdept
set 합계 = 800
where 부서코드 = 'D1';

-- delete (에러)
delete from vw_groupdept
where 합계 = '5210000';


select * from vw_groupdept;

-- 5. DISTINCT 구문이 포함된 경우
-- employee 테이블로 job_code만 중복없이 조회한 select 문을 vw_dt_job 뷰 정의
create or replace view vw_dt_job
as select distinct job_code from employee;

-- insert (에러)
insert into vw_dt_job
values ('J8');

-- update (에러)
update vw_dt_job
set job_code = 'J0'
where job_code = 'J7';

-- delete (에러)
delete from vw_dt_job
where job_code = 'J1';


select * from vw_dt_job;

-- 6. JOIN을 이용해서 여러 테이블을 연결한 경우
-- 사원들의 사번, 사원명, 주민번호, 부서명 조회한 select 문을 vw_joinemp 뷰 정의
create or replace view vw_joinemp
as select emp_id, emp_name, emp_no, dept_title from employee
join department on (dept_code = dept_id);

-- insert
insert into vw_joinemp
values (300, '홍길동', '800130-1111111', '개발팀');

insert into vw_joinemp (emp_id, emp_name, emp_no)
values (300, '홍길동', '800130-1111111'); -- 가능

-- update
update vw_joinemp
set emp_name = '박성철'
where emp_id = '214';

update vw_joinemp
set dept_title = '회계부'
where emp_id = 214;

-- delete (에러)
delete from vw_joinemp
where emp_id = 214;


select * from vw_joinemp;

-- 7. VIEW 옵션
-- WITH CHECK OPTION : 서브쿼리에 기술된 조건에 부합하지 않는 값으로 수정시 에러 발생
-- 급여가 3000000원 이상인 사원들만 조회한 select문을 vw_emp 뷰 정의
create or replace view vw_emp
as select * from employee
where salary >= 3000000;

-- 200번 사원의 급여를 200만원으로 변경 (vw_emp 이용해서)
update vw_emp
set salary = 2000000
where emp_id = 200;

-- with check option 사용
create or replace view vw_emp
as select * from employee
where salary >= 3000000
with check option;

-- 202번 사원의 급여를 200만원으로 변경
update vw_emp
set salary = 2000000
where emp_id = 202;-- 에러 발생

-- 202번 사원의 급여를 400만원으로 변경
update vw_emp
set salary = 4000000
where emp_id = 202;

select * from vw_emp;







