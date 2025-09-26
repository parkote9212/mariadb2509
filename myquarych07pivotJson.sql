USE sqldb;
CREATE TABLE pivotTest
	(	uName CHAR(3),
		season CHAR(2),
		amount INT );
		
INSERT INTO pivotTest VALUES
('김범수', '겨율', 10), ('윤종신', '여름', 15), ('김범수', '가을', 25), ('김범수', '봄', 3),
('김범수', '봄', 37), ('윤종신', '겨울', 40), ('김범수', '여름', 14), ('김범수', '겨울', 22),
('윤종신', '여름', 64);
SELECT * FROM pivotTest;

--  피벗 테이블
SELECT uName,
SUM(if(season='봄', amount, 0)) AS '봄',
SUM(if(season='여름', amount, 0)) AS '여름',
SUM(if(season='가을', amount, 0)) AS '가을',
SUM(if(season='겨울', amount, 0)) AS '겨울',
SUM(amount) AS '합계' FROM pivottest GROUP BY uname;

-- json
USE sqldb;
SELECT JSON_OBJECT('name', NAME, 'height', height) AS 'json 값'
	FROM usertbl
	WHERE height >= 180;
	
SET @JSON='{"userTBL" :
	[
		{"name":"임재범","height":182},
		{"name":"이승기","height":182},
		{"name":"성시경","height":186}
	]
}';
-- JSON 형식 확인
SELECT JSON_VALID(@JSON);
-- 주어진 문자열의 위치 반환
SELECT JSON_SEARCH(@JSON, 'one', '성시경');
-- 지정된 위치의 값을 추출
SELECT JSON_EXTRACT(@JSON, '$.userTBL[2].name');
-- 새로운 값 추가
SELECT JSON_INSERT(@JSON, '$.userTBL[0].mDate', '2009-09-09');
-- 수정
SELECT JSON_REPLACE(@JSON, '$.userTBL[0].name', '홍길동');

SELECT json_remove(@JSON, '$.userTBL[0]');