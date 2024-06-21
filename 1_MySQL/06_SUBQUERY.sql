/*
    서브쿼리(SUBQUERY), 중첩쿼리
    - 하나의 SQL문 안에 포함된 또 다른 SQL문
    - 서브쿼리를 수행한 결과값이 몇 행 몇 열이냐에 따라 분류
    - 서브쿼리 종류에 따라 서브퀄리와 사용하는 연산자가 달라짐
    
    1. 단일행 서브쿼리(SINGLE ROW SUBQUERY)
    - 서브쿼리의 조회 결과값의 개수가 오로지 1개일 때 (한 행 한 열)
    - 일반 비교연산자 사용 가능 : =, !=, <>, >, <, >=, <=, ...
    
*/

-- 노옹철 사원과 같은 부서원들을 조회
-- 1) 노옹철 사원의 부서코드 조회
select dept_code from employee
where emp_name = '노옹철'; -- D9

-- 2) 부서코드가 'D9'인 사원들 조회
select * from employee
where dept_code = 'D9';

-- 3) 위의 2단계를 하나의 쿼리문으로!
select *
from employee
where dept_code = ( select dept_code from employee
where dept_code = 'D9');

-- 전 직원의 평균 급여보다 더 많은 급여를 받는 사원들의 사번, 사원명, 직급코드, 급여 조회
-- 1) 전직원 경균 급여 조회

select avg(salary)
from employee; -- 3047662,6087

-- 2) 3047662,6087보다 더 많은 급여를 받은 사원들의 사번. 상원명, 직급코드. 금여 조회
select emp_id, emp_name, job_code, salary
from employee
where salary > (select avg(salary)
from employee);

-- 전지연 사원 속해있는 부서원들의 사번, 직원명, 전화번호, 직급명, 부서명, 입사일 조회
-- 단, 전지연 사원은 제외

-- 1) 전지연 사원이 속해있는 부서코드 조회
select *
from employee
where emp_name = '전지연';

-- 2) 부서코드가 D1인 직원들의 사번, 직원명, 전화번호, 직급명, 부서명, 입사일 조회
select emp_id, emp_name, phone, job_name, dept_title, hire_date
from employee
join job using (job_code)
join department on (dept_code = dept_id)
where dept_code = ( select dept_code
from employee
where emp_name = '전지연')
and emp_name != '전지연';

-- 부서별 급여의 합이 가장 큰 부서 코드, 급여의 합 조회
-- ) 각 부서별 최괴 급여
select max(salary)
from employee
group by dept_code





/*
     컬럼 > ANY(서브쿼리) : 여러개의 결과값 중에서 "한개라도" 클 경우
     컬럼 < ANY(서브쿼리) : 여러개의 결과값 중에서 "한개라도" 작을 경우
     --> OR
*/
-- 대리 직급임에도 과장 직급들의 최소 급여보다 많이 받는 직원의 사번, 이름, 직급, 급여 조회
-- 1) 과장 직급들의 급여
select salary
from employee
join job using (job_code)
 where job_name = '과장';
 
 select emp_id, emp_name, job_name, salary
 from employee
 join job using (job_code)
 where job_name = '대리'
 and salary > any ( select salary
from employee
join job using (job_code)
 where job_name = '과장');
 
 /*
      컬럼 > all (서브쿼리) : 여러개의 "모든" 결과값들 보다 클 경우
      컬럼 < all (서브쿼리) : 여러개의 "모든" 결과값들 보다 작을 경우
 */
-- 과장 직급임에도 차장 직급의 최대 급여보다 더 많이 받는 사원들의 사번, 이름, 직급, 급여 조회
-- 차장 직급의 급여들
 select salary
from employee
join job using (job_code)
 where job_name = '차장';
 
 select emp_id, emp_name, job_name, salary
 from employee
 join job using (job_code)
 where job_name = '과장'
   and salary > ALL (select salary
from employee
join job using (job_code)
 where job_name = '차장');
 
 /*
     3. 다중열 서브쿼리 
     - 서브쿼리의 조회 결과값이 한 행이지만 컬럼이 여러개일 때 (한 행 여러 열)
 */
 -- 하이유 사원과 같은 부서 코드, 같은 직급코드에 해당하는 사원들의 사원명, 부서코드, 직급코드 조회
select dept_code
from employee
where emp_name = '하이유';

select job_code
from employee
where emp_name = '하이유';

select emp_name, dept_code, job_code
from employee
where dept_code = (select dept_code
from employee
where emp_name = '하이유')
and job_code = (select job_code
from employee
where emp_name = '하이유');

select dept_code, job_code
from employee
where emp_name = '하이유';

select emp_name, dept_code, job_code
from employee
where (dept_code, job_code) = ( select dept_code, job_code
from employee
where emp_name = '하이유');

-- 박나라 사원과 직급코드가 일치하면서 같은 사수를 가지고 있는
-- 사원의 사번, 이름, 직급코드, 사수사번 조회
select job_code, manager_id
from employee
where emp_name = '박나라';

select emp_id, emp_name, job_code, manager_id
from employee
where (job_code, manager_id) = ( select job_code, manager_id
from employee
where emp_name = '박나라');

/*
	4. 다중행 다중열 서브쿼리
    - 서브쿼리의 조회 결과값이 여러 행, 여러 열일 경우
*/
-- 각 직급별로 최소 급여를 받는 사원들의 사번, 이름, 직급코드, 급여 조회
-- 각 직급별로 최소 급여
select job_code, min(salary)
from employee
group by job_code;

select emp_id, emp_name, job_code, salary
from employee
where (job_code, salary) in (select job_code, min(salary)
from employee
group by job_code);

-- 각 부서별 최대 급여를 받는 사월들의 사번, 이름, 부서코드, 급여 조회 (부서없음 명시)
select dept_code, max(salary)
from employee
group by dept_code;

select emp_id, emp_name, ifnull(dept_code,'부서없음') as dept_code, salary
from employee
where (ifnull(dept_code,'부서없음'), salary) in (select ifnull(dept_code,'부서없음'), max(salary)
from employee
group by dept_code); 

