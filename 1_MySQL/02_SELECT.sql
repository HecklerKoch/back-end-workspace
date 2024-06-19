/*
     -데이터베이스 : 데이터 (data) + 베이스(base)
     -DBMS : Database Managment System의 약자,, 데이터베이스 관리 시스템
     
     -관계형(Relational) 데이터베이스
     1.가장 대표적인 데이터베이스 시스템
     2.데이터를 테이블 형대로 저장하고 여러 테이블을 조합하여 비즈니스 관계를 도출하는 구조
     3.데이터의 중복을 최소화 할수 있므여 사용하기 편리하고 데이터의 무결성, 트랜젝션 처리 등 데이터베이스 관리 세스템으로 뛰어난 성능을 보여준다.
     
     - SQL(Structured Query Language)
     : 관계형 데이터베이스에서 데이터를 조회하거나 조작하기 위해 사용하는 표준 검색 언어
     
     -SQL 종류
      1. DML(Data Manipulation Language) : 데이터 조작어
         - 실제 데이터를 조직하기 위해 사용하는 언어
         (INSERT : 추가, UPDATE : 수정, DELETE : 삭제, SELECT)
	  2. DQL(Data Query Language) : 데이터 질의어
         - 데이터를 조회(검색)하기 위해 사용되는 언어
      3.DCL(Data Control Language) : 데이터 제어어
         - DBMS에 대한 보안, 무결성, 복구 등 DBMS를 제어하기 위한 언어
	  4.DDL(Data Definition Language) : 데이터 정의어
      -DBMS의 구조를 정의하거나 변경, 삭제하기 위해 사용되는 언어
      (CREATE : 생성, ALTER : 수정, DROP : 삭제) - 테이블 변경과 관련
      5.TCL (Tra
      */
      
      /*
      SELECT 컬럼, [컬럼,...]
      FROM 테이블명
      
      - 테이블에서 데이터를 조회할 때 사용하는 SQL
      - SELECT를 통해서 조회된 결과를 RESULT SET 이라고 한다. (즉, 조회된 행들의 
      */
      
      -- employee 테이블에 전체 사원의 모든 칼럼(*) 정보 조회
      SELECT *
      FROM employee;
      
      -- employee 테이블의 전체 사원들의 사번(emp-id), 이름(emp-name),
      -- 급여(salary)만을 조회
      SELECT emp_id, emp_name, salary
      FROM EMPLOYEE;
      
      -- 관례상 대문자로 작성
      
      -- 실습문제 ------------
      -- 1. job 테이블의 모든 정보 조회
      
      -- 2. job 테이블의 직급 이름(job_name) 조회
      
      -- 3. department 테이블의 모든 정보 조회
      
      -- 4. employee 테이블의 직원명(emp_name), 이메일(email),전화번호(phone), 입사일(hire_date) 정보만 조회
      
      -- 5. employee 테이블의 입사일(hire_date), 직원명(emp_name),
      -- 급여(salary) 조회
      
      SELECT *
      FROM JOB;
      
      SELECT job_name
      FROM job;
      
      SELECT *
      FROM department;
      
      SELECT emp_name, email, phone, hire_date
      FROM employee;
      
      SELECT hire_date, emp_name, salary
      FROM employee;
      
      /*
          컬럼 산술 연산
          - SELECT 절에 컬럼명 입력 부분에 산술연산자를 사용하여 결과를 조회할수 있다.
      */
       -- employee 테이블에서 직원명(emp_name), 직원연봉analyze
       
       /*
       컬럼 별칭
       켤럼 as 별칭 / 컬럼 as "별칭" / 컬럼 별칭 / 컬럼 "별칭"
       
       - 산술연산을 하면 컬럼명이 지저분해진다.
       이때 컬럼명에 별칭을 부여해서 깔끔하게 보여줄수 있다.
       -별칭을 부여할 때 띄어쓰기 혹은 특수문자가 포함될 경우 반드시 큰따옴표(")로 감싸준다
       */
       SELECT emp_name 직원명,
       salary "직원 월급",
       salary * 12 as 연봉
       FROM employee;
       
       
       /*
       리터럴 
       - SELECT 절에 리터럴을 사용하면 테이블에 존재하는 데이터 처럼 조회가 가능
       */
	-- employee 테이브렝서 사번,(emp_id), 직원명(emp_name), 급여(salary),
    -- 단위(원) 조회
    
    SELECT emp_id, emp_name, salary, '원'
    FROM employee;
    
    /*
     DISTINCT
	 - 컬럼에 중복된 값들을 한번씩만 표시하고자 할 때 사용
     -- employee 테이블에 직급코드(job_code) 조회
    */
         SELECT job_code
     FROM employee;
     
     -- employee 테이블에 부서코드 (dept-code) 조회
     SELECT dept_CODE
     from employee
     
     -- employee 테이블에 직급코드, 부서코드 조회
     -- 유희사항! dIStinct는 select 절에 딱한번만 기술 가능-
     SELECT DISTINCT job_code, dept_code
     FROM employee;
     
     /*
     where 절
     SELECT 컬럼, 컬럼, ...
	 where 조건식;
     
     -조회하고자 하는 테이블로 부투
     
     비교연산자 >, <, >=, <= : 대소 비교
     = : 같은지 비교
     !=, ^=, <> : 같지 않은지 비교
     */
     
     -- employee에서 부서코드가 'D9'인 사원들만 조회 (이때, 모든 컬럼 조회)
     
     select*
     from employee
     where dept_code= 'D9';
     
     -- 실습문제 (테이블 : employee) ---
     -- 1. 부서코드가 'D1'인 사원들의
     -- 사원명, 급여, 부서코드만 조회
       select emp_name, salary, dept_code
       from employee
       where dept_code= 'D1';
     -- 2. 부서코드가 'D1'이 아닌 사원들의 사번, 사원명, 부서코드 조회
     select emp_id, emp_name, dept_code
     from employee
     where dept_code!= 'D1';
     -- 3. 급여가 400만원 이상인 사원들의 사원명, 부서코드, 급여조회
     select emp_name, dept_code, salary
     from employee
     where salary >= 4000000;
     -- 4.재직중(ent_yn 컬럼값이 'N')인 사원들의 사번, 사원명,입사일 조회
     select emp_id, emp_name, hire_date
     from employee
     where ent_yn= 'N';
     
     -- OR(또는), AND(그리고)
     -- 부서코드가 'D6'이거나 급여가 300만원 이상인 사원들의 사원명, 부서코드, 급여 조회
     
     select emp_name, dept_code, salary
     from employee
     where dept_code = 'D6' OR salary >= 3000000;
     
     -- 급여가 350만원 이상 600만원 이하를 받는 사원들의 사원명, 사번, 급여 조회
     
     select emp_name, emp_id, salary
     from employee
     where salary >= 3500000 and salary <= 6000000;
     
     /*
	BETWEEN AND
    - 조건식에서 사용되는 구문
    - 몇 이상 몇 이하인 범위에 대한 조건을 제시할 때 사용되는 연산자
    
    비교대상컬럼 between 하한값 and 상한값
     */
     
     select emp_name, emp_id, salary
     from employee
     where salary between 3500000 and 6000000;
     
     -- 입사일(hire_date)이 '1990-01-01' ~ '2001-01-01' (몯느 컬럼 조회)
     
     select *
     from employee
     where hire_date between '1990-01-01' and '2001-01-01';
     
     /*
       LIKE
       - 비교하고자 하는 컬럼값이 내가 제시한 특정 패턴에 만족될 경우 조회
       
       비교대상칼럼 LIKE '특정패턴'
       - 특정패턴에는 '%','_' 를 와일드카드로 사용
       
       '%' : 0글자 이상
       비교대상칼럼 LIKE '문자%' => 비교대상컬럼값이 문자로 "시작"되는걸 조회
       비교대상칼럼 LIKE '%문자' => 비교대상칼럼값이 문자로 "끝"나는걸 조회
       비교대상칼럼 LIKE '%문자%' => 비교대상칼럼값이 문자가 "포함"되는걸 조회 (키워드 검색)
       
       '_' : 1글자
       비교대상칼럼 LIKE '_문자' => 비교대상컬럼값에 문자앞에 무조건 한글자가 올 경우 조회
       비교대상칼럼 LIKe  '__문자' => 비교대상칼럼값에 문자앞에 무조건 두 글자가 올 경우 조회
       비교대상 칼럼 LIKE '_문자_' => 비교대상칼럼에 문자 앞과 뒤에 무조건 한글자씩 올 경우
     */
     -- 사원들 중 성이 전씨인 사원들의 사원명, 급여, 입사일 조회
     select emp_name, salary, hire_date
     from employee
	 where emp_name like '전%';
     -- 이름 중에 '하'가 포함된 사원들의 사원명, 주민번호, 전화번호 조회
     select emp_name, emp_no, phone
     from employee
     where emp_name like '%하%';
     -- 이름의 가운데 글자가 '하'인 사원들의 사원명, 전화번호 조회 (이름이 3글자)
     select emp_name, phone
     from employee
     where emp_name like '_하_';
     -- 전화번호의 3번째 자리가 1인 사원들의 사번, 사원명, 전화번호, 이메일 조회
     select emp_id, emp_name, phone, email
     from employee
     where phone like '__1%';
     
     -- 이메일 중 _ 앞글자가 3글자인 사원들의 사번, 이름, 이메일 조회
     -- 예) sun_di@kh.or.kr
     -- ESCAPE OPTION : 나만의 와일드 카드를 만들어서 사용!
     -- 만약 ESCAPE가 기억 안난다면 \도 가능
     select emp_id, emp_name,email
     from employee
     where email like '___$_%' escape '$';
	
     -- 위의 사원들 이외의 사원들 조회
     -- 논리부정연산자 : NOT
     
     select emp_id, emp_name, email
     from employee
     where email not like '___$_%' escape '$';
     
     /*
     IS NULL / IS NOT NULL
     - 컬럼값에 NULL이 있을 경우 NULL 값 비교에 사용되는 연산자
     */
     
     -- 보너스를 받지않는 사원(bonus 값이 null)들의 사번, 이름, 급여, 보너스 조회
     select emp_id, emp_name, salary, bonus
     from employee
     where bonus is null;
     
     -- 부서배치를 아직 받지 않고 보너스는 받은  사원들의 이름, 보너스, 부서코드 조회
     select emp_name, bonus, dept_code
     from employee
     where dept_code is null and bonus is not null;
     
     
     /*
       IN
       - 비교대상컬럼값이 내가 제시한 목록 중에 일치하는 값이 있는지
       비교대상컬럼 IN ('값1', '값2', ....)
     
     */
     
     -- 부서코드가 D5, D6, D8인 부서원들의 이름, 부서코드, 급여 조회
     select emp_name, dept_code, salary
     from employee
     where dept_code in ('D5', 'D6', 'D8');
     
     /*
      연산자 우선순위
      0. ()
      1. 산술연산자 : +, -, *, /, DIV, %, MOD
      2. 비교연산자 : =, !=, <>, <, <=, >, >=
      3. IS NULL / LIKE / IN
      4. BETWEEN AND
      5. NOT
      6. AND
      7. OR
     */
     
     
     /*
     ORDER BY
     - SELECT문 가장 마지막 줄에 작성 뿐만 아니라 실행순서 또한 마지막에 실행
     
     SELECT 컬럼, 컬럼, ...
     FROM 테이블명
     WHERE 조건식
     ORDER BY 정렬하고자 하는 컬럼값 [ASC][DESC];
     
     - ASC : 오름차순 정렬 (생략시 기본값)
     - DESC : 내림차순 정렬
     */
