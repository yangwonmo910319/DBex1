SELECT * FROM EMP 
WHERE JOB in ('MANAGER','CLERK') and
COMM is null and ename  LIKE '_L%'  ;

SELECT * FROM EMP 
WHERE SAL>2000 and DEPTNO in ('20','30');

SELECT * FROM EMP 
WHERE 3000>= SAL or sal>=2000;

SELECT * FROM EMP 
WHERE sal >2000 and sal>1000;

SELECT * FROM EMP 
WHERE ENAME LIKE '%E'  ;

----comm의 값이 null 이아닌 정보 조회
SELECT * FROM EMP 
WHERE COMM is not null  ;
----커미션을 받지 못하는 직원조회
SELECT * FROM EMP 
WHERE COMM is null  ;
----관리자가 없는 직원 정보 조회
SELECT * FROM EMP 
WHERE MGR is not null  ;
----급여를 많이 받는 직원 순으로 조회
SELECT * FROM EMP 
ORDER BY SAL;
----급여가 같을경우 커미션을 내림차순 정렬조회
SELECT * FROM EMP 
ORDER BY SAL ,COMM DESC;
----사원번호,사원명,직급,입사일 조회(입사일을 오름차순)
SELECT EMPNO,ENAME,JOB,HIREDATE
FROM EMP
ORDER BY HIREDATE
----사원번호,사원명 조회(사원번호 기준 내림차순 조회)
SELECT EMPNO,ENAME
FROM EMP
ORDER BY EMPNO DESC;
----사번,입사일,사원명,급여 조회
--(부서가 빠른순,같은부서는 최근 입사일순)
SELECT EMPNO,HIREDATE,ENAME,SAL
FROM EMP
ORDER BY EMPNO,HIREDATE desc;

--함수 저장 함수 사용자 정의 함수로 나누어짐
--내장 함수는 단일행 함수와 다중형(집계) 함수로 나누어짐
--DUAL 테이블 : 오라클 실습 계정에서제공하는 테이블로 함수나 계산식에서 테이블 참조없이 실행해 보기 위해 제공됨
--ABS : 절대값을 구하는 함수 
SELECT -10,abs(-10)FROM DUAL;
SELECT * FROM DUAL;
--ROUND : 반올림한 결과를 반환하는 함수 : ROUND(숫자,반올림 위치), 위치는 음수값도 줄수있음
SELECT ROUND(1234.5678) as ROUND,
       ROUND(1234.5678,0) as ROUND_0,
        ROUND(1234.5678,1) as ROUND_1,
       ROUND(1234.5678,2) as ROUND_2,
 ROUND(1234.5678,-1) as ROUND_MINUS1,
  ROUND(1234.5678,-2) as ROUND_MINUS2
  FROM DUAL;
------TRUNC 버림
  SELECT TRUNC(1234.5678) as TRUNC,
       TRUNC(1234.5678,0) as TRUNC_0,
        TRUNC(1234.5678,1) as TRUNC_1,
       TRUNC(1234.5678,2) as TRUNC_2,
       TRUNC(1234.5678,-1) as TRUNC_MINUS1,
        TRUNC(1234.5678,-2) as TRUNC_MINUS2
  FROM DUAL;

  -----MOD : 나누기한 나머지를 출력
    SELECT MOD(21,5) as MOD,
       MOD(20,9) as MOD_0       
  FROM DUAL;

---CEIL : 소수점 이하를 올림
    SELECT CEIL(21.55511) as CEIL, 
            CEIL(21.111111) as CEIL_1 
  FROM DUAL;
  ---FLOOR : 소수점 이하를 내림
    SELECT FLOOR(21.55511) as FLOOR, 
            FLOOR(21.111111) as FLOOR_1 
  FROM DUAL;
    ---POWER : 정수A 를 정수B 만큼 제곱하는 함수
    SELECT POWER(2,4) as POWER, 
            POWER(2,6) as POWER_1 
  FROM DUAL;

SELECT *
FROM emp
WHERE sal>=3000 AND deptno =20 AND hiredate < '82/01/01';

