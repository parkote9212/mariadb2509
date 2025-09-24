-- oder by 기본적으로 오름차순이다.
SELECT NAME, mDate FROM usertbl ORDER BY mdate;

-- 내림차순
SELECT NAME, mDate FROM usertbl ORDER BY mdate DESC;

-- 다중 필터
SELECT NAME, height FROM usertbl ORDER BY height DESC, NAME ASC;

-- 중복제거 distinct

SELECT addr FROM usertbl;
SELECT addr FROM usertbl ORDER BY Addr;

-- distincy 사용시
SELECT distinct addr FROM usertbl;

-- limits 사용
USE employees;
SELECT emp_no, hire_date FROM employees
ORDER BY hire_date ASC
LIMIT 5;
