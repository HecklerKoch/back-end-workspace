/*
    함수 : 전달된 컬럼값을 읽어들여서 함수를 실해한 결과를 반환
    
    - 단일행 함수 : N개의 값을 읽어서 N개의 결과값 리턴 (매 행마다 함수 실행 결과 반환)
    -그룹 함수 : N개의 값을 읽어서 1개의 결과값 리턴 (그룹별로 함수 실행 결과 반환)

>> SELECT 절에 단일행 함수와 그룹 함수는 함께 사용하지 못하!
   왜? 결과 행의 개수가 다륵, 때문에!
   
>> 함수를 사용할 수 있는 위치 : SELECT, WHERE, ORDER BY, GROUP BY, HAVING
*/

-- 단일행 함수

/*
    문자 처리 함수
    
    LENGTH : 해당 문자열값의 BYTE 길이 수 반환
    - 한글 한 글자 -> 3 BYTE
    - 영문자, 숫자, 특수문자 한글자 -> 1BYTE
    CHAR_LENGTH : 해당 문자열값의 글자 수 반환
*/

SELECT length('테이터베이스'), char_length('데이터베이스'),
length('database'), char_length('database');

-- 사원명(emp_name), 사원명의 글자수, 이메일, 이메일의 글자수 조회

select emp_name, char_length('emp_name'),
email, char_length('email')
from employee;

/*
 INSTR(컬럼|'문자열', '찾으려는 문자열')
 -특정 문자열에서 찾고자 하는 문자열의 위치 반환
 -없으면 0 반환
*/

SELECT instr('AABAACAABBAA', 'B'), instr('AABAACAABBAA', 'D'); -- 3, 0


-- 's'가 포함되어 있는 이메일 중 이메일, 이메일의 @ 위치 조회
select email, instr(email, '@')
from employee
where email like '%s%';

/*
   LPAD|RPAD(컬럼|'문자열', 최종적으로 반환할 문자의 길이, '덧붙이고자 하는 문자')
   - 문자열에 덧붙이고자 하는 문자를 왼쪽 또는 오른쪽에 덧붙여서
   최종적으로 반환할 문자의 길이만큼 문자열 반환
*/

select lpad('hello', 10, '*'), rpad('hello', 10, '+');

/*
   TRIM(컬럼|'문자열') | TRIM([LEADING|TRAILING|BOTH] 제거하고자하는문자들 FROM 컬럼|'문자열)
   - 문자열의 앞/뒤/양쪽에 있는 지정한 문자들을 제거한 나머지 문자열 반환
*/



select trim('        K H        '); -- 기본건으로 양쪽에 있는 공백 제거
select trim(Both ' ' FROM '          K H          ');

select trim(Leading 'Z' from 'ZZZKHZZZ'); -- KHZZZ <-- 문자 제거는 LEADING
select ltrim('      K H       '); -- LTRIM : 앞쪽 공백만 제거

select trim(trailing 'Z' from 'ZZZKHZZZ'); -- ZZZKH
select rtrim('       KH         '); -- RTRIM : 뒤쪽 공백만 제거

/*
 SUBSTAR|SUBSTRING(컬럼|'문자열', 시작 위치 값, 추출할 문자 개수)
 - 문자열에서 특정 문자열을 추출해서 반환
*/

select substr('PROGRAMMING', 5, 2);
select substr('PROGRAMMING', 1, 6);
select substr('PROGRAMMING', -8, 3);

-- 여자 사원들의 이름, 주민번호(emp_no), 조회
select emp_name, emp_no, substr(emp_no, 8, 1)
from employee
where substr(emp_no, 8, 1) in (2, 4);

-- 남자 사원들의 이름, 주민번호 조회
select emp_name, emp_no
from employee
where substr(emp_no, instr(emp_no, '-')+1, 1) in (1,3);

/*
 LOWER : 다 소문자로 변경한 문자열 반환
 UPPER : 다 대문자로 변경한 문자열 반환
*/

select lower('Welcome To MySQL'), upper('Welcome To MySQL');

/*
  REPLACE(컬럼|'문자열', '바꾸고 싶은 문자열', '바꿀 문자열')
  - 특정 문자열로 변경하여 반환
*/

select replace('서울특별시 강남구 역삼동', '강남구', '서초구');

/*
  CONCAT : 문자열을 하나로 합친 후 결과 반환
*/

select concat('가나다라', 'ABCD', '1234');

-- 실습문제 ---
-- 1. 이메일의 kh.or.kr을 gmail.com으로 변경해서 이름, 변경 전 이메일, 변경 후 이메일 조회
select emp_name, email, replace(email, 'kh.or.kr', 'gmail.com')
from employee;
-- 2. 사원명과 주민등록번호(000000-0******)으로 조회
select emp_name, replace(emp_no, substr(emp_no, 9, 14), '******') /* replace(emp_no, substr(emp_no -6, 6), '******') 
rpad(substr(emp_no, 1, 8), char_length(emp_no), "*") concat concat(substr(emp_no, 1, 8), 000000) */
from employee;
-- 3.사원명, 이메일, 이메일에서 추출한 아이디 조회(@ 앞)
select emp_name, email, replace(email, '@kh.or.kr', '') /*substr(email, 1, instr(email, '@')-1) trim(both '@kh.or.kr' from email)
from employee; */

