USE sqldb;
-- db내 테이블을 외부 파일로 저장
SELECT * INTO OUTFILE 'D:/s08_mariadb/userTBL.txt' FROM usertbl;

CREATE TABLE membertbl LIKE usertbl;
LOAD DATA LOCAL INFILE 'D:/s08_mariadb/userTBL.txt' INTO TABLE membertbl;
SELECT * FROM membertbl;