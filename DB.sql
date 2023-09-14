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


