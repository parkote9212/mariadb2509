-- 테이블 복사 create table select

USE sqldb;
CREATE TABLE buytbl2 (SELECT * FROM buytbl);
SELECT * FROM buytbl2;

-- 일부열만 복사
CREATE TABLE buytbl3 (SELECT userid, prodname FROM buytbl);
SELECT * FROM buytbl3;

-- groupby having

SELECT userId, amount FROM buytbl ORDER BY userid;

-- 함계

SELECT userid, SUM(amount) FROM buytbl GROUP BY userId;

-- 별칭사용

SELECT userid AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
	FROM buytbl GROUP BY userid;
	
	
SELECT userid AS '사용자 아이디', SUM(price*amount) AS '총 구매액'
FROM buytbl GROUP BY userid;

-- 평균
USE SQLdb;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;

-- user별 평균  구매 갯수
SELECT userid, AVG(amount) AS '평균 구매 개수' FROM buytbl GROUP BY userid;

-- max,min
SELECT NAME, MAX(height), MIN(height) FROM usertbl GROUP BY NAME;

-- 서브쿼리와 조합을 하는 것이 비교적 수월
SELECT NAME, height
	FROM usertbl
	WHERE height = (SELECT MAX(height)FROM usertbl)
		OR height = (SELECT MIN(height)FROM usertbl);
		
-- 카운트
SELECT COUNT(*) FROM usertbl;

-- null 값 제외 검색
SELECT COUNT(mobile1) AS '휴대폰 사용자' FROM usertbl;

-- HAVING
USE sqldb;
SELECT userid AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buytbl
	GROUP BY userid;
	
-- having 집계합수에 대한 조건 검색시 사용 where 함수 사용시 에러
SELECT userid AS '사용자',  SUM(price *amount) AS '총구매액'
	FROM buytbl
	GROUP BY userid
	HAVING sum(price*amount) > 1000
	ORDER BY SUM(price*amount) ;
	
-- rollup 총합 또는중간 합계
SELECT num, groupname, SUM(price * amount) AS '비용'
	FROM buytbl
	GROUP BY groupname
	WITH ROLLUP;