SELECT *
FROM emp
WHERE sal>=3000 AND (deptno = 20 or hiredate < '82/01/01');


SELECT *
FROM emp
WHERE sal>=2500 AND job='MANAGER';


SELECT *
FROM emp
WHERE deptno BETWEEN 20 and 30;


SELECT *
FROM emp
WHERE deptno not BETWEEN 20 and 30;


SELECT *
FROM emp
WHERE empno BETWEEN 7689 AND 9702;

SELECT *
from emp
WHERE hiredate not BETWEEN  '1980/0101' and '1980/12/31';


SELECT *
FROM emp
WHERE empno BETWEEN 7689 AND 9702;

--LIKE, NOT LIKE 연산자 : 일부문자열아 포함되어 있는지 여부를 확인하는 연산자,주로 검색에서 사용
-- % :길이와 성관없이 모든 문자를 의미
-- _: 문자 길이 1을 의미

SELECT empno,ename
FROM emp
WHERE ename LIKE '%O%';

SELECT empno,ename
FROM emp
WHERE ename LIKE '_L%' ;-- L앞에 문자 1개

SELECT empno,ename
FROM emp
WHERE ename LIKE '%AM%' ;
SELECT empno,ename
FROM emp
WHERE ename not LIKE '%AM%' ;

--null 값이 정해지지 않은 상태, 연산,할당,비교가 불가 is null 사용

SELECT *
FROM emp
WHERE comm is null;

SELECT ename,sal*12+comm as 연봉, comm
from emp;

SELECT *
FROM emp
WHERE mgr is null;


SELECT *
FROM emp
WHERE mgr is null;


SELECT *
FROM emp
WHERE mgr is null;

--문자 함수 : 문자 데이터를 가공하는 DELETE
SELECT ENAME,UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME)
FROM EMP;

SELECT *
FROM EMP
where UPPER(ENAME) = UPPER('james');
--SUBSTR / SUBSTRB
--데이터베이스 시작위치가 0이 아님,2번째 매개변수는 길이,3번째 매개변수는 생략하면 끝까지

SELECT LENGTH('한글'),LENGTH('한글')
FROM DUAL;

SELECT JOB,
SUBSTR(JOB,-length(job)),
SUBSTR(JOB,-length(job),2),
SUBSTR(JOB,-3)
FROM EMP;

--특정 문자가 포함된 행 찾기
SELECT * FROM EMP
where INSTR(ENAME,'S')>0;

SELECT * 
FROM EMP
WHERE ENAME LIKE '%S%';

--REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 경우 사용
--대치할 문자를 넣지 않으면 문자 삭제
SELECT '010-1234-5678' as REPLACE,
REPLACE ('010-1234-5678','','   ') as REPLACE_1, --공백으로 대체
REPLACE ('010-1234-5678' ,'-')as REPLACE_2--제거
from DUAL;

--LPAD/RPAD : 기준 공간의 칸 수를 특정 문자로 채우는 함수
SELECT LPAD('ORACL',10,'+')
FROM DUAL;
SELECT RPAD('ORACL',10,'+')
FROM DUAL;

SELECT 'OREACL',
 LPAD('ORACL',10,'+') as La_1,
 RPAD('ORACL',10,'+')as RA_1,
  LPAD('ORACL',10) as La_2,
 RPAD('ORACL',10)as RA_2
 from dual;

--개인 정보를 위하여 *표시 출력
SELECT
 RPAD('910319-',1,'*')as RA_2,
  RPAD('010-',10,'*')as RA_2
  from dual;


SELECT CONCAT(EMPNO,ENAME),
CONCAT(EMPNO,CONCAT('  :   ', ENAME))
from EMP
WHERE ENAME = ENAME;

SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;

 SELECT LTRIM('sssasasaasd     sss    ','s')
 FROM dual;

 --몇 개월 이후 날짜를 구하는 add_month 함수

 SELECT SYSDATE,
  ADD_MONTHS(SYSDATE,3)
  from DUAL;

  --개월 수 차이를 구하는 MONTHS_BETWEEN
  SELECT EMPNO,ENAME,HIREDATE,SYSDATE,
  MONTHS_BETWEEN(HIREDATE,SYSDATE) as MONTH1,
  MONTHS_BETWEEN(SYSDATE,HIREDATE) as MONTH2,
    TRUNC(MONTHS_BETWEEN(HIREDATE,SYSDATE) )as MONTH3,
    ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) as MONTH4
    FROM EMP;