-- 전체 사원의 사원명, 보너스 조회
select emp_name, bonus
from employee
order by 1 asc;


/*
      LIMIT
      - ORDER BY 절 보다 뒤에 조건을 걸고 싶을 때 사용
      - 출력되는 행 수를 제한하는 MySQL 전용 비표준 구문
      - 데이터 양을 제한하고자 할 때 유용 (페이징 처리)
*/

-- 연봉이 높은 5명의 사원의 사원명, 급여 조회
select emp_name, salary
from employee
order by salary desc
limit 5;

-- LIMIT 절은 두 개의 값이 있을 수 있음!
-- 첫번째 값은 오프셋(offset, 0부터 시작) 시작 행을 지정
-- 두번째 값은 반환할 최대 행 수를 지정
select emp_name, salary
from employee
order by salary desc
limit 0, 10;

select emp_name, salary
from employee
order by salary desc
limit 10 offset 0;


-- 실습문제 ----
-- 1. 직급코드(job_code)가 J7 이거나 J2 인 사원들 중 급여가 200만원 이상인 사원들의 모든 컬럼 조회
select *
from employee
where job_code in ( 'J7', 'J2') and salary >= 2000000;

-- 2. 사수가 없고 부서배치도 받지 않은 사원들의 사원명 사수사번(manager_id), 부서코드 조회
select emp_name, manager_id, dept_code
from employee
where manager_id is null and dept_code is null;

