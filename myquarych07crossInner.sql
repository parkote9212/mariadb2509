-- cross join

USE sqldb;
SELECT *
	FROM buyTbl
		CROSS JOIN usertbl;
		
USE employees;
SELECT COUNT(*) AS '데이터개수'
	FROM employees
		CROSS JOIN departments;
		
		
USE sqlDB;
CREATE TABLE empTbl (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8));

INSERT INTO emptbl VALUES(N'나사장',NULL,'0000');
INSERT INTO emptbl VALUES(N'김재무',N'나사장','2222');
INSERT INTO emptbl VALUES(N'김부장',N'김재무','2222-1');
INSERT INTO emptbl VALUES(N'이부장',N'김재무','2222-2');
INSERT INTO emptbl VALUES(N'우대리',N'이부장','2222-2-1');
INSERT INTO emptbl VALUES(N'지사원',N'이부장','2222-2-2');
INSERT INTO emptbl VALUES(N'이영업',N'나사장','1111');
INSERT INTO emptbl VALUES(N'한과장',N'이영업','1111-1');
INSERT INTO emptbl VALUES(N'최정보',N'나사장','3333');
INSERT INTO emptbl VALUES(N'윤차장',N'최정보','3333-1');
INSERT INTO emptbl VALUES(N'이주임',N'윤차장','3333-1-1');

SELECT A.emp AS '부하직원' , B.emp AS '직속상관', B.empTel AS '직속상환연락처'
	FROM emptbl A
		INNER JOIN emptbl B
		 ON A.manager = B.emp
	WHERE A.emp = '우대리';