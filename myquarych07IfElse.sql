USE sqldb;
SELECT stdName, addr FROM stdTbl
	UNION all
SELECT clubName, roomNo FROM clubtbl;


-- UNION 조건문

SELECT NAME, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
	WHERE NAME NOT IN ( SELECT NAME FROM usertbl WHERE mobile1 IS NULL);
	
	
-- 초기화
DROP PROCEDURE if EXISTS ifProc;
delimiter $$
CREATE PROCEDURE ifProc()
BEGIN
	DECLARE var1 INT;
	SET var1 =100;
	
	if var1 = 100 then
		SELECT '100입니다.';
	else
		SELECT `100이 아닙니다.`;
	END if;
END $$
delimiter ;
CALL ifProc();




DROP PROCEDURE if EXISTS ifProc2;
USE employees;

delimiter $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE hireDATE DATE;
	DECLARE currentDate date;
	DECLARE days INT;
	
	-- hire_date열의 결과를 hireDate에 대입
	SELECT hire_date INTO hireDate
		FROM employees.employees
		WHERE emp_no = 10001;
		
	SET currentDate = CURRENT_DATE();
	-- 날짜차이 일차이
	SET days = DATEDIFF(currentDate, hireDATE);
	
	if (days/365) >= 5 then
		SELECT CONCAT('입사한지 ', days, '일이나 지났습니다. 축하합니다!');
	else
		SELECT CONCAT('입사한지 ', days, '일밖에 안되었네요. 열심히 일하세요.');
	END if;
END $$
delimiter ;
CALL ifProc2();


DROP PROCEDURE if EXISTS ifProc3;
delimiter $$
create PROCEDURE ifProc3()
BEGIN
	DECLARE examScore INT;
	DECLARE credit CHAR(1);
	SET examScore = 77;
	
	if examScore >= 90 then
		SET credit = 'A';
	ELSEIF examScore >= 80 then
		SET credit = 'B';
	ELSEIF examScore >= 70 then
		SET credit = 'C';
	ELSEIF examScore >= 60 then
		SET credit = 'D';
	else
		SET credit = 'F';
	END if;
	SELECT CONCAT('취득점수 : ', examScore), CONCAT('학점 : ', credit);
END $$
delimiter ;
CALL ifProc3();

-- case 문으로 변환

DROP PROCEDURE if exists caseProc;
delimiter $$
CREATE PROCEDURE caseProc()
BEGIN
	DECLARE score INT;
	DECLARE credit CHAR(1);
	SET score = 77;
	
	case
		when score >= 90 then
			SET credit = 'A';
		when score >= 80 then
			SET credit = 'B';
		when score >= 70 then
			SET credit = 'C';
		when score >= 60 then
			SET credit = 'D';
		else
			SET credit = 'F';
		END case;
		SELECT CONCAT('취득점수 : ', score), CONCAT('학점 : ',credit);
	END $$
	delimiter ;
	CALL caseProc();