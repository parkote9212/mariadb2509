USE sqldb;
-- row_num을 통해서 순위칸을 추가한다.
SELECT ROW_NUMBER() OVER(ORDER BY height DESC, NAME asc) "키큰순위", NAME, addr, height FROM usertbl;

-- 지역별 순위 partition by절
SELECT addr, ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height BY height DESC, NAME ASC)

-- 같은 등수 
SELECT DENSE_RANK() OVER(ORDER BY height DESC) "키큰순위", NAME, addr, height FROM usertbl;

-- rank 함수
SELECT RANK() OVER(ORDER BY height DESC) "키큰순위", NAME, addr, height FROM usertbl;

SELECT NTILE(2) OVER(ORDER BY height DESC) "반번호", NAME, addr, height FROM usertbl;

SELECT NTILE(4) OVER(ORDER BY height DESC) "반번호", NAME, addr, height FROM usertbl;

-- 분석 함수
USE sqldb;
-- 차이표시

-- 다음 값과 비교
SELECT NAME, addr, height AS "키",
	height - (LEAD(height, 1) OVER (ORDER BY height DESC)) AS "다름 사람과 키 차이"
	FROM usertbl;

-- 이전 값과 비교
SELECT NAME, addr, height AS "키",
	height - (lag(height, 1) OVER (ORDER BY height DESC)) AS "이전  사람과 키 차이"
	FROM usertbl;
	
-- 지역별 최대값과 비교
SELECT addr, NAME, height AS "키",
	height - ( FIRST_VALUE(height) over (PARTITION BY addr ORDER BY height DESC) )
		AS "지역별 최대키와 차이"
	FROM usertbl;
	
	
-- 누적 합계

SELECT  addr, name, height AS "키",
     CAST( (CUME_DIST() OVER (PARTITION BY addr ORDER BY height DESC)) * 100 AS INTEGER) AS "누적인원 백분율%"
   FROM userTBL ;
   
   