--EXTRACT 날짜의 유형의 데이터로 부터 날짜 정보를 분리하여 새로운 컬럼의 형태로 만듬
SELECT EXTRACT(YEAR FROM DATE '2023-09-15') as 년도 추출
from DUAL;

SELECT * 
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE)= 12;

SELECT *
FROM EMP
WHERE HIREDATE LIKE '2023-09-15';

SELECT ENAME,EMPNO,ROUND(SAL,-2)--10자리 반오림
FROM EMP
ORDER By SAL;
SELECT *
FROM EMP
where MOD(EMPNO,2)=1;
SELECT *
FROM EMP

SELECT *
FROM EMP
where ENAME LIKE '__R%';
SELECT *
FROM EMP
where ENAME LIKE '%D';


--1981년 검색
SELECT *
FROM EMP
where EXTRACT(YEAR FROM HIREDATE)=1981;
--입사일로 40년 되는 날 조회
SELECT ENAME,EMPNO,ADD_MONTHS(HIREDATE,40*12)
FROM EMP;
--입사일 부터 38년 이상 근무한 직원
SELECT *
FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE)/12>=30;

SELECT EMPNO,EMPNO+'500'--문자->숫자 변환
FROM EMP;

--날짜,숫자를 문자로 변환하는 TO_CHAR 함수
-- SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH24-MI-SS') as "현재 날짜 시간"
-- FROM DUAL;
-- SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH24-MI-SS') as "현재날짜 시간"
-- FROM DUAL;
--    TO_CHAR(SYSDATE, 'CC') AS 세기,
--     TO_CHAR(SYSDATE, 'YY') AS 연도,
--     TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
--     TO_CHAR(SYSDATE, 'Q') AS 쿼터,
--     TO_CHAR(SYSDATE, 'DD') AS 일,
--     TO_CHAR(SYSDATE, 'DDD') AS 경과일,
--     TO_CHAR(SYSDATE, 'HH') AS "12시간제",
--     TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
--     TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
--     TO_CHAR(SYSDATE, 'W') AS 몇주차

--        TO_CHAR(SYSDATE, 'CC') AS 세기,
--     TO_CHAR(SYSDATE, 'YY') AS 연도,
--     TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
--     TO_CHAR(SYSDATE, 'Q') AS 쿼터,
--     TO_CHAR(SYSDATE, 'DD') AS 일,
--     TO_CHAR(SYSDATE, 'DDD') AS 경과일,
--     TO_CHAR(SYSDATE, 'HH') AS "12시간제",
--     TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
--     TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
--     TO_CHAR(SYSDATE, 'W') AS 몇주차

--        TO_CHAR(SYSDATE, 'CC') AS 세기,
--     TO_CHAR(SYSDATE, 'YY') AS 연도,
--     TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
--     TO_CHAR(SYSDATE, 'Q') AS 쿼터,
--     TO_CHAR(SYSDATE, 'DD') AS 일,
--     TO_CHAR(SYSDATE, 'DDD') AS 경과일,
--     TO_CHAR(SYSDATE, 'HH') AS "12시간제",
--     TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
--     TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
--     TO_CHAR(SYSDATE, 'W') AS 몇주차

--     SELECT SYSDATE,
--      TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
--      TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
--      TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
-- FROM DUAL;

-- SELECT SYSDATE,
--      TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
--      TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
--      TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
-- FROM DUAL;

--TO_NUMBER() : NUMBER 타입으로 형 변환
SELECT TO_NUMBER('1300') - '1000'
from dual;

--TO_DATE() : 날짜 타입으로 형 변환
SELECT TO_DATE('2022/08/02','yy/mm/dd') ,
TO_DATE('2022/08/02','yyyy/mm/dd') 
from dual;

