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

SELECT count(*),JOB FROM EMP 
group BY JOB;

SELECT round(AVG(sal))
from emp
group BY JOB
order by round(AVG(sal));

SELECT avg(sal) FROM EMP where deptno=10
union ALL
SELECT avg(sal) FROM EMP where deptno=20
union ALL
SELECT avg(sal) FROM EMP where deptno=30;

SELECT DEPTNO 부서코드,
 sum(sal) 합계,
 ROUND(AVG(SAL),2) 평균,
 COUNT(*) 인원수
 FROM emp
 group BY DEPTNO
 ORDER by DEPTNO;

 SELECT DEPTNO , JOB, ROUND(AVG(SAL),2)
 FROM emp
 group BY DEPTNO,JOB
 HAVING AVG(sal)>=2000
 ORDER by DEPTNO,JOB;

  SELECT DEPTNO , JOB, ROUND(AVG(SAL),2)
 FROM emp
where sal>=2000
 group BY DEPTNO,JOB
 ORDER by DEPTNO,JOB;

--부서별 직책의 평균 급여가 500이상인 사원들의 부서,직책의 평균급여 출력
 SELECT DEPTNO,ROUND(AVG(SAL),2),job
 FROM EMP
  group BY DEPTNO,JOB
   HAVING AVG(sal)>=500
    ORDER by DEPTNO,JOB;

 SELECT DEPTNO 부서번호,ROUND(AVG(SAL),0) 평균,MIN(SAL)최저,MAX(SAL)최고
 FROM EMP
  group BY DEPTNO;

  SELECT JOB,COUNT(ENAME)
  FROM EMP
   group BY JOB
   HAVING COUNT(ENAME)>=3;

  SELECT TO_CHAR(HIREDATE,'yyyy') 입사일,count(*)
  FROM EMP
   group BY TO_CHAR(HIREDATE,'yyyy');


   SELECT 
CASE 
WHEN comm is null THEN 'x'
WHEN comm = 0 THEN'x '
WHEN comm > 0 THEN 'o' 
 END as 추가수당
 FROM EMP;

 SELECT NVL2(COMM,'o','x'),COUNT(*)
 FROM EMP
 GROUP BY NVL2(COMM,'o','x');
 
  SELECT DEPTNO,TO_CHAR(HIREDATE,'yyyy'),MAX(SAL),SUM(SAL),AVG(sal)
  FROM EMP
   group BY TO_CHAR(HIREDATE,'yyyy'),DEPTNO
   order by TO_CHAR(HIREDATE,'yyyy');

   SELECT * FROM EMP;

   --조인 : 두개 이상의 테이블에서 데이터를 가져와 연결하는데 사용
   --RDMS 에서 테이블 설계시 무결성 원칙으로 인해 동일한 정보가 여러군데 존재하면 안되기 떄문에
   --필연적으로 테이블을 관리 목적에 맞게 설계

   SELECT * FROM DEPT;
   SELECT * 
   FROM DEPT d ,EMP e
   WHERE d.DEPTNO = e.DEPTNO;

   SELECT COUNT(*),E.DEPTNO
   FROM DEPT d ,EMP e
   WHERE d.DEPTNO = e.DEPTNO
   group by e.DEPTNO;
--조인 종류 : 두 개 이상의 테이블을 하나의 테이블처럼 가로로 늘려서 출력하기 위해 사용
--조인은 대상 데이터를 어떻게 연결하느냐에 따라 등가,비등가,자체,외부 조인으로 구분
--등가 조인 : 테이블을 연결한 후 출력 행을 각 테이블의 특정 열에 이치한 데이터를 기준으로 서점하는 방법
--등가 조인에는 안시(ANSI) 조인과 오라클 조인이 있음


---ANSI 조인
SELECT EMPNO,ENAME,E.DEPTNO,DNAME,LOC
FROM EMP e JOIN DEPT d
ON e.DEPTNO = d.DEPTNO
WHERE d.DEPTNO=10
order by d.DEPTNO;
   
  --오라클 조인
   --동등 조인,이너 조인--
   SELECT EMPNO,ENAME,E.DEPTNO,DNAME,LOC
FROM DEPT d,EMP E
where e.DEPTNO = d.DEPTNO
AND d.DEPTNO=10
order by d.DEPTNO;

   
   SELECT EMPNO,ENAME,E.DEPTNO,DNAME,LOC
FROM DEPT d,EMP E
where e.DEPTNO = d.DEPTNO
AND E.SAL>=3000
order by d.DEPTNO;

SELECT*
FROM DEPT d,EMP E
where e.DEPTNO = d.DEPTNO
AND E.SAL<=2500 AND E.EMPNO<=9999;

---ANSI 조인
SELECT*
FROM DEPT d JOIN EMP E
on e.DEPTNO = d.DEPTNO
where E.SAL<=2500 AND E.EMPNO<=9999;

--비등가 조인 : 동일 컬럼(열,레코드)가 없이 다른 조건을 사용하여 조인 할 때 사용
SELECT* FROM EMP;
SELECT* FROM SALGRADE;

SELECT e.ENAME,e.SAL ,s.GRADE
FROM EMP e,SALGRADE S
where e.SAL BETWEEN s.LOSAL and s.HISAL;  --비등가 조인
--ANSI 조인으로~
SELECT  ENAME,SAL ,GRADE
FROM SALGRADE s JOIN EMP E
on E.SAL BETWEEN LOSAL and HISAL;

--자체 조인 : SELF 조인- 같은 테이블을 두 번 사용하여 자체 조인
-- ENP 테이블에서 직송상관의 사원번호는 MGR에 있음
-- MRG를 이용해서 상관의 이름을 알아내기 위해서 사용할 수 있음
SELECT * FROM EMP;
SELECT e1.empno,e1.ename,e1.mgr,
e2.empno as MGR_EMPNO,
e2.ename as MGR_EMPNO
FROM EMP E1,EMP e2
where e1.MGR = e2.EMPNO;

--외부 조인 : 동등 조인의 경우 한쪽의 갈럼이 없으면 해당 행으로 표시되지 않음
--외부 조인은 내부 조인과 다르게 다른 한쪽에 값이 없어도 출력 됨
--외부 조인은 동등 조인 조건을 만족하지 못해 누락되는 행을 출력하기 위해 사용

INSERT  INTO EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9000,'장원영','SALESMAN',7698,SYSDATE,2000,1000,NULL);

--외쪽기준 외부 조인 사용하기
SELECT ENAME,e.DEPTNO,d.DNAME
FROM EMP e , DEPT D
where e.DEPTNO = d.DEPTNO(+)
ORDER by e.DEPTNO;
--오른쪽 기준 외부 조인
SELECT e.ename,e.deptno,d.DNAME
FROM EMP e,DEPT D
where e.DEPTNO(+) = d.DEPTNO
ORDER by e.DEPTNO;

--SQL-99 표준문법으로 배우는 ANSI 조인
--NATURAL JOIN : 등가 조인 대신 사용,자동으로 같은 열을 찾아서 조인 해줌
SELECT EMPNO,ENAME,DNAME
FROM EMP NATURAL JOIN DEPT;
SELECT *
FROM EMP ;
SELECT *
FROM EMP NATURAL JOIN DEPT;

--JOIN ~ SUING : 등가 조인을 대신해서 사용
SELECT