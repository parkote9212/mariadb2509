USE HRDTest;

CREATE TABLE ShopMember (
    CustNo INT PRIMARY KEY AUTO_INCREMENT,
    CustName VARCHAR(30) NOT NULL,
    Phone VARCHAR(13) UNIQUE,
    Address VARCHAR(50),
    JoinDate DATE NOT NULL,
    Grade CHAR(1) CHECK(Grade IN ('A', 'B', 'C')),
    City CHAR(2)
);

CREATE TABLE Sale (
    SaleNo INT PRIMARY KEY AUTO_INCREMENT,
    CustNo INT,
    PCost INT,
    Amount INT,
    Price INT,
    PCode CHAR(3),
    FOREIGN KEY (CustNo) REFERENCES ShopMember(CustNo)
);

-- 1. 회원등록
INSERT INTO ShopMember VALUES
(NULL,'홍길동','010-1234-5678','서울시 강남구','2020-01-01', 'A', '01'),
(NULL,'이순신','010-2222-3333','부산시 해운대구','2021-03-15','B','02'),
(NULL,'강감찬','010-7777-8888','대구시 달서구', '2019-05-20','C','03');

-- 2. 회원조회
-- 고객등급이 A등급인 회원
SELECT CustName 이름, Phone 전화번호, JoinDate 가입일자, Grade 등급
FROM ShopMember
WHERE Grade = 'A';

-- 가입일자가 2020년 이후 회원
SELECT CUstName 이름, JoinDate 가입일자
FROM ShopMember
WHERE (JoinDate>=2020-01-01);

-- 3. 판매등록
INSERT INTO sale VALUES
(NULL, 1, 1000, 10, 10000, 'P01'),
(NULL, 2, 2000, 5, 10000, 'P02' ),
(NULL, 3, 1500, 7, 10500, 'P03' );

-- 4. 판매조회
SELECT M.CustNo 회원번호, M.CustName 회원성명, S.Price 총금액
FROM shopmember M
	INNER JOIN sale S
	ON M.CustNo = S.CustNo;
	
SELECT M.CustNo 회원번호, M.CustName 회원성명, Max(S.Price) 총금액
FROM shopmember M
	INNER JOIN sale S
	ON M.CustNo = S.CustNo;
	
-- 데이터 수정/ 삭제

UPDATE shopmember
SET grade = 'A'
WHERE CustName = '이순신';

-- 판매기록을 삭제하라는 말이 없으므로 

UPDATE sale
SET CustNo = null
WHERE CustNo = 3;

DELETE FROM ShopMember
WHERE CustNo = 3;