-- 3. 연봉(보너스미포함)이 4000만원 이상이고 보너스를 받지 않는 사원들의 사번, 사원명, 급여, 보너스 조회
select emp_id, emp_name, salary, bonus
from employee
where salary * 12>= 40000000 and bonus is null;

-- 4. 입사일이 '1995-01-01' 이상이고 부서배치를 받은 사원들의 사번, 사원명, 입사일, 부서코드 조회 (정렬은 입사한 기준)
select emp_id, emp_name, hire_date, dept_code
from employee
where hire_date >= '1995-01-01' and dept_code is not null
order by hire_date;

-- 5. 급여가 200만원 이상 500만원 이하이고 입사일이 '2001-01-01' 이상이고 보너스를 받지 않은 사원들의 사번, 사원명, 급여, 입사일, 보너스 조회
select emp_id, emp_name, salary, hire_date, bonus
from employee
where salary between 2000000 and 5000000 and hire_date >= '2001-01-01' and bonus is null
order by emp_id;

-- 6.보너스 포함 연봉이 NULL이 아니고 이름에 '하' 가 포함되어 있는 사원들의 사번, 사원명, 급여, 보너스 포함 연봉(별칭부여) 조회
--   보너스 포함 연봉 : (SALARY + SALARY * BONUS) * 12
select emp_id, emp_name, salary, bonus, ((salary + salary * bonus) * 12) "보너스 포함 연봉"
from employee
where ((salary + salary * bonus) * 12) is not null and emp_name like '%하%'
order by ((salary + salary * bonus) * 12) desc;