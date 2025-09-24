-- ANY/ALL/some 서브쿼리

SELECT NAME, height FROM usertbl WHERE height > 177;
-- 서브쿼리 사용시
SELECT NAME, height FROM usertbl
	WHERE height > (SELECT height FROM usertbl WHERE NAME = '김경호');

-- 참조값이 2개의 값을 반환하기 때문에 오류발생
-SELECT NAME,  height FROM usertbl
	WHERE height >= (SELECT height FROM usertbl WHERE addr = '경남');
	
-- ANY구문 사용 > or과 비슷 조건에 맞는 값을 전부 반환한다.
SELECT NAME, height FROM usertbl
	WHERE height >= ANY (SELECT height FROM usertbl where addr = '경남');
	
-- ALL구문 사용 > and와 비슷 조건에 모두 맞는 값을 반환한다.

SELECT NAME, height FROM usertbl
	WHERE height >= ALL (SELECT height FROM usertbl WHERE addr = '경남');
	
-- ANY구문 =any와 in(서브쿼리)
SELECT NAME, height FROM usertbl
	WHERE height IN (SELECT height FROM usertbl WHERE addr = '경남');
