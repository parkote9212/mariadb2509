USE sqldb;
SELECT U.userId, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM usertbl U
		LEFT OUTER JOIN buytbl B
			ON U.userID = B.userID
		ORDER BY U.userID;
		
SELECT U.userId, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM usertbl U
		RIGHT OUTER JOIN buytbl B
			ON U.userID = B.userID
		ORDER BY U.userID;

-- NULL값 참조		
SELECT U.userId, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
	FROM usertbl U
		LEFT OUTER JOIN buytbl B
			ON U.userID = B.userID
		WHERE B.prodName IS NULL
		ORDER BY U.userID;
		
-- 3개 테이블 inner join outter join

USE sqldb;

SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		LEFT OUTER JOIN stdclubtbl SC
			ON S.stdName = SC.stdName
		LEFT OUTER JOIN clubtbl C
			ON SC.clubName = C.clubName
		ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
	FROM stdTBL S
		LEFT OUTER JOIN stdclubTBL SC
			ON sc.stdName = S.stdName
		RIGHT OUTER join clubTBL C
			ON sc.clubName = C.clubName
		ORDER BY C.clubName;
		
-- union 사용하여 합치기

SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		LEFT OUTER JOIN stdclubtbl SC
			ON S.stdName = SC.stdName
		LEFT OUTER JOIN clubtbl C
			ON SC.clubName = C.clubName
UNION
SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		LEFT OUTER JOIN stdclubtbl SC
			ON S.stdName = SC.stdName
		Right OUTER JOIN clubtbl C
			ON SC.clubName = C.clubName;
