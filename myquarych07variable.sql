USE sqldb;

SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수 이름==>' ;

SELECT @myVar1 ;
SELECT @myVar2 + @myVar3;

SELECT @myVar4, NAME FROM userTbl WHERE height>180;

-- limit 변수활용

SET @myVar1 = 3;
PREPARE myQuery
	FROM 'select Name, height from userTbl order by height limit ?';
EXECUTE myQuery USING @myvar1;

-- 정수형변환
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;
-- 또는
SELECT CONVERT(AVG(amount) , SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;

SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)),'=') AS
	'단가X수량',
	price*amount AS '구매액'
	FROM buytbl;