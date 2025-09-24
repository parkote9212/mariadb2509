-- with cte
USE sqldb;
SELECT userid AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buytbl GROUP BY userid;
	
-- with 문 == 함수의 변수설정과 비슷하다
WITH abc(userid, total) -- cte 이름설정
AS -- as문에 내용 작성
(SELECT userid, SUM(price*amount)
	FROM buytbl GROUP BY userid)
-- cte 쿼리 사용
SELECT * FROM abc ORDER BY total DESC;

--쿼리 작성 -> with구문으로 묶는다 -> 
WITH cte_userTBL(addr, maxHeight)
AS
	( SELECT addr, MAX(height) FROM usertbl GROUP BY addr)
	SELECT AVG(maxHeight*1.0) AS '각 지역별 최고키의 평균' from cte_usertbl;