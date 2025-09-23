employeestrg_deletedMemberTBLUSE shopdb;
-- Db삭제후 백업 진행
SELECT * FROM producttbl;
--트리거
BEGIN 
	
	INSERT INTO deletedMemberTBL 
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE() ); 
END

-- 문자찾기
SELECT * FROM `shopdb`.`membertbl` WHERE LOWER(CONVERT(`memberID` USING utf8mb4)) LIKE '%지운이%' OR LOWER(CONVERT(`memberName` USING utf8mb4)) LIKE '%지운이%' OR LOWER(CONVERT(`memberAddress` USING utf8mb4)) LIKE '%지운이%' ;
SELECT * FROM `shopdb`.`uv_membertbl` WHERE LOWER(CONVERT(`memberName` USING utf8mb4)) LIKE '%지운이%' OR LOWER(CONVERT(`memberAddress` USING utf8mb4)) LIKE '%지운이%' ;

--
USE employees;
SELECT * FROM employees;

-- useshopDB;
USE shopdb;
SELECT *
FROM membertbl;

-- ch05 4-1
USE shopdb;
CREATE TABLE test (id INT);
INSERT INTO test VALUES(1);

USE employees;
`emp_no` LIKE '%mary%' OR CAST(`birth_date` AS CHAR) LIKE '%mary%' OR `first_name` LIKE '%mary%' OR `last_name` LIKE '%mary%' OR `gender` LIKE '%mary%' OR CAST(`hire_date` AS CHAR) LIKE '%mary%';