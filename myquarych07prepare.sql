USE sqlDB;
PREPARE myQuery FROM 'select * from userTBL where userID = "EJW"';
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;

USE sqldb;
DROP TABLE if EXISTS myTable;
CREATE TABLE myTable (id INT AUTO_INCREMENT PRIMARY KEY, mdate DATETIME);

SET @CURDATE = CURRENT_TIMESTAMP();

PREPARE myQuery FROM 'insert into myTable values(null,?)';
EXECUTE myQuery USING @CURDATE;
DEALLOCATE PREPARE myQuery;

SELECT * FROM myTable;