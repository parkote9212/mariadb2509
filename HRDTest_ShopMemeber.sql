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

-- ShopMember 데이터 삽입
INSERT INTO ShopMember (CustName, Phone, Address, JoinDate, Grade, City) VALUES
('김철수', '010-1111-2222', '서울시 강남구 역삼동', '2022-01-10', 'A', '01'),
('박영희', '010-2222-3333', '부산시 해운대구 우동', '2022-02-15', 'B', '02'),
('이민준', '010-3333-4444', '대구시 수성구 범어동', '2022-03-20', 'C', '03'),
('최서연', '010-4444-5555', '인천시 연수구 송도동', '2022-04-25', 'A', '04'),
('정하윤', '010-5555-6666', '광주시 서구 치평동', '2022-05-30', 'B', '05'),
('윤지호', '010-6666-7777', '대전시 유성구 도룡동', '2022-06-05', 'C', '06'),
('강은서', '010-7777-8888', '울산시 남구 신정동', '2022-07-11', 'A', '07'),
('조민서', '010-8888-9999', '수원시 영통구 이의동', '2022-08-16', 'B', '08'),
('오서준', '010-9999-0000', '성남시 분당구 정자동', '2022-09-21', 'C', '09'),
('장하은', '010-1234-5678', '고양시 일산서구 주엽동', '2022-10-26', 'A', '10');

-- Sale 데이터 삽입
INSERT INTO Sale (CustNo, PCost, Amount, Price, PCode) VALUES
(1, 5000, 2, 10000, 'P01'),
(2, 8000, 1, 8000, 'P02'),
(3, 3000, 5, 15000, 'P03'),
(1, 12000, 1, 12000, 'P01'), -- 김철수 추가 구매
(4, 7500, 3, 22500, 'P04'),
(5, 4000, 4, 16000, 'P02'),
(2, 25000, 1, 25000, 'P05'), -- 박영희 추가 구매
(6, 1500, 10, 15000, 'P03'),
(7, 9000, 2, 18000, 'P04'),
(3, 6000, 3, 18000, 'P01'), -- 이민준 추가 구매
(8, 11000, 1, 11000, 'P02'),
(9, 5500, 2, 11000, 'P05'),
(10, 1000, 20, 20000, 'P03'),
(1, 15000, 1, 15000, 'P01'), -- 김철수 추가 구매
(4, 8500, 2, 17000, 'P04'), -- 최서연 추가 구매
(5, 4500, 3, 13500, 'P02'), -- 정하윤 추가 구매
(8, 30000, 1, 30000, 'P05'), -- 조민서 추가 구매
(10, 6500, 2, 13000, 'P03'), -- 장하은 추가 구매
(6, 13000, 1, 13000, 'P01'), -- 윤지호 추가 구매
(7, 7000, 4, 28000, 'P04'); -- 강은서 추가 구매


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
	ON M.CustNo = S.CustNo
	GROUP BY M.CustNo, M.CustName;
	
-- 데이터 수정/ 삭제

UPDATE shopmember
SET grade = 'A'
WHERE CustName = '이순신';

-- CustNo 3인 고객삭제
UPDATE sale
SET CustNo = null
WHERE CustNo = 3;

DELETE FROM ShopMember
WHERE CustNo = 3;