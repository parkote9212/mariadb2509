-- join

-- innerjoin
USE sqldb;
SELECT *
	FROM buyTBL
	 INNER JOIN userTBL
	 	ON buytbl.userID = usertbl.userID
	WHERE buytbl.userID = 'JYP';
	
SELECT buytbl.userID, NAME, prodname, addr, CONCAT(mobile1, mobile2) AS '연락처'
	FROM buytbl
		INNER JOIN usertbl
			ON buytbl.userID = usertbl.userid;
			
-- 어느 테이블에서 가져왔는지 참조값을 명확히 하는것도 방법이다.
SELECT buytbl.userID, usertbl.name, buytbl.prodName, usertbl.addr,
	CONCAT(usertbl.mobile1, usertbl.mobile2) AS '연락처'
	FROM buytbl
		INNER JOIN usertbl
			ON buytbl.userID = usertbl.userid;
			
-- as를 활용하자
SELECT B.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM buytbl B
		INNER JOIN usertbl U
			ON B.userID = U.userID
	WHERE b.userid = 'JYP';			

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM usertbl U
		INNER JOIN buytbl B
			ON U.userID = B.userID
		ORDER BY U.userID;
		
SELECT DISTINCT U.userID, U.name, U.addr
	FROM usertbl U
		INNER JOIN buytbl B
			ON U.userID = B.userID
		ORDER BY U.userID;
		
SELECT U.userID, U.name, U.addr
	FROM usertbl U
	WHERE EXISTS (
		SELECT *
		FROM buytbl B
		WHERE U.userID = B.userID );
		