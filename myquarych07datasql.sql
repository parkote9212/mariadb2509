SELECT if (100>200, '참','거짓');
SELECT IFNULL(NULL, '널') 수식1, IFNULL(100, '널2') 수식2;

-- 두값이 같으면 null 반환
SELECT NULLIF(100,100) 수식1 , NULLIF(200,100) 수식2;


--연산자
SELECT	case 9
			when 1 then '일'
			when 2 then '이'
			when 10 then '십'
			ELSE '모름'
		END;
		
-- 문자열 함수
SELECT ASCII('A'), CHAR(65);

-- 문자크기 문자개수 반환
SELECT BIT_LENGTH('abc'), CHAR_LENGTH('abc'), LENGTH('abc');
SELECT BIT_LENGTH('가나다'), CHAR_LENGTH('가나다'), LENGTH('가나다');
-- 구분자 함께 문자열 이어준다
SELECT CONCAT_WS('/','2022', '01', '01');

-- 문자열 반환

SELECT ELT(2, '하나', '둘', '셋'), FIELD('둘', '하나', '둘', '셋'), FIND_IN_SET('둘','하나,둘,셋'), INSTR('하나둘셋','둘'), LOCATE('둘','하나둘셋');

SELECT FORMAT(123456.123456, 4);

SELECT BIN(31), HEX(31), OCT(31);

SELECT INSERT('abcdefghi', 3, 4, '@@@@'), INSERT('abcdefghi', 3, 2, '@@@@');

SELECT LEFT('abcdefghi', 3), RIGHT('abcdefghi', 3);

SELECT LOWER('abcdEFGH'), UPPER('abcdEFGH');

SELECT LPAD('이것이', 5, '##'), RPAD('이것이', 5, '##');

SELECT LTRIM('   이것이'), RTRIM('이것이   ');

SELECT TRIM('  이것이  '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');

SELECT repeat('이것이',3);

SELECT REPLACE('이것이 MariaDB다', '이것이', 'This is');

SELECT REVERSE ('MariaDB');

SELECT CONCAT('이것이', SPACE(10), 'Mariadb다');

SELECT SUBSTRING('대한민국만세', 3,2);

SELECT SUBSTRING_INDEX('cafe.naver.com','.',2), SUBSTRING_INDEX('cafe.naver.com','.',-2);

SELECT ABS(-100);

SELECT CEILING(4.7), FLOOR(4.7), ROUND(4.7);

-- 진수변환
SELECT CONV('AA', 16, 2), CONV(100,10,8);

SELECT DEGREES(PI()), RADIANS(180);

SELECT MOD(157,10), 157%10, 157 MOD 10;

SELECT POW(2,3), SQRT(9);

-- m<== 임의의 정수 <n 랜덤시  
SELECT RAND(), FLOOR(1+(RAND() * (7-1)) );