/*
   숫자 처리 함수
   
   ABS : 절대값 반환
   
*/

select abs(5.6) abs(-10);

/*
     숫자 DIV 숫자 = 숫자 / 숫자
     숫자 MOD 숫자 = 숫자 % 숫자 = MOD(숫자, 숫자)
*/

select
10 div 3, 10/ 3
10 MOD 3, 10% 3, mod(10, 3);

/*
 ROUND(숫자, [위치])
 - 반올림 결과를 반환
*/

select round(123.567), round(123.567, 2), round(123.567, -1)

/*
 CEIL(숫자)
 - 올림 처리해서 반환
*/

select ceil(123.152), floor(123.952)

/*
TRUNCATE (숫자, 위치)
- 위치 지정하여 버림 처리해서 반환
\
*/

select truncate(123.456, 1) 

/*
   날짜 처리 함수
   NOW, CURREMT_TOMESTAMP : 현재 날짜와 시간 반환
   CURDAT, CURRENT_DATE ; 현재 날짜 반환
   CURTIME, CURRENT_TIME :현재 시간 반환
*/
select now(), current_timestamp(),
curtime(), current_time();

/*
DAYOFYEAR : 날짜가 해당 연도에서 몇 번째 날인지 반환
DAYOFMONTH : 날짜가 해당 월에서 몇 번째 날인지 반
DAYOFWEEK : 날짜가 해당 주에서 몇번째 날인지 반환 (일요일 = 1, 토요일 = 7)
*/

SELECT dayofyear(now()), dayofmonth(now()), dayofweek(now()

/*
 PERIOD_DIFF(날짜,날짜) : 두 기간의 차이를 숫자로 변환
 DATEDIFF(날짜, 날짜) : 두 날싸 사이의 일수를 숮자러 변환
 TIMEDIFF(날짜, 날짜) : 두 시간의 차이를 날짜 형식으로 반환
 TIMESTAMPDIFF (날짜단위, 날짜, 날짜) : 두 날짜 사이의 기간을 날짜 단위에 따라 변환
 
 *날짜단위: YEAR(연도), QUARTER(분기), MONTH(윌), WEEK(주), DAY(일), HOUR(시간), MINUTE(분), SECOND (초)
*/

select period_diff(202406, 202411). period_diff(202412, 202406);
select datediff('20241231', now()), timeoff('2025-01-01 00:00:00' , now());

-- 직원명, 입사일, 근무 일 수, 근무 개월 수 , 근무 년 수 조회 select emp_name,hire_date,
timestampdiff(day, hire_date, now()) "근무 일수",
timestampdiff(month, hire_date, now()) "근무 월 수"
timestampdiff(year, hire_date, now()) "근무 년수"
from employee;

/*
 ADDDATE (날짜,I INTERVAL 숫자 날짜단위
 ADDTIME(날짜, 시간정보)
 - 특정 날짜에 입력받은 정보만큼 더한 날짜를 반환
 
 SUBDATE ( 날짜, INTERVAL 숫자 날짜단위)
 SUBTIME (날짜, 시간정보)
 - 특정 날짜에 입력 받은 정보만큼 뺀 날짜를 반환
*/

select-
now(),
adddate(now(), interval 10 year),
subdate(now(), interval 15 day),
addtime(now(), "01:10:00"),
subtime(now(), "01:00:00");

-- 직원명, 입사일, 입하 후 6개월이 된 날짜를 조회

select emp_name, hire_date, adddate(hire_date, interval 6 month)
from employee;

/*
   LAST_DAY : 해당 월의 마지막 날짜를 반환
*/

select last_day(now());

/*
  YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
  - 특정 날짜에 연도, 월, 일, 시간, 분, 초 정보를 각각 추출해서 반환
*/

select year(now)), month(now)), day(now)),
hour(now)), minute(now)), second(now));

-- 연도별 오래된 순으로 직원명, 입사년도, 입사월, 입사일 조회





select now(), 
date_format(now(), '%Y.%m.%d'), -- %Y : 년도, %m : 월, %d : 일
date_format(now(), '%Y.%m.%d %T'); -- %T : 시간 전체, %H : 시, %i : 분, %s : 조

-- 직원명, 입사일 (2024년 06월 19일 14시 05분 30초) 조회
select emp_name, date_format(hire_date, '%Y년.%m월.%d일.%H시.%i분.%s초')
from employee;

/*
  null 처리 함수
  
  COALESCE|IFNULL(값, 값이 NULL일 경우 반환할 값)
*/
select emp_name, ifnull(bonus, 0)
from employee;

-- 전 사원의 직원명, 보너스, 보너스 포함 연봉(급여 + 급여 * 보너스) * 12 조회
select emp_name, bonus, (salary + salary * ifnull(bonus, 0)) * 12 as 연봉
from employee;

-- 직원명, 부서코드 조회 (부서코드가 없음녀 '부서없음')
select emp_name, ifnull(dept_code, '부서없음')
from employee;

