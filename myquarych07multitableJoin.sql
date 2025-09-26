-- 3개 테이블 조인
USE sqldb;
CREATE TABLE stdTbl
	(	stdName VARCHAR(10) NOT NULL PRIMARY KEY ,
		addr CHAR(4) 
	);
	
CREATE TABLE clubTbl
	( clubName VARCHAR(10) NOT NULL PRIMARY KEY,
		roomNo CHAR(4) NOT null
	);
	
CREATE TABLE stdclubTbl
	(	num INT AUTO_INCREMENT NOT null PRIMARY KEY,
		stdName VARCHAR(10) NOT NULL,
		clubName VARCHAR(10) NOT NULL,
	FOREIGN KEY(stdName) REFERENCES stdTBL(stdName),
	FOREIGN KEY(clubName) REFERENCES clubTBL(clubName)
	);
	
INSERT INTO stdTbl VALUES (N'김범수',N'경남'), (N'성시경',N'서울'), (N'조용필',N'경기'),
	(N'은지원', N'경북'),(N'바비킴', N'서율');
	
INSERT INTO clubTbl VALUES (N'수영', N'101호'),(N'바둑', N'102호'),(N'축구', N'103호'),
	(N'봉사', N'104호');
	
INSERT INTO stdclubTbl VALUES (NULL, N'김범수', N'바둑'), (NULL, N'김범수', N'축구'),
	(NULL, N'조용필', N'축구'), (NULL, N'은지원', N'축구'), (NULL, N'은지원', N'봉사'),
	(NULL, N'바비킴', N'봉사');
	

SELECT S.stdName, S.addr, C.clubName, C.roomNo
	FROM stdTbl S
		INNER JOIN stdclubTbl SC
			ON S.stdName = SC.stdName
		INNER JOIN clubTbl c
			ON SC.clubName = C.clubName
		order BY C.clubName;
		