--1981년 6월 1일 이후에 입사한 사원정보 출력
SELECT * FROM EMP
where HIREDATE > '01-jun-81';

SELECT * FROM EMP
where HIREDATE > TO_DATE ('19981/06/04','YYYY/MM/DD');

--NULL 처리 함수 : NULL은 값이 없음, 즉 할당되지 않음을 의미
--NULL은 0이나 공백과는 다른 의미,연산불가
-- NVL(NULL 인자를 검사할 열,앞의 열데이터가 NULL인경우 반환할 데이터)

SELECT EMPNO,ENAME,SAL,COMM,SAL+COMM,
NVL(COMM,0),SAL+NVL(COMM,0)
FROM EMP;

--NVL2() : NULL이 아닌경우와 NULL인 경우 모두에 대해서 값을 지정 할 수 있음
SELECT EMPNO,ENAME,COMM,
NVL2(COMM,'o','x') as "성과금 유무",
NVL2(COMM,SAL*12+COMM,SAL*12) as "연봉"
FROM EMP;

--NULLIF() : 두값이 동일하면 NULL 반환 아니면 첫번째 값 반환
SELECT NULLIF(10,10),NULLIF('A','B')
FROM DUAL;

--DECODE : 주어진 데이터 값이 조건 값과 일치하는 값 출력
--일치하는 값이 없으면 기본값 출력
SELECT EMPNO,ENAME,JOB,SAL,
DECODE(job,
'MANAGER',SAL*1.1,'SALESMAN',SAL*1.2,'ANALYST',SAL,
SAL*1.03) as 연봉협상
FROM EMP;

--CASE 문
SELECT EMPNO,ENAME,JOB,SAL,
CASE JOB
       WHEN'MANAGER' THEN SAL*1.1
        WHEN'SALESMAN' THEN SAL*1.1
         WHEN'ANALYST' THEN SAL*1.1
         ELSE SAL*1.03
         END as 연봉인상 
FROM EMP;

--열 값에 따라서 출력 값이 달라지는 CASE문
SELECT EMPNO,ENAME,
CASE 
WHEN comm is null THEN '해당 사항 없음'
WHEN comm = 0 THEN'수당 없음 '
WHEN comm > 0 THEN '없음 ' ||COMM
 END 
 FROM EMP;


 SELECT EMPNO,RPAD(SUBSTR(EMPNO,1,2),4,'*')as MASKING_EMPNO,
 ENAME,
 RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') as MASKING_NAME
FROM EMP 
WHERE LENGTH(ENAME) = 5;

SELECT EMPNO,ENAME,SAL,
TRUNC( SAL/21.5,2) as일급,
ROUND(SAL/21.5/8,1)as 시급
FROM EMP;
--NEXT_DAY() : 기준 일자 다음에 오는 날짜를 구하는 함수
SELECT EMPNO,ENAME,HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'MON'),'YYYY/MM/DD')as 정직원
      ,NVL(TO_CHAR(COMM),'N/A') as COMM
      FROM EMP;

SELECT EMPNO,ENAME,MGR,
 CASE
 WHEN MGR is NULL THEN'0000'
 WHEN SUBSTR(MGE,1,2)='78' TANH '8888'
 WHEN SUBSTR(MGE,1,2)='77' TANH '7777'
 WHEN SUBSTR(MGE,1,2)='76' TANH '6666'
 WHEN SUBSTR(MGE,1,2)='75' TANH '5555'
 WHEN SUBSTR(MGE,1,2)='75' TANH '5555'
 WHEN SUBSTR(MGE,1,2)='75' TANH '5555'
 END
 FROM EMP;

 --다중행 함수 : 여러 형에 대해 함수가 적용되어 하나의 결과를 나타내는 함수(집게 함수)
SELECT sum(sal)
FROM EMP;
SELECT sum(sal),ENAME
FROM EMP
group by ENAME;

--GROUP By : 결과 값을 그룹 별로 묶어줌!

SELECT sum(sal),ENAME
FROM EMP
group by ENAME
HAVING ENAME = 'FORD';

SELECT DEPTNO ,SUM(SAL),COUNT(*)
FROM emp
group by DEPTNO;
