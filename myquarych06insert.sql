-- DML 데이터를 조작
-- SELECT, INSERT, UPDATE, DELETE
-- DDL 데이터베이스 개채 관리
-- CREATE, DROP<ALTER
-- DCL 사용자권한
-- GRANT/REVOKE/DENY

-- 데이터의 변경을 위한 SQL문
-- INSERT
USE sqldb;
CREATE TABLE testtbl1 (id INT, username CHAR(3), age INT);
INSERT INTO testtbl1 values (1, '홍길동', 25);

-- 생략한 값에 null이 들어간다.
INSERT INTO testtbl1(id, username) values (2, '설현');

-- 열의 순서를 바꾸고 싶을떄는 바꿀 순서에 맞춰 열 이름 나열
INSERT INTO testtbl1(username, age , id) VALUES ('초아',26,3);

-- 자동 증가 auto_increment primary key 또는 unique로 지정 필요 숫자 형식만 사용 null값을 지정하면 자동으로 값이 입력

USE sqldb;
CREATE TABLE testtbl2
	(id INT AUTO_INCREMENT PRIMARY KEY,
	userName CHAR(3),
	age INT);
INSERT INTO testTBL2 VALUES (NULL, '지민', 25);
INSERT INTO testtbl2 VALUES (NULL, '유나', 22);
INSERT INTO testtbl2 values (NULL, '유경', 21);
select * FROM testtbl2;

-- auto값 변경시 alter사용
ALTER TABLE testtbl2 AUTO_INCREMENT=100;
INSERT INTO testtbl2 VALUES (NULL, '찬미', 23);
SELECT * FROM testtbl2;

-- 초기값을 1000으로 하고 증가값은 3으로 변경하는 예제
USE sqldb;
CREATE TABLE testtbl3
	(id INT AUTO_INCREMENT PRIMARY KEY,
	userName CHAR(3),
	age INT);
	ALTER TABLE testtbl3 AUTO_INCREMENT=1000;
	SET @@AUTO_INCREMENT_increment=3;
	INSERT INTO testtbl3 VALUES (NULL,'나연',20);
	INSERT INTO testtbl3 VALUES (NULL,'정연',18);
	INSERT INTO testtbl3 VALUES (NULL,'모모',19);
	SELECT * FROM testtbl3;
	
	-- 대량의 샘플 데이터 생성 insert into selecct from
	USE sqldb;
	CREATE TABLE testtbl4 (id INT, Fname VARCHAR(50), Lname VARCHAR(50));
	INSERT INTO testtbl4
		SELECT emp_no, first_name, last_name
			FROM employees.employees ;
			
	-- 데이터의 수정 : update
	
	UPDATE testtbl4
		SET Lname = '없음'
		WHERE Fname = 'kyoichi';
		
		SELECT * FROM testtbl4 WHERE fname = 'kyoichi';
		
-- 전체 업데이트 (주의 실무에서 큰 실수 할수 있음)
USE sqldb;
UPDATE buytbl2 SET price = price * 1.5;


-- 데이터의 삭제 delet from
USE sqldb;
DELETE FROM testtbl4 WHERE fname = 'Aamer';

--상위 몇건만 삭제시 limit사용
DELETE FROM testtbl4 WHERE Fname = 'Mary' LIMIT 5;

--대용량의 테이블 삭제
USE sqldb;
create TABLE bigtbl1 (SELECT * FROM employees.employees);
create TABLE bigtbl2 (SELECT * FROM employees.employees);
create TABLE bigtbl3 (SELECT * FROM employees.employees);

DELETE FROM bigTbl1; -- DML문 delete는 트랜잭션 로그 기록작업 affected rows 표시
DROP TABLE bigTbl2; -- DDL문 테이블 자체 삭제
TRUNCATE TABLE bigtbl3; -- 트랜잭션로그 미기록 테이블 구조남김

-- 조건부 데이터 입력, 변경
USE sqldb;
create TABLE membertbl (SELECT userid, NAME , addr FROM usertbl LIMIT 3); -- 3건만 가져옴
ALTER TABLE membertbl
	ADD CONSTRAINT  pk_membertbl PRIMARY KEY (userid); -- pk를 지정
SELECT * FROM membertbl;

-- INsert ignore 여러건 입력시에 오류가 발생해도 무시하고 계속 진행
INSERT IGNORE INTO membertbl VALUES('BBK', '비비코', '미국');
INSERT IGNORE INTO membertbl VALUES('SJH', '서장훈', '서울');
INSERT IGNORE INTO membertbl VALUES('HJY', '현주엽', '경기');
SELECT * FROM membertbl;

-- 기본키 중복시 업데이트
INSERT INTO membertbl VALUES('BBK', '비비코', '미국')
	ON DUPLICATE KEY UPDATE NAME = '비비코', addr = '미국';
INSERT INTO membertbl VALUES('DJM', '일이삼', '일본')
	ON DUPLICATE KEY UPDATE NAME = '일이삼', addr = '일본';
SELECT * FROM membertbl;