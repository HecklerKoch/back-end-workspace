/*
   GROUP BY
   - 그룹 기준을 제시할 수 있는 구문
   - 여러 개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용
*/
-- 각 부서별 조회
select dept_code,
count(*) "사원 수",
format(sum(salary), 0) "총 급여",
format(avg(salary), 0) "평균 급여",
min(salary) "최저 급여",
max(salary) "최고 급여" 
from employee
group by dept_code;

-- 직급 코드 별 사원수 조회
select job_code,
count(*) " 사원 수"
from employee
group by job_code;

-- 성별(남자/여자) 별 사원 수 조회
select count(*) "사원 수", if(substr(emp_no,8, 1) = 1, '남', '여') 성별
from employee
group by 성별;
/*
   HAVING
   -그룹에 대한 조건을 제시할 때 사용하는 구문
   
   5 SELECT    * | 조회하고자 하는 컬럼명 as 별칭 | 함수
   1 FROM       조회하고자 하는 테이블명
   2 WHERE      조건식 (연산자들 가지고 기술)
   3 GROUP BY   그룹 기준에 해당하는 컬럼명 | 함수
   4 HAVING     조건식 (그룹 함수를 가지고 기술)
   6 ORDER BY   컬럼명 | 컬럼순번 | 별칭 [ASC | DESC];
*/
-- 부서별 평균 급여가 300만원 이상인 부서의 평균 급여 조회
select dept_code, format(avg(salary),0)"평균급여"
from employee
group by dept_code
having avg(salary) >= 3000000;

-- 직급별 총 급여의 합이 1000만원 이상인 직급만 조회
-- 부서별 보너스를 받는 사원이 없는 부서만 조회
-- 부서별 보너스를 받는 사원들 수 조회
select job_code, format(sum(salary),0) "총 급여"
from employee
group by job_code
having sum(salary) >= 10000000;

select dept_code, count(bonus)
from employee
group by dept_code
having count(bonus) = 0;

select dept_code, count(*) -- 보너스가 null이 아닌 경우
from employee
where bonus is not null
group by dept_code;

/*
    rollup|cube(컬럼1, 컬럼2) (cube는 MySQL X) - 실제 볼일은 없는 집계 함수
    - 그룹멸 산출한 결과 값의 중간 집계를 계산 해주는 함수
    - rollup : 칼럼1을 가지고 다시 중간집계를 내는 함수
    - cube : 컬럼1을 가지고 중간집계도 내고, 컬럼2를 가지고도 중간집계를 냄 ,
    
    MySQL에서의 rollup
    컬럼1, 컬fma2 with rollup
    
    
*/

-- 부서별, 직급별 급여 합 조회
select job_code, job_code, sum(salary)
from employee
group by job_code, dept_code with rollup;

/*
    집합 연산자
    -여러 개의 쿼리문을 하나의 쿼리문으로 만드는 여산자alter
    -여러 개의 쿼리문에서 조회하려고 하는 컬럼의 개수와 이름이 같아야 사용할수 있다.
    
    주의! ORDER BY 절은 쓰시려먼 마짐ㅏ막 에만 기술 가능
    
    union (합집합) : 두 쿼리문을 수행한 결과값을 하나로 합쳐서 추출 (중복되는 행 제거)
    union all (합집합) : 두 쿼리문을 수행한 결과값을 하나로 합쳐서 추출(중복되는 행 제거 X)
    intersect (교집합) : 두 쿼리문을 수행한 결과값에 중복된 결과값만 추출 (MySQL X)
    minus (차집합) : 선행 쿼리문의 결과값에서 후행 퀄리문의 결과값을 뺀 나머지 결과값만 추출 (My SQL)
    --> INTERSECT, MINUS : where절에서 and 연산자를 사용해서 처리 가능!
*/
-- union
-- (1) 부서 코드가 D5인 사원들의 사번, 사원명, 부서코드, 급여 조회
select emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5'
union
-- (2) 급여가 300만원 초과인 사원들의 사번 사원명, 부서코드, 급여 조회
select emp_id, emp_name, dept_code, salary
from employee
where salary > 3000000;

-- 부서 코드가 D5 이거나 급여가 300만원 초과인 사원들의 사번, 사원명, 부서코드, 급여 조회
-- 위 쿼리문 대신 where
select emp_id, emp_name, dept_code, salary
from employee
where dept_code = 'D5' or salary >3000000;