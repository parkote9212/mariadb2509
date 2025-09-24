-- where
SELECT * FROM usertbl WHERE NAME = '김경호';

-- 1970년 이후 출생하고, 신장이 1882이상인 사람의아이디와 이름을 조회해보자.

SELECT userID, NAME FROM usertbl WHERE birthyear >= 1970 AND height >= 182;

-- 1970년 이후 출생했거나, 신장이 182이상인 사람의 아이디와 이름 조회
SELECT userid, NAME FROM usertbl WHERE birthyear >= 1970 OR height >= 182;

-- between and, in() like
-- 키가 180-183인 사람을 조회
select NAME, height FROM usertbl WHERE height >=180 AND height <= 183;

-- between 사용
SELECT NAME, height FROM usertbl WHERE height BETWEEN 180 AND 183;

-- 연속된 값에만 between 사용할수 있다.
SELECT NAME, addr FROM usertbl WHERE addr='경남' OR addr='전남' OR addr='경북';

-- 위와 동일하게 연속된값이 아닌 이산적인 값을 위해 IN()을 사용하자
SELECT NAME, addr FROM usertbl WHERE addr IN('경남','전남','경북');

-- 문자열 검색 LIKE
SELECT NAME, height FROM usertbl WHERE NAME LIKE '김%';

-- 한글자 매치시 _사용
SELECT NAME, height FROM usertbl WHERE NAME LIKE '_종신';

