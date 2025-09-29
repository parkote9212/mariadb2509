USE sqldb;
SELECT userID, SUM(price*amount) AS '총구매액'
	FROM buyTBL
	GROUP BY userID
	ORDER BY SUM(price*amount) DESC;
	
SELECT B.userID, U.name, SUM(price*amount) AS '총구매액'
	FROM buytbl B
		INNER JOIN userTBL U
			ON B.userID = U.userID
	GROUP BY B.userID, U.name
	ORDER BY SUM(price*amount) DESC;
	
SELECT B.userID, U.name, SUM(price*amount) AS '총구매액'
	FROM buytbl B
		RIGHT outer JOIN userTBL U
			ON B.userID = U.userID
	GROUP BY B.userID, U.name
	ORDER BY SUM(price*amount) DESC;
	
SELECT U.userID, U.name, SUM(price*amount) AS '총구매액'
	FROM buytbl B
		RIGHT outer JOIN userTBL U
			ON B.userID = U.userID
	GROUP BY B.userID, U.name
	ORDER BY SUM(price*amount) DESC;
	
SELECT U.userID, U.name, SUM(price*amount) AS '총구매액',
	case
		when (SUM(price*amount) >= 1500) then '최우수고객'
		when (SUM(price*amount) >= 1000) then '우수고객'
		when (SUM(price*amount) >= 1) then '일반고객'
		ELSE '유령고객'
	END AS '고객등급'
	FROM buytbl B
		RIGHT outer JOIN userTBL U
			ON B.userID = U.userID
	GROUP BY B.userID, U.name
	ORDER BY SUM(price*amount) DESC;
	
	
	
DROP PROCEDURE if exists whileProc;
delimiter $$
CREATE PROCEDURE whileProc()
begin
	declare i INT;
	declare hap INT;
	SET i = 1;
	SET hap = 0;
	
		while (i <= 100) do
			SET hap = hap + i;
			SET i = i + 1;
		END while;
		
		SELECT hap;
END $$
delimiter ;
CALL whileProc();



DROP PROCEDURE if exists whileProc2;
delimiter $$
CREATE PROCEDURE whileProc2()
begin
	declare i INT;
	declare hap INT;
	SET i = 1;
	SET hap = 0;
	
-- label myWhile 지정
	myWhile: WHILE (i <= 100) 얘
		IF (i%7 = 0) then
		SET i = i + 1;
		ITERATE myWhile;
	END IF;
	
		SET hap = hap + i;
		if (hap > 1000) then
		
END $$
delimiter ;
CALL whileProc2();