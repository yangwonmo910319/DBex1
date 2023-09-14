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