/*
  NULLIF (값1, 값2)
  - 두 개의 값이 동일하면 null 반환, 두개의 값이 동일하지 않으면 값1 반환
*/
select nullif('123', '123'), nullif('123', '456');

/*
   IF(값1, 값2, 값3) | IF(조건, 조건이 True인 경우, 조건이 False인 경우)
   - 값1이 null이 아니면 값2 반환, null 이면 값3 반환
   - 조건에 해당하면 두번째 값 반환, 해당하지 않으면 마지막 값 반환
*/
select emp_name, bonus, if(bonus, 0.7, 0.1)
from employee;

-- 직원명, 부서 코드가 있으면 '부서있음', 없으면 '부서없음' 조회
select emp_name, if(dept_code is not null, '부서있음', '부서없음')
from employee;

-- 사번, 사원명, 주민번호, 성별 - emp_no 활용해서 조회
select emp_id, emp_name, emp_no,
if(substr(emp_no,8, 1) = 1, '남', '여') 성별
from employee;

-- 사원명, 직급코드, 기존급여, 인상된 급여 조회
-- 정렬 : 직급코드 J1부터, 인상된 급여 놓은 순서대로
-- 직급코드가 J7인 사원은 급여를 10% 인상
-- 직급코드가 J6인 사원은 급여를 15% 인상
-- 직급코드가 J5인 사원은 급여를 20% 인상
-- 그 외의 직급의 사원은 급여를 5%만 인상

select emp_name, job_code, salary, 
format(if(job_code = 'J7', salary * 1.1 , 
if(job_code = 'J6', salary * 1.15, 
if(job_code = 'J5', salary * 1.2, salary * 1.05))), 0) as 급여인상
from employee
order by job_code, 급여인상 desc;

/*
    CASE WHEN 조건식 1 THEN 결과값 1
	     WHEN 조건식 2 THEN 결과값 2
         ....
         ELSE 결과값 N
	END
    -> if - else if - else 문과 유사
*/

select emp_name, job_code, salary,
format(case when job_code = 'J7' then salary * 1.1
     when job_code = 'J6' then salary * 1.15
     when job_code = 'J5' then salary * 1.2
     else salary * 1.05
end, 0) as 인상급여
from employee
order by job_code, 인상급여 desc;

-- 사원명, 급여, 급여 등급(1 ~ 4등급) 조회
-- salary 값이 500만원 초과일 경우 1등급
-- salary 값이 500만원 이하 350만원 초과일 경우 2등급
-- salary 값이 350만원 이하 200만원 초과일 경우 3등급
-- 그 외의 경우 4등급

select emp_name, salary, 
case when salary > 5000000 then '1등급'
     when salary > 3500000 then '2등급'
     when salary > 2000000 then '3등급'
     else '4등급' 
end class
from employee;

-- 그룹함수(집계함수) -----
/*
    그룹함수 --> 결과값 1개!
    - 대량의 데이터들로 집계나 통계 같은 작업을 처리해야 하는 경우 사용되는 함수들
    - 모든 그룹 함수는 NULL 값을 자동으로 제외하고 값이 있는 것들만 계산
    
	SUM : 해당 컬럼 값들의 총 합계 반환
*/
-- 전체 사원의 총 급여 합 조회
select sum(salary)
from employee;

-- 부서코드가 D5인 사원들의 총 연봉(급여 * 12) 조회

select sum(case when dept_code = 'D5' then salary * 12
end) as D5
from employee;

select sum(salary *12) as 'D5'
from employee
where dept_code = 'D5';

/*
  AVG
  -해당 컬럼 값들의 평균값을 반환
  -모든 그룹 함수는 NULL 값을 자동으로 제외하기 때문에
   AVG 함수를 사용할 때는 COALESCE 또는 IFNULL 함수와 함께 사용하는 걸 권장
*/
-- 전체 사원의 급여, 평균 보너스율 조회
select avg(salary), avg(bonus),
avg(ifnull(salary, 0)), avg(ifnull(bonus, 0))
from employee;

/*
   MIN : 해당 컬럼 값들 중에 가장 작은 값 반환
   MAX : 해당 컬럼 값들 중에 가장 큰 값 반환
*/
select
min(emp_name), min(salary), min(hire_date),
max(emp_name), max(salary), max(hire_date)
from employee;

/*
   COUNT
   - 컬럼 또는 행의 개수를 세서 반환
   
   * : 조회 결과에 해당하는 모든 행 걔수 반환
   컬럼 : 해당 컬럼 값이 NULL이 아닌 행 개수 반환
   distinct 컬럼 : 해당 컬럼값의 중복을 제거한 행 개수 반환
*/
-- 전체 사원 수 조회
select count(*)
from employee;

-- 보너스를 받은 사원 수 조회
select count(bonus)
from employee;

select count(*)
from employee
where bonus is not null;

-- 현재 사원들이 속해 있는 부서 수 조회
select count(distinct dept_code)
from employee;

-- 퇴사한 직원의 수 조회 (ent_date 또는 ent_yn)
select count(ent_date) as "퇴사자"
from employee;

select count(*) as "former worker"
from employee
where ent_yn = 'Y';